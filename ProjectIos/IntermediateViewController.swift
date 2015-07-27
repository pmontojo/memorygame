//
//  ViewController.swift
//  finalApp
//
//  Created by Paula Montojo on 4/5/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

import UIKit

class IntermediateViewController: UIViewController {
    var strV = "";
    var attempts = 0
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(strV == "Easy"){
            attempts = 6
        }
        
        if(strV == "Medium"){
            attempts = 11
        }
        
        if(strV == "Hard"){
            attempts = 8
        }
        var hey = "\(strV) level"
        var cuerp = "You have \(attempts) attempts"
        var cuerp2 = "and 20 seconds of time!"
        label.text = hey
        label2.text = cuerp
        label3.text = cuerp2
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButton(sender: UIButton) {
        //strV = sender.titleLabel!.text!;
        println("this is my string" + strV);
        
        self.performSegueWithIdentifier("mySegue", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        
        AnyObject?) {
            
            if segue.identifier == "mySegue"{
                let hola = segue.destinationViewController as CollectionViewController
                
                hola.stringValue = strV
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