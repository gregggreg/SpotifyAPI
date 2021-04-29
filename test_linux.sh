docker run \
    --rm \
    --volume "$(pwd):/src" \
    --workdir "/src" \
    -e SPOTIFY_AUTHORIZATION_CODE_FLOW_TOKENS_UR=$SPOTIFY_AUTHORIZATION_CODE_FLOW_TOKENS_UR \
    -e SPOTIFY_AUTHORIZATION_CODE_FLOW_REFRESH_TOKENS_URL=$SPOTIFY_AUTHORIZATION_CODE_FLOW_REFRESH_TOKENS_URL \
    -e SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_TOKENS_URL=$SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_TOKENS_URL \
    -e SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_REFRESH_TOKENS_URL=$SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_REFRESH_TOKENS_URL \
    -e SPOTIFY_CLIENT_CREDENTIALS_FLOW_TOKENS_URL=$SPOTIFY_CLIENT_CREDENTIALS_FLOW_TOKENS_URL \
    -e SPOTIFY_SWIFT_TESTING_CLIENT_ID=$SPOTIFY_SWIFT_TESTING_CLIENT_ID \
    -e SPOTIFY_SWIFT_TESTING_CLIENT_SECRET=$SPOTIFY_SWIFT_TESTING_CLIENT_SECRET \
    swift:latest \
    /bin/bash -c \
    "swift test --filter 'AuthorizationScopesTests|CodingAuthInfoTests|CodingAuthorizationCodeFlowManagerTests|CodingAuthorizationCodeFlowPKCEManagerTests|CodingClientCredentialsFlowManagerTests|CodingCurrentlyPlayingContextTests|CodingPlaybackRequestTests|CodingSpotifyUserTests|CodingTimeReferenceTests|CodingTrackAttributesTests|CursorPagingObjectPlayHistoryCodingTests|ExampleContentTests|SpotifyAPIClientCredentialsFlowAlbumsTests|SpotifyAPIClientCredentialsFlowArtistTests|SpotifyAPIClientCredentialsFlowBrowseTests|SpotifyAPIClientCredentialsFlowClientAuthorizationTests|SpotifyAPIClientCredentialsFlowEpisodeTests|SpotifyAPIClientCredentialsFlowErrorTests|SpotifyAPIClientCredentialsFlowFollowTests|SpotifyAPIClientCredentialsFlowProxyFollowTests|SpotifyAPIClientCredentialsFlowInsufficientScopeTests|SpotifyAPIClientCredentialsFlowMarketTests|SpotifyAPIClientCredentialsFlowPlaylistsTests|SpotifyAPIClientCredentialsFlowProxyArtistTests|SpotifyAPIClientCredentialsFlowProxyAuthorizationTests|SpotifyAPIClientCredentialsFlowProxyInsufficientScopeTests|SpotifyAPIClientCredentialsFlowProxyRefreshTokensConcurrentTests|SpotifyAPIClientCredentialsFlowRefreshTokensConcurrentTests|SpotifyAPIClientCredentialsFlowSearchTests|SpotifyAPIClientCredentialsFlowShowTests|SpotifyAPIClientCredentialsFlowTrackTests|SpotifyAPIClientCredentialsFlowUserProfileTests|SpotifyIdentifierTests|SpotifyPlayerErrorCodingTests'"

# interactive:
#
# docker run \
#     --rm \
#     --volume "$(pwd):/src" \
#     --workdir "/src" \
#     -it \
#     -e SPOTIFY_DATA_DUMP_FOLDER="/logs" \
#     -e SPOTIFY_AUTHORIZATION_CODE_FLOW_TOKENS_UR=$SPOTIFY_AUTHORIZATION_CODE_FLOW_TOKENS_UR \
#     -e SPOTIFY_AUTHORIZATION_CODE_FLOW_REFRESH_TOKENS_URL=$SPOTIFY_AUTHORIZATION_CODE_FLOW_REFRESH_TOKENS_URL \
#     -e SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_TOKENS_URL=$SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_TOKENS_URL \
#     -e SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_REFRESH_TOKENS_URL=$SPOTIFY_AUTHORIZATION_CODE_FLOW_PKCE_REFRESH_TOKENS_URL \
#     -e SPOTIFY_CLIENT_CREDENTIALS_FLOW_TOKENS_URL=$SPOTIFY_CLIENT_CREDENTIALS_FLOW_TOKENS_URL \
#     -e SPOTIFY_SWIFT_TESTING_CLIENT_ID=$SPOTIFY_SWIFT_TESTING_CLIENT_ID \
#     -e SPOTIFY_SWIFT_TESTING_CLIENT_SECRET=$SPOTIFY_SWIFT_TESTING_CLIENT_SECRET \
#     swift:latest
