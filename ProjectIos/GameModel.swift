//
//  GameModel.swift
//  finalApp
//
//  Created by Paula Montojo on 4/5/15.
//  Copyright (c) 2015 Paula Montojo. All rights reserved.
//

import Foundation
class GameModel: NSObject {
    var numbers = [0,1,2,3,4,5]
    var mylevel = ""
    var maxNumber = 0
    var maxAttempt = 0
    var cardnumber:UInt32 = 0
    var index = 0
    var numeritos:[Int] = []
    var randNumber: Int = 0
    
    func setLevel(level: String){
        
        mylevel = level
        println("hola,este es m level")
        
        if(mylevel == "Easy"){
            //cambiar luego a 2
            maxNumber = 2;
            
            maxAttempt = 6;
            //cambiar a seis
            cardnumber = 6;
            
        }
            
        else if(mylevel == "Medium"){
            
            maxNumber = 5;
            
            maxAttempt = 11;
            cardnumber = 10;
            
        }
            
        else {
            
            maxNumber = 5;
            
            maxAttempt = 8;
            cardnumber = 10;
        }
    }
    
    func calculateNumber(){
        randNumber = Int(arc4random_uniform(13))
        println("EST es el generado")
        println(randNumber)
        if(checkRepited(randNumber) == true){
            println("checkeando")
            calculateNumber()
        }
        else{
            println("este es el randNumber")
            println(randNumber)
            println(index)
            numeritos.append(randNumber)
            index += 1
            
        }
        println("el que paso")
        println(randNumber)
    }
    func checkRepited(int: Int) -> Bool{
        println(numeritos)
        var booleano = false
        for i in numeritos{
            println("esto es i")
            println(i)
            if(i == int){
                booleano = true
            }
            
        }
        println(booleano)
        return booleano
    }
    
    func getCards() ->[Card]{
        
        println("eSTOY AQUI")
        var generatedCards:[Card] = [Card]()
        
        //  generate some card objects
        for index in 0...maxNumber{
            
            //generating a random number
            //            var randNumber:Int = Int(arc4random_uniform(13))
            //            for i in numeritos{
            //                if (randNumber == i){
            //
            //                }
            //            }
            
            calculateNumber()
            // Create a new card object
            var firstCard:Card = Card()
            firstCard.cardValue = randNumber
            println("random")
            println(randNumber)
            
            //Create second card object
            var secondCard:Card = Card()
            secondCard.cardValue = randNumber
            
            //Place card objects into the array
            generatedCards += [firstCard, secondCard]
        }
        
        generatedCards = generatedCards.shuffled()
        
        
        //Randomize the cards
        //        for index in 0...generatedCards.count-1 {
        //            println(generatedCards.count)
        //            println(generatedCards)
        //            //current card
        //            var currentCard:Card = generatedCards[index]
        //
        //            // Randomly choose another index
        //
        //            var randomIndex:Int = Int(arc4random_uniform(cardnumber))
        //
        //            // Swap objects at the two indexes
        //            generatedCards[index] = generatedCards[randomIndex]
        //            generatedCards[randomIndex] = currentCard
        //
        //            //nice
        //            println(String(format: "swapping card %d with card %d", index, randomIndex))
        //        }
        for i in generatedCards{
            println(i.cardValue)
        }
        return generatedCards
        
    }
    
}

extension Array {
    func shuffled() -> [T] {
        var list = self
        for i in 0..<(list.count - 1) {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
}
