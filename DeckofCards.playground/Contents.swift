//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Card {
    var Color: String
    var roll : Int = 0
    
    init(Color:String) {
        self.Color = Color
        if Color == "Blue" {
            self.roll = Int(arc4random_uniform(2)+1)
        }
        else if Color == "Red" {
            self.roll = Int(arc4random_uniform(2)+3)
        }
        else if Color == "Green" {
            self.roll = Int(arc4random_uniform(3)+4)
        }
    }
}

var x = Card(Color: "Blue")
print(x)

class Deck {
    var cards : [Card] = []
    init(){
        for _ in 1...10{
            cards.append(Card(Color:"Blue"))
            cards.append(Card(Color:"Red"))
            cards.append(Card(Color:"Green"))
        }
        print(cards)
    }
    
    func deal(){
        let out = cards.remove(at:0)
        print(out)

    }
    
    func isEmpty(){
        if cards.count == 0 {
            print("True")
        }
        else{
            print("False")
        }
    }
    func shuffle(){
        for _ in 0...100{
        let b = Int(arc4random_uniform(30))
        let n = Int(arc4random_uniform(30))
        let temp : Card = cards[b]
        cards[b] = cards[n]
        cards[n] = temp
        }
    }
}
//var deck = Deck()
//deck.shuffle()


class Player{
    var name : String
    var hand : [Card] = []
    
    init(name: String){
        self.name = name
    }
    
    func draw(deck: Deck) -> Card{
        let x = deck.cards[deck.cards.count-1]
        deck.cards.removeLast()
        print(x)
        return x
    }
    
    func rollDice() -> Int {
        let y = Int(arc4random_uniform(6))+1 //starts at 1 instead of 0
        return y
    }
}

//var deck  = Deck()
//deck.shuffle()

var player = Player(name:"Alan")
player.rollDice()
