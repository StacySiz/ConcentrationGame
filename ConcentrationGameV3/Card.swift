//
//  Card.swift
//  ConcentrationGameV3
//
//  Created by Светлана Сизова on 27.06.2018.
//  Copyright © 2018 Stacy Sizova. All rights reserved.
//

import Foundation

struct Card{
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}