//
//  CollectionReusableView.swift
//  finalApp
//
//  Created by Paula Montojo on 4/5/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

import UIKit
import AVFoundation

class CollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var labele: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var label: UILabel!
    var timer:NSTimer!
    var timerSoundPlayer: AVAudioPlayer!
    var theBool:Bool!
    var countdown:Int = 21
    var isFinalTime:Bool = false
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            progress.setProgress(fractionalProgress, animated: animated)
        }
    }
    
    
    
    func funcToCallWhenStartLoadingYourWebview() {
        
        
        self.progress.progress = 0.0
        self.theBool = false
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerCallback", userInfo: nil, repeats: true)
    }
    
    func funcToCallCalledWhenUIWebViewFinishesLoading() {
        self.theBool = true
    }
    
    func timerCallback() {
        self.countdown -= 1
        self.label.text = String(countdown)
        
        if(self.countdown == 1){
            self.theBool = true
        }
        
        if(self.countdown == 5){
            self.labele.text = "Time is almost over!!"
        }
        if (self.theBool == true) {
            
            if self.progress.progress >= 1 {
                self.progress.hidden = true
                self.timer.invalidate()
            } else {
                self.progress.progress += 0.1
            }
        } else {
            self.progress.progress += 0.05
            if self.progress.progress >= 0.95 {
                self.progress.progress = 0.95
            }
        }
    }
    
    
    
    
    
    
    
    func startCount() {
        //  progressLabel.text = "0%"
        self.counter = 0
        for i in 0..<100{
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                sleep(1)
                dispatch_async(dispatch_get_main_queue(), {
                    self.counter++
                    return
                })
            })
        }
    }
    
    func prueba(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tUpdate()"), userInfo: nil, repeats: true)
        
    }
    
}

