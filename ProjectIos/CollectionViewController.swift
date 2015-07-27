//
//  CollectionCollectionViewController.swift
//  SimpleCollections
//
//  Created by Paula Montojo on 1/4/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

import UIKit
import AVFoundation


let reuseIdentifier = "Cell"
let reuseIdentifier2 = "Top"
//var numbers = []
//var numbers = [1, 2, 3, 4, 5, 6, 7, 8]
//var names = [];
//var names = ["pink flower","blue flower","red flower","pink flower","blue flower","red flower"]

class CollectionViewController: UICollectionViewController, UITextFieldDelegate {
    @IBOutlet weak var countDownLabel: UILabel!
    
    var isFinalTime:Bool = false
    var countTemp: Int = 0
    var cards:[Card] = [Card]()
    var timerSoundPlayer: AVAudioPlayer!
    var loseSoundPlayer: AVAudioPlayer!
    var correctSoundPlayer:AVAudioPlayer!
    var wrongSoundPlayer:AVAudioPlayer!
    var shuffleSoundPlayer:AVAudioPlayer!
    var flipSoundPlayer:AVAudioPlayer!
    var winSoundPlayer:AVAudioPlayer!
    var stringKind: String = ""
    var revealedCard:Card?
    var gameModel = GameModel()
    var recogeImage: UIImage!
    // Timer Propertis
    var timer:NSTimer!
    var timer2:NSTimer!
    var level:String = ""
    // Countdown
    var countdowni:Int = 20
    var counting:Int = 3
    var timeReady:Bool = false
    var stringValue: String = ""
    var counter = 0
    var number = 0;
    var countClick = 0;
    //var timer
    //inicialmente todas deben ir a false
    var destaparRosa = 0
    var destaparRoja = 0
    var destaparAzul = 0
    var destaparRisa = 0
    var destaparMRisa = 0
    var destaparLRisa = 0
    var destaparGuino = 0
    var destaparIconitos = 0
    var destaparSonrisa = 0
    var nuevos = ["hi"]
    var imageV = ""
    var isHidden = true
    var indexant = NSIndexPath()
    var finishwait: Bool = false;
    var notFirst: Bool = false;
    var numberMatchesWin = 0
    var numberMatches = 0
    var indexantant = NSIndexPath()
    var indexForLabel = NSIndexPath()
    var intentos = 0
    var viewc: UICollectionView!
    var attempts = 0
    var finished = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel.setLevel(stringValue)
        
        // Sound Begin
        
        // Initialize the audio dingCorrect
        var correctSoundUrl:NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("dingcorrect", ofType: "wav")!)
        if (correctSoundUrl != nil) {
            self.correctSoundPlayer = AVAudioPlayer(contentsOfURL: correctSoundUrl!, error: nil)
        }
        // Initialize the audio dingCorrect
        var loseSoundUrl:NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("loser", ofType: "wav")!)
        if (loseSoundUrl != nil) {
            self.loseSoundPlayer = AVAudioPlayer(contentsOfURL: loseSoundUrl!, error: nil)
        }
        // Initialize the audio dingCorrect
        var timerSoundUrl:NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("timer", ofType: "wav")!)
        if (timerSoundUrl != nil) {
            self.timerSoundPlayer = AVAudioPlayer(contentsOfURL: timerSoundUrl!, error: nil)
        }
        
        
        
        
        // Initialize the audio dingwrong sound
        var wrongSoundUrl:NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("dingwrong", ofType: "wav")!)
        
        if (wrongSoundUrl != nil) {
            self.wrongSoundPlayer = AVAudioPlayer(contentsOfURL: wrongSoundUrl!, error: nil)
        }
        
        var winSoundUrl:NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("tada", ofType: "wav")!)
        
        if (winSoundUrl != nil) {
            self.winSoundPlayer = AVAudioPlayer(contentsOfURL: winSoundUrl!, error: nil)
        }
        
        // Initialize the audio shuffle
        var shuffleSoundUrl:NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("shuffle", ofType: "wav")!)
        
        if (wrongSoundUrl != nil) {
            self.shuffleSoundPlayer = AVAudioPlayer(contentsOfURL: shuffleSoundUrl!, error: nil)
        }
        
        // Initialize the audio cardflip
        var flipSoundUrl:NSURL? = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cardflip", ofType: "wav")!)
        if (flipSoundUrl != nil) {
            self.flipSoundPlayer = AVAudioPlayer(contentsOfURL: flipSoundUrl!, error: nil)
        }
        
        
        
        
        
        self.cards = self.gameModel.getCards()
        
        //        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerUpdate"), userInfo: nil, repeats: true)
        
        if(stringValue == "Easy"){
            attempts = 6
            numberMatchesWin = 3
        }
        else{
            if(stringValue == "Medium"){
                attempts = 11
                numberMatchesWin = 6
            }
            
            if(stringValue == "Hard"){
                attempts = 8
                numberMatchesWin = 6
                
            }
        }
        
        
        
        
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerUpdate"), userInfo: nil, repeats: true)
        //comento esto mientras tanto
        
        //        if(stringValue == "Easy"){
        //            names = ["pink flower","blue flower","red flower","pink flower","blue flower","red flower"]
        //
        //            number = 6
        //
        //         //   println(number);
        //
        //        }
        //
        //        else if(stringValue == "Medium"){
        //
        //            names = ["pink flower","blue flower","red flower","pink flower","blue flower","red flower","pink flower","pink flower","blue flower","blue flower","red flower","red fower"]
        //
        //            number = 12
        //
        //        }
        //
        //        else {
        //
        //            names = ["lengua","lengua","guinio","guinio","risa","risa","medio risa","medio risa","sonrisa", "sonrisa", "risa de lado","risa de lado"]
        //
        //            number = 12
        //
        // //habra un timer pero de momento no lo pongo
        ////            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self,
        ////
        ////                selector: ("updateTimerLabel"), userInfo: nil, repeats: true);
        //
        //        }
        
        
        //   numbers.shuffle()
        // names.shuffle()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
        
    }
    //a tipical function to use is tableview
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    
    
    
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        println("hey")
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    func timerUpdate(){
        
        //println(countdowni)
        
        
        // Decrement the count
        
        self.countdowni -= 1
        self.countTemp = self.countdowni
        //        if (self.countdowni == 10){
        //            isFinalTime = true
        //        }
        
        // Update label
        //        self.countDownLabel.text = String(countdown)
        
        if (countdowni == 0) {
            // Stop the timer
            self.timer.invalidate()
            
            
            // Game is over, check if there is at least 1 unmatched card
            var allCardsMatched:Bool = true
            
            
            for card in self.cards{
                
                if (card.isDone == false) {
                    allCardsMatched = false
                    break;
                }
            }
            
            var alertText:String = "'"
            if (allCardsMatched == true) {
                // Win
                alertText = "Win!"
                
            }
            else {
                // Lose
                alertText = "You Lose!"
                
            }
            //
            if (self.loseSoundPlayer != nil) {
                self.loseSoundPlayer?.play()
                
            }
            var alert:UIAlertController = UIAlertController(title: "Time's up!", message:  alertText, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            //countdowni = 20
            
        }
        
        
        if (self.countdowni == 5){
            println("he llegado a 5")
            if (self.timerSoundPlayer != nil) {
                self.timerSoundPlayer?.play()
                //self.timerSoundPlayer = nil
            }
            // self.isFinalTime = true
        }
        
        
    }
    
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        //esto lo tendre que cambiar cuando sea variable (lo recojo en una variable lo que se manda en el segue)
        return self.cards.count + 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as CollectionViewCell
        
        
        if(counter == self.cards.count + 1){
            counter = 0
        }
        
        if(counter == self.cards.count){
            indexForLabel = indexPath
            var hi = "Att:\(attempts)"
            cell.label.text = hi
        }
        else{
            // Place the card in the view and turn off translateautoresizingmask
            //  var thisCard:Card = self.cards[index]
            //thisCard.setTranslatesAutoresizingMaskIntoConstraints(false)
            var thisCard: Card = cards[counter]
            cell.label.hidden = true
            cell.carta = thisCard
            cell.myImage.image = thisCard.cardImageView.image
        }
        counter = counter + 1
        
        
        return cell
    }
    
    
    
    override func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            //1
            switch kind {
                //2
            case UICollectionElementKindSectionHeader:
                
                let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                    withReuseIdentifier: reuseIdentifier2,
                    forIndexPath: indexPath) as CollectionReusableView
                
                //headerView.startCount()
                headerView.funcToCallWhenStartLoadingYourWebview()
                
                
                return headerView
                
                
            default:
                //4
                assert(false, "Unexpected element kind")
            }
    }
    
    
    
    
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       // println("here I am")
        
        var cellPrueba = collectionView.cellForItemAtIndexPath(indexForLabel) as CollectionViewCell
        
        timeReady = false
        finishwait = false
        var cell = collectionView.cellForItemAtIndexPath(indexPath) as CollectionViewCell
        //
        //        var cell2 = collectionView.cellForItemAtIndexPath(indexPath) as
        //        CollectionViewCell
        
        // If countddown is 0 then exit
        
        //        if(isFinalTime){
        //            if (self.timerSoundPlayer != nil) {
        //                self.timerSoundPlayer?.play()
        //                self.timerSoundPlayer = nil
        //                isFinalTime = false
        //            }
        //        }
        
        
        if(self.attempts == 0){
            if (self.loseSoundPlayer != nil) {
                self.loseSoundPlayer?.play()
                
            }
            var alert:UIAlertController = UIAlertController(title: "You reached the maximum number of attempts", message:"You lose", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            self.countdowni = 0
            self.timer.invalidate()
            return
        }
        if (self.countdowni == 0) {
            return
        }
        
        
        var cardThatWasTapped = cell.carta
        println(cardThatWasTapped)
        println(cardThatWasTapped.cardValue)
        println(cardThatWasTapped.isFlipped)
        //        //Get the card that was tapped
        //        var cardThatWasTapped:Card = recognizer.view as Card
        
        // Is the card already flipped up
        if(cardThatWasTapped.isFlipped == false)
        {
            if(finished){
                if(notFirst){
                    println("not first")
                    var cell2 = collectionView.cellForItemAtIndexPath(indexant) as CollectionViewCell
                    if(cell2.carta.isDone == false){
                        cell2.myImage.image = UIImage(named: "back")
                    }
                    
                    var cell3 = collectionView.cellForItemAtIndexPath(indexantant) as CollectionViewCell
                    if(cell3.carta.isDone == false){
                        cell3.myImage.image = UIImage(named: "back")
                    }
                    
                    
                    
                }
                finished = false
            }
            // Play correct sound when cards layout
            if (self.flipSoundPlayer != nil) {
                self.flipSoundPlayer?.play()
                
            }
            
            
            // Card is not flipped, now check if it's the first card being flipped
            if (self.revealedCard == nil) {
                indexant = indexPath
                // This is the first card being flipped
                
                // Flip down all cards
                self.flipDownAllCards()
                
                // Flip up the card
                cardThatWasTapped.flipUp()
                cell.actualizaImage()
                //recogeImage = cell.carta.cardImageView.image!
                //Set the revealed card
                self.revealedCard = cardThatWasTapped
                
            }
            else {
                
                //This is the secon card being flipped
                // Flip up the card
                cardThatWasTapped.flipUp()
                cell.actualizaImage()
                // cell.myImage.image = cardThatWasTapped.cardImageView.image
                // Check if it's a match
                if (self.revealedCard?.cardValue == cardThatWasTapped.cardValue){
                    numberMatches++
                    var cell1 = collectionView.cellForItemAtIndexPath(indexant) as CollectionViewCell
                    // It's a match
                    
                    // Play correct sound when cards layout
                    if (self.correctSoundPlayer != nil) {
                        self.correctSoundPlayer?.play()
                        
                    }
                    
                    //Remove both cards
                    cell1.carta.isDone = true
                    self.revealedCard?.isDone = true
                    cardThatWasTapped.isDone = true
                    recogeImage = nil
                    cell.actualizaImage()
                    cell1.actualizaImage()
                    // Reset the revealed card
                    self.revealedCard = nil
                    // notFirst = true;
                    if(numberMatches == numberMatchesWin){
                        if (self.winSoundPlayer != nil) {
                            self.winSoundPlayer?.play()
                            
                        }
                        var alert:UIAlertController = UIAlertController(title: "You won the game", message:"Your score:\(attempts*1000)", preferredStyle: UIAlertControllerStyle.Alert)
                        
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                        numberMatches = 0
                        countdowni = 0
                    }
                    //finished = true
                }
                else {
                    var cell1 = collectionView.cellForItemAtIndexPath(indexant) as CollectionViewCell
                    //                    if(timeReady == false){
                    
                    //                        self.timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerCard"), userInfo: nil, repeats: true)
                    //                        timeReady = true
                    //                    }
                    //                    else if(finishwait == true){
                    // It's not a match
                    // Play correct sound when cards layout
                    if (self.wrongSoundPlayer != nil) {
                        self.wrongSoundPlayer?.play()
                        
                    }
                    
                    //                    cell.myImage.image = UIImage(named:"back")
                    
                    //                   cell1.myImage.image = UIImage(named: "back")
                    indexantant = indexant
                    // Reset the revealed card
                    self.revealedCard = nil
                    indexant = indexPath
                    notFirst = true
                    // finished = true
                }
                finished = true
                intentos += 1
                attempts -= 1
                println(attempts)
                var hola = "Att:\(attempts)"
                cellPrueba.label.text = hola
            }
            
            //        countClick = countClick + 1
            // let cell
            //let cell2
            //        var cell = collectionView.cellForItemAtIndexPath(indexPath) as UICollectionViewCell?
            
            //        cell?.contentView.backgroundColor = UIColor.blueColor()
            //        println("hola");
            //        for i in nuevos{
            //        println(i)
            //        }
            //
            //        if(countClick == 1){
            //           let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as CollectionViewCell
            //            var imageValue = cell.myRealImage.image
            //
            //
            //            if(imageValue == UIImage(named: "risa")){
            //            imageV = "risa"
            //            }
            //            if(imageValue == UIImage(named: "pink flower")){
            //                imageV = "pink flower"
            //            }
            //            if(imageValue == UIImage(named: "blue flower")){
            //                imageV = "blue flower"
            //            }
            //            if(imageValue == UIImage(named: "red flower")){
            //                imageV = "red flower"
            //            }
            //            if(isHidden == true){
            //                cell.myRealImage.hidden = false
            //            }
            //
            //            //cell.myTemporalImage.image =UIImage(named: imageV)
            //            //cell.myRealImage.hidden = false
            //        }
            //
            //        if(countClick == 2){
            //            let cell2 = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as CollectionViewCell
            //        }
            //         //var imageValue = cell.myRealImage.image
            ////        if(imageValue == UIImage(named: "risa")){
            ////            if(countClick == 1){
            ////                imageV = "risa"
            ////            }
            //            destaparRisa = destaparRisa + 1
            //            countClick = countClick + 1
            //
            //
            //            if(destaparRisa == 1 && countClick == 1){
            //                cell.myRealImage.hidden = false
            //            }
            //            if(countClick == 2){
            //                if(imageValue == UIImage(named:imageV){
            //
            //                }
            //            }
            //
            //            if(countClick == 2){
            //                destaparRisa = true;
            //            }
            
            
        }
    }
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    func flipDownAllCards() {
        println("flipping")
        for card in self.cards{
            if (card.isDone == false){
                card.flipDown()
            }
        }
    }
    
}

extension Array {
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}
