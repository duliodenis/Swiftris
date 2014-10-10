//
//  Block.swift
//  Swiftris
//
//  Created by Dulio Denis on 10/9/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

import Foundation
import SpriteKit

// Number of Block Colors in the Game
let NumberOfColors: UInt32 = 6

// The Block Color Enumeration of printable Ints
enum BlockColor: Int, Printable {
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
            }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
}


class Block: Hashable, Printable {
    // Color of the Block
    let color: BlockColor
    
    // the location of the Block on the game board
    var column: Int
    var row: Int
    
    // The visual element of the Block
    var sprite: SKSpriteNode?
    
    // Convenience variable for code shortening
    var spriteName: String {
        return color.spriteName
    }
    
    // hashValue calculated property required for the Hashable protocol
    var hashValue:  Int {
        return self.column ^ self.row
    }
    
    // required for the Printable protocol
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// Custom operator for block comparison that returns true if two blocks have the same location and color
func ==(lhs: Block, rhs:Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}

