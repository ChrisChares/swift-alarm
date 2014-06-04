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

class AlarmCreationViewController: UITableViewController, MPMediaPickerControllerDelegate, MapViewControllerDelegate  {

    /*
    IBOutlets
    */
    @IBOutlet var titleLabel : UITextField
    
    @IBOutlet var mapCell : UITableViewCell
    @IBOutlet var mapCellLabel : UILabel
    
    @IBOutlet var mediaCell : UITableViewCell
    @IBOutlet var mediaImageView : UIImageView

    /*
    Properties
    */
    
    var mediaItem:MPMediaItem?
    var region:CLCircularRegion?
    
    
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
        
        navigationController.presentingViewController.dismissViewControllerAnimated(true, completion: {});
        
    }

    @IBAction func save(sender : AnyObject) {
        
        if ( region == nil || mediaItem == nil || titleLabel.text.isEmpty ) {
            //validation failed
            return
        }
        
        
        var alarm = Alarm(title: titleLabel.text, region: region!, media: mediaItem!)

        
        navigationController.presentingViewController.dismissViewControllerAnimated(true, completion: {
            
            let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            
            appDelegate.addAlarm(alarm)
            
        });
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
        
        
        self.region = region
        mapCellLabel.text = "Region Selected"
        self.navigationController.popViewControllerAnimated(true)
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
      
        self.mediaItem = aMediaItem;
        //fillData(aMediaItem);
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
}
