//
//  Setting.swift
//  YouTube
//
//  Created by Ed McCormic on 7/29/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import UIKit

class Setting: NSObject {
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}


enum SettingName: String {
    case Cancel = "Cancel"
    case Settings = "Settings"
    case TermsPrivacy = "Terms & Privacy Policy"
    case SendFeedback = "Send Feedback"
    case Help = "Help"
    case SwitchAccount = "Switch Account"
}
