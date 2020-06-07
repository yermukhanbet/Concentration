//
//  Card.swift
//  concentration
//
//  Created by Yessen Yermukhanbet on 11/25/19.
//  Copyright © 2019 Yessen Yermukhanbet. All rights reserved.
//

import Foundation

struct Card{
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var uniqueIdentifier = 0
    
    static func getUniqueIdentifier() -> Int{
        uniqueIdentifier += 1
        return Card.uniqueIdentifier
    }
    
    init(){
        identifier = Card.getUniqueIdentifier()
    }
}
