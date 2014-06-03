//
//  AlarmViewController.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreLocation

class AlarmViewController: UITableViewController, MPMediaPickerControllerDelegate, MapViewControllerDelegate  {

    /*
    Cells & their views
    */
    @IBOutlet var mapCell : UITableViewCell
    
    @IBOutlet var mediaCell : UITableViewCell
    @IBOutlet var mediaImageView : UIImageView
    
    @IBOutlet var alarmOnEntranceCell : UITableViewCell
    @IBOutlet var alarmOnExitCell : UITableViewCell
    
    
    /*
    Properties
    */
    
    var _mediaItem:MPMediaItem?
    var _region:CLCircularRegion?
    
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func cancel(sender : AnyObject) {
        
        navigationController.presentingViewController .dismissViewControllerAnimated(true, completion: {});
        
    }

    @IBAction func save(sender : AnyObject) {
        
        
        navigationController.presentingViewController .dismissViewControllerAnimated(true, completion: {});
    }

    /*
    #pragma mark - UITableViewDelegate
    */

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if ( cell == mediaCell ) {
            
            let mediaPicker = MPMediaPickerController(mediaTypes: .Music)
            mediaPicker.delegate = self
            mediaPicker.prompt = "Select any song!"
            mediaPicker.allowsPickingMultipleItems = false
            presentViewController(mediaPicker, animated: true, completion: {})
            
        } else if ( cell == alarmOnEntranceCell ) {
            
        } else if ( cell == alarmOnExitCell ) {
            
            //alarmOnExitCell.accessoryType = .None
        }
        
    }
    
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {

        if ( segue!.identifier == "map" ) {
            var mapVC = segue!.destinationViewController as MapViewController;
            mapVC.delegate = self;
        }
    }
    
    /*
    MapViewControllerDelegate
    */
    func returnedRegion(region: CLCircularRegion) {
        
        _region = region;
        self.navigationController.popViewControllerAnimated(true);
    }

    
    /*
    MPMediaPickerControllerDelegate
    */
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems  mediaItems:MPMediaItemCollection) -> Void
    {
        var aMediaItem = mediaItems.items[0] as MPMediaItem
        if ( aMediaItem.artwork ) {
            mediaImageView.image = aMediaItem.artwork.imageWithSize(mediaCell.contentView.bounds.size);
            mediaImageView.hidden = false;
        }
      
        _mediaItem = aMediaItem;
        //fillData(aMediaItem);
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
}
