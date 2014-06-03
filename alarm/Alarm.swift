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
   
    var region:CLCircularRegion
    var media:MPMediaItem
    
    init( _region:CLCircularRegion, _media:MPMediaItem ) {
        region = _region
        media = _media
        
    }
    
}
