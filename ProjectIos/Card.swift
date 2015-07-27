//
//  Card.swift
//  finalApp
//
//  Created by Paula Montojo on 4/5/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

//
//  Card.swift
//  SimpleCollections
//
//  Created by Paula Montojo on 3/5/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

import Foundation


import UIKit

class Card: UIView {
    
    var cardImageView:UIImageView = UIImageView()
    var cardValue:Int = 0
    // Card Value
    var cardNames: [String] = ["huevo", "mancha", "toaster", "sandia", "fresa", "naranja", "bread", "eaten","cerezas", "mrosa", "mmorada", "tartarosa", "tartamorada"]
    var isFlipped:Bool = false
    var isDone:Bool = false {
        
        didSet {
            // If the card is done then remeove the image
            if (isDone == true) {
                self.cardImageView.image = nil
            }
        }
    }
    
    override init() {
        super.init()
        
        //self.backgroundColor = UIColor.redColor()
        
        // Set translates autoresizingmask to false
        self.cardImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Set the default image for the imageview
        cardImageView.image = UIImage(named: "back")
        
        //Add the imageview to the view
        self.addSubview(self.cardImageView)
        
        //Set constrants for the imageview
        var heightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.cardImageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 170)
        
        var widthConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.cardImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 120)
        
        self.cardImageView.addConstraints([heightConstraint, widthConstraint])
        
        // set the position of the imageview
        var verticalConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.cardImageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        var horizontalConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.cardImageView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        
        self.addConstraints([horizontalConstraint, verticalConstraint])
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        
        // Call UIViews init with frame method and pass it the frame
        super.init(frame: frame)
    }
    
    func flipUp() {
        println("oliiii")
        // Set imageview to image that represents the card value
        self.cardImageView.image = UIImage(named: self.cardNames[self.cardValue])
        
        self.isFlipped = true
    }
    
    func flipDown() {
        // Set the imageview to the card back
        self.cardImageView.image = UIImage(named: "back")
        
        self.isFlipped = false
    }
}
