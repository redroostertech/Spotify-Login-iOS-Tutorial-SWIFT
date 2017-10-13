//
//  Configs.swift
//  Gumbo
//
//  Created by Michael Westbrooks II on 10/2/17.
//  Copyright © 2017 RedRooster Technologies Inc. All rights reserved.
//

import Foundation

struct Configs {
    struct SpotifyAPI {
        static let clientID: String = "[Enter Client Key]"
        static let secretID: String = "[Enter Secret Key]" 
        
        struct SpotifiyURLs {
            static let redirectUrl: URL = URL(string: "[app-name]://returnspotify")! // This needs to match the Redirect URL that you created at https://developer.spotify.com/my-applications/#!/applications
        }
    }
}
