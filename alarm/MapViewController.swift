//
//  MapViewController.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit
import MapKit
import QuartzCore

protocol MapViewControllerDelegate {
    
    func returnedRegion( region:CLCircularRegion )
    
}

class MapViewController: UIViewController {
    
    
    @IBOutlet var mapView : MKMapView
    @IBOutlet var targetView : UIView
    
    init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func save(sender : AnyObject) {

    }


}
