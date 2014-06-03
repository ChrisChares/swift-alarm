//
//  MasterViewController.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects: Alarm[] = []


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier? == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow()
            let object = objects[indexPath.row] as Alarm
           // ((segue.destinationViewController as UINavigationController).topViewController as DetailViewController).detailItem = object
        }
    }

    // #pragma mark - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let object = objects[indexPath.row] as Alarm
        cell.textLabel.text = object.title
        return cell
    }

    // #pragma mark - UITableViewDelegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let object = objects[indexPath.row] as Alarm
      //      self.detailViewController!.detailItem = object
        }
    }


}

