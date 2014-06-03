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

class AlarmCreationViewController: UITableViewController  {

    /*
    IBOutlets
    */
    @IBOutlet var titleTextField : UITextField
    @IBOutlet var mapCell : UITableViewCell
    @IBOutlet var mapCellLabel : UILabel
    
    @IBOutlet var mediaCell : UITableViewCell
    @IBOutlet var mediaImageView : UIImageView

    /*
    Properties
    */
    

    
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
        
        
    }

    @IBAction func save(sender : AnyObject) {

    }

    
}
