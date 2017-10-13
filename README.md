# Spotify-Login-iOS-Tutorial
This repository has been created to help you add the Spotify iOS SDK to your account. The goals are to enable login with Spotify account and generate account tokens to interact with Spotify API endpoints. This does not go into JSON parsing and etc.

Step 1: Follow steps to create an application at https://developer.spotify.com/my-applications/#!/applications

1a: Create Redirect URL
1b: Align your Bundle ID

Step 2: Open info.plist and edit the following attributes: 

- CFBundleURLName > Edit the [ your product name ] 
- CFBundleURLSchemes > Edit the [ your product name ]

Step 3: Go to Configs.swift and edit the Struct with your clientID, secretID, and redirectUrl. 

Step 4: App is set up. Run it and you should now be able to add Spotify SDK to app.

Pods Used
- Alamofire
- SwiftJSON

Download Spotify Frameworks here: https://github.com/spotify/ios-sdk

If you need any assistance follow tutorial here:
https://medium.com/@elonrubin/ios-spotify-sdk-swift-3-0-tutorial-b629af4b889d
