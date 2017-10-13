//
//  ViewController.swift
//  Gumbo
//
//  Created by Michael Westbrooks II on 10/2/17.
//  Copyright © 2017 RedRooster Technologies Inc. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    let spotifiyGet = SpotifyRetrieval()
    var session: SPTSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spotifiyGet.retrieveToken(client: Configs.SpotifyAPI.clientID, redirect: Configs.SpotifyAPI.SpotifiyURLs.redirectUrl)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAfterFirstLogin), name: NSNotification.Name(rawValue: "loginSuccessfull"), object: nil)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        UIApplication.shared.open(spotifiyGet.loginUrl!, options: [:], completionHandler: {
            success in
            if !(success) {
                print("Error")
            }
        })
    }
    
    @objc func updateAfterFirstLogin() {
        print("Notification Observer called")
        self.session = sessionRet()
        self.performSegue(withIdentifier: "artistGo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "artistGo" {
            let vc = segue.destination as! SearchViewController
            vc.token = self.session
        }
    }
    
    func sessionRet() -> SPTSession {
        var returnObj: SPTSession!
        if let sessionObj = UserDefaults.standard.value(forKey: "SpotifySession") as? Any {
            if let sessionDataObj = sessionObj as? Data {
                let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
                returnObj = firstTimeSession
            } else {
                print("Not data type")
            }
        }
        return returnObj
    }
    
}

