//
//  Alarm.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit
import CoreLocation
import MediaPlayer

class Alarm: NSObject {
   
    var title:String
    var region:CLCircularRegion
    var media:MPMediaItem
    
    init( title:String, region:CLCircularRegion, media:MPMediaItem ) {
        self.title = title
        self.region = region
        self.media = media
        
    }
    
}
