//
//  Card.swift
//  ConcentrationGameV3
//
//  Created by Светлана Сизова on 27.06.2018.
//  Copyright © 2018 Stacy Sizova. All rights reserved.
//

import Foundation

struct Card: Hashable{
    var hashValue: Int{return  identifier}
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFacedUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
