//
//  ApiService.swift
//  YouTube
//
//  Created by Ed McCormic on 7/30/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                    
                    
//                    let numbersArray = [1,2,3]
//                    let doubleNumberArray = numbersArray.map({return $0 * 2})
 //                   let stringsArray = numbersArray.map({return "\($0 * 2)"})
//                    print(doubleNumberArray)
                    
//                        var videos = [Video]()
//                        for dictionary in jsonDictionaries {
//                            
//                            let video = Video(dictionary: dictionary)
//                            videos.append(video)
//                        }
                    //let videos = jsonDictionaries.map({ return Video(dictionary: $0)})
                    
                    DispatchQueue.main.async(execute: {
                            completion(jsonDictionaries.map({ return Video(dictionary: $0)}))
                        })
                        
                    }
                
                
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
    
    
}

//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//
//var videos = [Video]()
//
//for dictionary in json as! [[String: AnyObject]] {
//    
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//    
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//    
//    let channel = Channel()
//    channel.name = channelDictionary["name"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//    
//    video.channel = channel
//    
//    videos.append(video)
//}
//DispatchQueue.main.async(execute: {
//    completion(videos)
//})
