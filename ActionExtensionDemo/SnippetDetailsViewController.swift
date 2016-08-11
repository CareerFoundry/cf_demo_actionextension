//
//  SnippetDetailsViewController.swift
//  ActionExtensionDemo
//
//  Created by Hesham Abd-Elmegid on 7/15/16.
//  Copyright © 2016 CareerFoundry. All rights reserved.
//

import UIKit

class SnippetDetailsViewController: UIViewController {
    let userDefaultsKey = "SnippetsUserDefaultsKey"
    @IBOutlet weak var textView: UITextView!
    var snippet: String?
    
    var allSnippets: Array<String> {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let snippet = snippet {
            textView.text = snippet
            textView.editable = false
        }
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let snippet = textView.text where !allSnippets.contains(snippet){
            allSnippets.append(snippet)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
