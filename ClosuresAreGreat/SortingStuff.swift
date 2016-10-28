//
//  SortingStuff.swift
//  ClosuresAreGreat
//
//  Created by Jim Campagno on 10/25/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation


struct ToyBin {
    
    var ships: [Ship] = []
    var books: [Book] = []
    var bowlingPins: [BowlingPin] = []
    var musicCDs: [MusicCD] = []
    
    mutating func sortShips() {
        ships = ships.sorted { firstShip, secondShip in
            
            if firstShip.name == "Titanic" {
                return true
            } else if secondShip.name == "Titanic" {
                return false
            }
            return firstShip.age > secondShip.age
        }
    }
    
    mutating func sortBooks() {
            books = books.sorted { $0.0.name < $0.1.name }
    }
    
    mutating func sortBowlingPins() {
        bowlingPins = bowlingPins.sorted { $0.0.color.rawValue < $0.1.color.rawValue }
    }
    
    mutating func sortMusicCDs() {
        musicCDs = musicCDs.sorted { firstCD, secondCD in
            
            if firstCD.name == "Drake" {
                return true
            } else if secondCD.name == "Drake" {
                return false
            }
            return firstCD.name < secondCD.name
        }
    }
    
    mutating func changeColorOfAllPins(to color: Color) {
        bowlingPins = bowlingPins.map { (pin: BowlingPin) -> BowlingPin in
            var aPin = pin
            aPin.changeColor(to: color)
            return aPin
        }
    }
}


struct Ship {
    var name: String
    var age: Int
}


struct Book {
    var name: String
    var year: Int
    var author: String
}


struct BowlingPin {
    var name: String
    var film: String
    var color: Color
    
    mutating func changeColor(to color: Color) {
        self.color = color
    }
}


enum Color: Int {
    case red, orange, yellow, green, blue, indigo, violet
}



struct MusicCD {
    var name: String
    var year: Int
    var songs: [String]
}
