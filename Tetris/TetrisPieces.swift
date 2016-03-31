//
//  TetrisPieces.swift
//  Tetris
//
//  Created by Mark Mroz on 2016-03-29.
//  Copyright © 2016 MarkMroz. All rights reserved.
//

import Foundation
import UIKit

class Point: CustomStringConvertible {
    private var x: Int
    private var y: Int
    
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
    
    func getX() -> Int {
        return x
    }
    
    func getY() -> Int {
        return y
    }
    
    func setX(x: Int) {
        self.x = x
    }
    
    func setY(y: Int) {
        self.y = y
    }
    
    var description: String {
        return "x: " +  String(self.getX()) + " y: " + String(self.getY())
    }
}

protocol Move {
    func moveFirstElement()
    func moveSecondElement()
    func moveThirdElement()
    func moveFourthElement()
    
    func moveAllElements()
    
    func moveFirstElementBack()
    func moveSecondElementBack()
    func moveThirdElementBack()
    func moveFourthElementBack()
    
    
    func moveAllElementsBack()
}

class TetrisPiece: Move {
    
    private var color = UIColor.blackColor()
    
    private var firstPosition: Point
    private var secondPosition: Point
    private var thirdPosition: Point
    private var fourthPosition: Point
    
    private var hasBeenRotates: Bool = false
    
    init(p1: Point, p2: Point, p3: Point, p4: Point) {
        firstPosition = p1
        secondPosition = p2
        thirdPosition = p3
        fourthPosition = p4
    }
    
    func getFirstPosition() -> Point {
        return firstPosition
    }
    
    func getSecondPosition() -> Point {
        return secondPosition
    }
    
    func getThirdPosition() -> Point {
        return thirdPosition
    }
    
    func getFourthPosition() -> Point {
        return fourthPosition
    }
    
    func getHasBeenRotated() -> Bool {
        return self.hasBeenRotates
    }
    
    func setHadBeenRotated(to: Bool) {
        self.hasBeenRotates = to
    }
    
    func getElementNumbered(number: Int) -> Point? {
        switch(number) {
        case 1:
            return firstPosition
        case 2:
            return secondPosition
        case 3:
            return thirdPosition
        case 4:
            return fourthPosition
        default:
            print("NOPE")
        }
        
        return nil
    }
    
    func getColor() -> UIColor {
        return self.color
    }
    
    internal func moveFirstElement() {
    }
    
    internal func moveSecondElement() {
    }
    
    internal func moveThirdElement() {
    }
    
    internal func moveFourthElement() {
    }
    
    func moveAllElements() {
    }
    
    internal func moveFirstElementBack() {
    }
    
    internal func moveSecondElementBack() {
    }
    
    internal func moveThirdElementBack() {
    }
    
    internal func moveFourthElementBack() {
    }

    func moveAllElementsBack() {
    }

}

class IBlock: TetrisPiece {

    
    init() {
        
        let p1 = Point(x: 3, y: 0)
        let p2 = Point(x: 4, y: 0)
        let p3 = Point(x: 5, y: 0)
        let p4 = Point(x: 6, y: 0)
        super.init(p1: p1, p2: p2, p3: p3, p4: p4)
        
        color = UIColor.cyanColor()
    }
    
    override internal func moveFirstElement() {
        self.firstPosition = Point(x: self.getSecondPosition().getX(),y: self.getSecondPosition().getY())
    }
    
    override internal func moveSecondElement() {
        self.secondPosition = Point(x: self.getSecondPosition().getX(),y: self.getSecondPosition().getY() + 1)
    }
    
    override internal func moveThirdElement() {
        self.thirdPosition = Point(x: self.getSecondPosition().getX(),y: self.getSecondPosition().getY() + 1)
    }
    
    override internal func moveFourthElement() {
        self.fourthPosition = Point(x: self.getSecondPosition().getX(),y: self.getSecondPosition().getY() + 2)
    }
    
    override func moveAllElements() {
        
        if getFirstPosition().getY() > 0 && getFourthPosition().getY() < 18 {
            self.moveFirstElement()
            self.moveSecondElement()
            self.moveThirdElement()
            self.moveFourthElement()
        }
        
        setHadBeenRotated(true)
    }
    
    internal override func moveFirstElementBack() {
        self.firstPosition = Point(x: self.getFirstPosition().getX() - 1,y: self.getSecondPosition().getY())
    }
    
    internal override func moveSecondElementBack() {
        self.secondPosition = Point(x: self.getFirstPosition().getX() + 1,y: self.getSecondPosition().getY())
    }
    
    internal override func moveThirdElementBack() {
        self.thirdPosition = Point(x: self.getFirstPosition().getX() + 2 ,y: self.getSecondPosition().getY())
    }
    
    internal override func moveFourthElementBack() {
        self.fourthPosition = Point(x: self.getFirstPosition().getX() + 3 ,y: self.getSecondPosition().getY())
    }
    
    override func moveAllElementsBack() {
        
        moveFirstElementBack()
        moveSecondElementBack()
        moveThirdElementBack()
        moveFourthElementBack()
        
        setHadBeenRotated(false)
    }
}

class JBlock: TetrisPiece {
    
    init() {
        
        let p1 = Point(x: 3, y: 0)
        let p2 = Point(x: 3, y: 1)
        let p3 = Point(x: 4, y: 1)
        let p4 = Point(x: 5, y: 1)
        super.init(p1: p1, p2: p2, p3: p3, p4: p4)
        
        color = UIColor.brownColor()
    }
    
    
    override func moveThirdElement() {
        self.thirdPosition = Point(x: self.getSecondPosition().getX(),y: self.getSecondPosition().getY() + 1)
    }
    
    override func moveFourthElement() {
        self.fourthPosition = Point(x: self.getSecondPosition().getX() - 1,y: self.getSecondPosition().getY() + 1)
    }
    
    override func moveAllElements() {
        self.moveThirdElement()
        self.moveFourthElement()
        
        self.setHadBeenRotated(true)
    }
    
    override func moveThirdElementBack() {
        self.thirdPosition = Point(x: self.getSecondPosition().getX() + 1,y: self.getSecondPosition().getY())
    }
    
    override func moveFourthElementBack() {
        self.fourthPosition = Point(x: self.getSecondPosition().getX() + 2,y: self.getSecondPosition().getY())
    }
    
    override func moveAllElementsBack() {
        self.moveThirdElementBack()
        self.moveFourthElementBack()
        
        self.setHadBeenRotated(false)
    }
}

class LBlock: TetrisPiece {
    
    init() {
        
        let p1 = Point(x: 5, y: 0)
        let p2 = Point(x: 3, y: 1)
        let p3 = Point(x: 4, y: 1)
        let p4 = Point(x: 5, y: 1)
        super.init(p1: p1, p2: p2, p3: p3, p4: p4)
        
        color = UIColor.orangeColor()
    }
    
    override func moveFirstElement() {
        self.firstPosition = Point(x: self.getThirdPosition().getX(),y: self.getThirdPosition().getY() - 1)
    }
    
    override func moveSecondElement() {
        self.secondPosition = Point(x: self.getThirdPosition().getX(),y: self.getThirdPosition().getY())
    }
    
    override func moveThirdElement() {
        self.thirdPosition = Point(x: self.getSecondPosition().getX(),y: self.getSecondPosition().getY() + 1)
    }
    
    override func moveFourthElement() {
        self.fourthPosition = Point(x: self.getSecondPosition().getX() + 1,y: self.getSecondPosition().getY() + 1)
    }
    
    override func moveAllElements() {
        self.moveFirstElement()
        self.moveSecondElement()
        self.moveThirdElement()
        self.moveFourthElement()
        
        self.setHadBeenRotated(true)
    }
    
    override func moveFirstElementBack() {
        self.firstPosition = Point(x: self.getFourthPosition().getX(),y: self.getThirdPosition().getY() - 1)
    }
    
    override func moveSecondElementBack() {
        self.secondPosition = Point(x: self.getThirdPosition().getX() - 1,y: self.getThirdPosition().getY())
    }
    
    override func moveThirdElementBack() {
        self.thirdPosition = self.secondPosition
    }
    
    override func moveFourthElementBack() {
        self.fourthPosition = Point(x: self.getThirdPosition().getX() + 1,y: self.getThirdPosition().getY())
    }
    
    override func moveAllElementsBack() {
        self.moveThirdElementBack()
        self.moveFourthElementBack()
        self.moveFirstElementBack()
        self.moveSecondElementBack()
        
        self.setHadBeenRotated(false)
    }

}

class OBlock: TetrisPiece {
    
    init() {
        
        let p1 = Point(x: 4, y: 0)
        let p2 = Point(x: 4, y: 1)
        let p3 = Point(x: 5, y: 0)
        let p4 = Point(x: 5, y: 1)
        super.init(p1: p1, p2: p2, p3: p3, p4: p4)
        
        color = UIColor.yellowColor()
    }
}

class SBlock: TetrisPiece {
    
    init() {
        
        let p1 = Point(x: 4, y: 1)
        let p2 = Point(x: 5, y: 1)
        let p3 = Point(x: 5, y: 0)
        let p4 = Point(x: 6, y: 0)
        super.init(p1: p1, p2: p2, p3: p3, p4: p4)
        
        color = UIColor.greenColor()
    }
    
    override func moveFirstElement() {
        self.firstPosition = Point(x: self.getFourthPosition().getX(), y: self.getSecondPosition().getY())
    }
    
    override func moveFourthElement() {
        self.fourthPosition.setY(self.getFirstPosition().getY() + 1)
    }
    
    override func moveAllElements() {
        self.moveFirstElement()
        self.moveFourthElement()
        
        setHadBeenRotated(true)
    }
    
    override func moveFirstElementBack() {
        self.firstPosition = Point(x: self.secondPosition.getX() - 1, y: self.secondPosition.getY())
    }
    
    override func moveFourthElementBack() {
        self.fourthPosition = Point(x: self.getThirdPosition().getX() + 1, y: self.getThirdPosition().getY())
    }
    
    override func moveAllElementsBack() {
        moveFirstElementBack()
        moveFourthElementBack()
        
        setHadBeenRotated(false)
    }

}

class TBlock: TetrisPiece {
    
    init() {
        
        let p1 = Point(x: 5, y: 0)
        let p2 = Point(x: 4, y: 1)
        let p3 = Point(x: 5, y: 1)
        let p4 = Point(x: 6, y: 1)
        super.init(p1: p1, p2: p2, p3: p3, p4: p4)
        
        color = UIColor.purpleColor()
    }
    
    override func moveSecondElement() {
        self.secondPosition = Point(x: self.getThirdPosition().getX(),y: self.getThirdPosition().getY() + 1)
    }
    
    override func moveAllElements() {
        self.moveSecondElement()
        setHadBeenRotated(true)
    }
    
    override func moveSecondElementBack() {
        self.secondPosition = Point(x: self.getThirdPosition().getX() - 1, y: self.getThirdPosition().getY())
    }
    
    override func moveAllElementsBack() {
        moveSecondElementBack()
        
        setHadBeenRotated(false)
    }
}

class ZBlock: TetrisPiece {
    
    init() {
        
        let p1 = Point(x: 4, y: 0)
        let p2 = Point(x: 5, y: 0)
        let p3 = Point(x: 5, y: 1)
        let p4 = Point(x: 6, y: 1)
        super.init(p1: p1, p2: p2, p3: p3, p4: p4)
        
        color = UIColor.redColor()
    }
    
    override func moveFirstElement() {
        self.firstPosition = Point(x: self.getSecondPosition().getX() - 1,y: self.getSecondPosition().getY() + 1)
    }
    
    override func moveFourthElement() {
        self.fourthPosition = Point(x: self.getSecondPosition().getX() - 1,y: self.getSecondPosition().getY() + 2)
    }
    
    override func moveAllElements() {
        self.moveFirstElement()
        self.moveFourthElement()
        
        setHadBeenRotated(true)
    }
    
    override func moveFirstElementBack() {
        self.firstPosition = Point(x: self.secondPosition.getX() - 4, y: self.secondPosition.getY())
    }
    
    override func moveFourthElementBack() {
        self.fourthPosition = Point(x: self.getThirdPosition().getX() + 1, y: self.getThirdPosition().getY())
    }
    
    override func moveSecondElementBack() {
        self.moveFirstElementBack()
        self.moveFourthElementBack()
        
        setHadBeenRotated(false)
    }
    
}


