//
//  GameScene.swift
//  Swiftris
//
//  Created by Dulio Denis on 10/8/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

import SpriteKit

// The slowest speed at which shapes will travel - 6/10th of a second
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
    
    var tick:(() -> ())? // a closure that takes no parameters, returns nothing, and is optional
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate? // last time we've experienced a tick
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y:0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
    }
    
    override func update(currentTime: CFTimeInterval) {
        if lastTick == nil {
            return
        }
        
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate.date()
            tick?()
        }
    }
    
    func startTicking() {
        lastTick = NSDate.date()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}
