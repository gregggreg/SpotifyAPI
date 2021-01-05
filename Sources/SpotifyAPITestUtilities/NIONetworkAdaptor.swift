import Foundation
import NIO
import NIOHTTP1
import AsyncHTTPClient

#if canImport(Combine)
import Combine
#else
import OpenCombine
#endif

public final class HTTTPClientManager {
    
    static let shared = HTTTPClientManager()
    
    public let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
    
    private init() { }
    
    deinit {
        try? self.httpClient.syncShutdown()
    }
    
    public func networkAdaptor(
        request: URLRequest
    ) -> AnyPublisher<(data: Data, response: URLResponse), Error> {
        
        // transform the dictionary to an array of tuples
        let headers: [(String, String)] = (request.allHTTPHeaderFields ?? [:])
            .map { key, value in return (key, value) }
        
        let httpRequest: HTTPClient.Request
        do {
            httpRequest = try HTTPClient.Request(
                url: request.url!,
                method: HTTPMethod.RAW(value: request.httpMethod!),
                headers: HTTPHeaders(headers),
                body: request.httpBody.map { HTTPClient.Body.data($0) }
            )
            
        } catch {
            return error.anyFailingPublisher()
        }
        
        return Future<(data: Data, response: URLResponse), Error> { promise in
            
            self.httpClient.execute(
                request: httpRequest
            ).whenComplete { result in
                
                do {
                    let response = try result.get()
                    
                    // transform the headers into a standard swift dictionary
                    let headers: [String: String] = response.headers
                        .reduce(into: [:], { dict, header in
                            dict[header.name] = header.value
                        })
                    
                    let httpURLResponse = HTTPURLResponse(
                        url: httpRequest.url,
                        statusCode: Int(response.status.code),
                        httpVersion: nil,
                        headerFields: headers
                    )!
                    
                    let data: Data
                    if let bytesBuffer = response.body?.readableBytesView {
                        data = Data(bytesBuffer)
                    }
                    else {
                        data = Data()
                    }
                    
                    promise(.success((data: data, response: httpURLResponse)))
                    
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
        
    }
    
}

