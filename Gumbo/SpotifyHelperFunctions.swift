//
//  SpotifyHelperFunctions.swift
//  Gumbo
//
//  Created by Michael Westbrooks II on 10/2/17.
//  Copyright © 2017 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SpotifyRetrieval: NSObject {
    
    var auth = SPTAuth.defaultInstance()
    var loginUrl: URL?
    
    @objc func retrieveToken(client: String, redirect: URL) {
        auth?.redirectURL = redirect
        auth?.clientID = client
        auth?.requestedScopes = [SPTAuthStreamingScope, SPTAuthPlaylistReadPrivateScope, SPTAuthPlaylistModifyPublicScope, SPTAuthPlaylistModifyPrivateScope]
        loginUrl = auth?.spotifyWebAuthenticationURL()
    }

}
