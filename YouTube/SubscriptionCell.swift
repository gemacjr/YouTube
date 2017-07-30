//
//  SubscriptionCell.swift
//  YouTube
//
//  Created by Ed McCormic on 7/30/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {

    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
