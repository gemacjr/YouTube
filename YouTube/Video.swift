//
//  Video.swift
//  YouTube
//
//  Created by Ed McCormic on 7/28/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import UIKit

class SafeJsonObject: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        let upperCasedFirstCharacter = String(key.characters.first!).uppercased()
        
        let range = key.startIndex..<key.characters.index(key.startIndex, offsetBy: 1)
        let selectorString = key.replacingCharacters(in: range, with: upperCasedFirstCharacter)
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        
        if !responds {
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
}



class Video: SafeJsonObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    var channel: Channel?
    
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "channel" {
            self.channel = Channel()
            self.channel?.setValuesForKeys(value as! [String: AnyObject])
            
        } else {
            super.setValue(value, forKey: key)
        }
        
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

class Channel: SafeJsonObject {
    var name: String?
    var profile_image_name: String?
}
