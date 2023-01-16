//
//  UCLAApp.swift
//  UCLA
//
//  Created by Rohan Sehgal on 10/25/22.
//

import SwiftUI
import GoogleMobileAds

@main
struct UCLAApp: App {
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            //first time logging in , go to schoole Selector view
            //if school selector value is already set, then go to launch animation view
            //use the school selector value to be able to adjust the vontent view
            FirstTimeView()
        }
    }
}
