//
//  ViewController.swift
//  ParseSaveTest
//
//  Created by Rick Terrill on 9/1/15.
//  Copyright (c) 2015 Big Swing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if PFUser.currentUser() == nil {
            PFUser.logInWithUsername("test@test.com", password: "test")
        }
    }
    
    @IBAction func saveThingy() {
        // make a thingy
        var thingy = PFObject(className: "Thingy")
        thingy.setObject(true, forKey: "someBool")
        thingy.setObject("test", forKey: "someString")
        
        // persist a thingy
        thingy.saveEventually()
        thingy.pinInBackground()
        
        println("saved one")
    }
    
    @IBAction func updatePinned(sender: AnyObject) {
        var thingyQuery = PFQuery(className: "Thingy")
        thingyQuery.fromLocalDatastore()
        thingyQuery.whereKey("someBool", equalTo: true)
        
        thingyQuery.getFirstObjectInBackground().continueWithBlock { (task) -> AnyObject! in
            if let result = task.result as? PFObject {
                
                println("found one: " + (result.objectForKey("someString") as! String))
                if let oid = result.objectId {
                    println("it has an objectId: " + oid)
                }
                
                // update this thingy
                result.setObject(false, forKey: "someBool")
                
                result.saveEventually()
                result.pinInBackground()
                
                println("updated one")
            }
            
            return nil
        }
    }
}

