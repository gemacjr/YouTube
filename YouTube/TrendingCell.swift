//
//  TrendingCell.swift
//  YouTube
//
//  Created by Ed McCormic on 7/30/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {

    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
