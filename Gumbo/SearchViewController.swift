//
//  SearchViewController.swift
//  Gumbo
//
//  Created by Michael Westbrooks II on 10/3/17.
//  Copyright © 2017 RedRooster Technologies Inc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: UIViewController {
    
    var token : SPTSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMyProfile()
    }
    
    func getMyProfile() {
        let headers = [
            "Authorization" : "Bearer " + token.accessToken
        ]
        
        Alamofire.request("https://api.spotify.com/v1/me", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON {
            response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }
    
    func search(){
        let params = [
            "q" : "Jay Z",
            "type" : "artist"
        ]
         
         let headers = [
            "Authorization" : "Bearer " + token.accessToken
         ]
         
         Alamofire.request("https://api.spotify.com/v1/search", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON {
            response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
         
            if let json = response.result.value {
                print("JSON: \(json)")
            }
         
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }

}
