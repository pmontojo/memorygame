//
//  ViewController.swift
//  finalApp
//
//  Created by Paula Montojo on 4/5/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var levelString = "";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButton(sender: UIButton) {
        levelString = sender.titleLabel!.text!;
        println("this is my string" + levelString);
        
        self.performSegueWithIdentifier("mySe", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        
        AnyObject?) {
            
            if segue.identifier == "mySe"{
                let hola = segue.destinationViewController as IntermediateViewController
                
                hola.strV = levelString
                //                vc.stringValue = levelString;
                
                
            }
            
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}


