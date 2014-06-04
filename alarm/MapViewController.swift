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
        
        //save
        if ( delegate ) {
            
            let center = mapView.centerCoordinate
            
            let targetViewRegion = mapView.convertRect(targetView.bounds, toRegionFromView: targetView)
            
            //every degree of latitude delta corresponds to 110km
            let radius = targetViewRegion.span.latitudeDelta  * 110 * 1000
            
            //create a unique UUID
            let uuid = NSUUID().UUIDString
            
            let region = CLCircularRegion(center: center, radius: radius, identifier: uuid)
            self.delegate!.returnedRegion(region)
        }
    }



}
