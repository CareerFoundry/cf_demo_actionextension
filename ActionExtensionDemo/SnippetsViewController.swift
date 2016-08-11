//
//  ViewController.swift
//  ActionExtensionDemo
//
//  Created by Hesham Abd-Elmegid on 7/12/16.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import UIKit

class SnippetsViewController: UITableViewController {
    let userDefaultsKey = "SnippetsUserDefaultsKey"
    
    var snippets: Array<String> {
        get {
            let userDefaults = NSUserDefaults.standardUserDefaults()
            if let links = userDefaults.objectForKey(userDefaultsKey) as! Array<String>? {
                return links
            }
            
            return []
        }
        set {
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(newValue, forKey: userDefaultsKey)
            userDefaults.synchronize()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

    @IBAction func tappedAddButton(sender: AnyObject) {
        performSegueWithIdentifier("ShowSnippetDetails", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let detailsViewController = navigationController.viewControllers[0] as! SnippetDetailsViewController
        detailsViewController.snippet = sender as? String
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snippets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SnippetCell", forIndexPath: indexPath)
        cell.textLabel?.text = snippets[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowSnippetDetails", sender: snippets[indexPath.row])
    }

}

