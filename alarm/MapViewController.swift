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
    
    
    var delegate : MapViewControllerDelegate? = nil
    
    @IBOutlet var mapView : MKMapView
    @IBOutlet var targetView : UIView
    
    init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        targetView.layer.cornerRadius = 40.0
    }

    
    @IBAction func save(sender : AnyObject) {
        
        
        if ( delegate ) {
            
            var center = mapView.centerCoordinate
            var mkregion = mapView.convertRect(targetView.bounds, toRegionFromView: targetView)
            var span = mkregion.span.latitudeDelta  * 110000
            
            var region = CLCircularRegion(center: center, radius: span, identifier: "hurrrr")
            self.delegate!.returnedRegion(region)
        }
    }

    @IBAction func cancel(sender : AnyObject) {
        
        self.navigationController.presentingViewController.dismissViewControllerAnimated(true, completion: {});
    }


}
