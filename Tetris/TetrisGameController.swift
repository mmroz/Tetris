//
//  TetrisGameController.swift
//  Tetris
//
//  Created by Mark Mroz on 2016-03-29.
//  Copyright © 2016 MarkMroz. All rights reserved.
//

import Foundation

class TetrisGameController {
    
    var currentPiece: TetrisPiece
    
    var gamePositions: [[Int]] = []
    
    init() {

        currentPiece = LBlock()
        
        for _ in 0..<10 {
            gamePositions.append([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        }
        
        
    }
    
    // Move Functions
    
        // down
    
    
    func dropPieceDownOne() {
        
        if  withinBottomBound(self.currentPiece) && nextPositionIsFree(self.currentPiece)  {
            
            for i in 1  ..< 5  {
                let y = currentPiece.getElementNumbered(i)!.getY() + 1
                
                currentPiece.getElementNumbered(i)!.setY(y)
            }
            
        } else {
            self.commitPieceToStack()
            self.manageStack()
            currentPiece = self.nextPiece()
        }
    }
    
    func nextPiece() -> TetrisPiece {
        let randomNextPieceNumber = arc4random_uniform(7)
        
        switch randomNextPieceNumber {
        case (0):
            return IBlock()
        case (1):
            return JBlock()
        case (2):
            return LBlock()
        case (3):
            return OBlock()
        case (4):
            return SBlock()
        case (5):
            return TBlock()
        case (6):
            return ZBlock()
        default:
            print("Error selecting block")
        }
        return IBlock()
    }
    
        // left
    
    func shiftPieceLeftOne() {
        if  withinLeftBound(self.currentPiece) && nextPositionIsFree(self.currentPiece)  {
            
            for i in 1  ..< 5  {
                let x = currentPiece.getElementNumbered(i)!.getX() - 1
                
                currentPiece.getElementNumbered(i)!.setX(x)
            }
            
        }

    }
    
        // right
    
    func shiftPieceRightOne() {
        if  withinRightBound(self.currentPiece) && nextPositionIsFree(self.currentPiece)  {
            
            for i in 1  ..< 5  {
                let x = currentPiece.getElementNumbered(i)!.getX() + 1
                
                currentPiece.getElementNumbered(i)!.setX(x)
            }
            
        }
        
    }
    
        // commit to stack

    
    private func commitPieceToStack() {
        gamePositions[currentPiece.getFirstPosition().getX()][currentPiece.getFirstPosition().getY()] = 1
        gamePositions[currentPiece.getSecondPosition().getX()][currentPiece.getSecondPosition().getY()] = 1
        gamePositions[currentPiece.getThirdPosition().getX()][currentPiece.getThirdPosition().getY()] = 1
        gamePositions[currentPiece.getFourthPosition().getX()][currentPiece.getFourthPosition().getY()] = 1
    }
    
    private func manageStack() {
        
        var morphed = [[Int]]()
        
        for i in 0..<20{
            
            var row = [Int]()
            
            for j in 0..<10 {
                row.append(self.gamePositions[j][i])
            }
            
            if row == [1, 1, 1, 1, 1, 1, 1, 1, 1, 1] {
                print("Drop")
                morphed.insert([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], atIndex: 0)
            } else {
                morphed.append(row)
            }
        }
        
        var newStack = [[Int]]()
        
        for i in 0..<10{
            
            var row = [Int]()
            
            for j in 0..<20 {
                row.append(morphed[j][i])
            }
            
            newStack.append(row)
            print(row)
            
        }
        
        self.gamePositions = newStack
        
    }
    
    // bound checking
    
    
    func withinAllBounds(piece: TetrisPiece) -> Bool {
        if withinLeftBound(self.currentPiece) && withinRightBound(self.currentPiece) && withinBottomBound(self.currentPiece) {
            return true
        } else {
            return false
        }
    }
    
    func withinBottomBound(piece: TetrisPiece) -> Bool {
        for i in 1..<5 {
            if piece.getElementNumbered(i)!.getY() >= 19 {
                return false
            }
        }
        return true
    }
    
    func withinLeftBound(piece: TetrisPiece) -> Bool {
        for i in 1..<5 {
            if piece.getElementNumbered(i)!.getX() <= 0 {
                return false
            }
        }
        return true
    }
    
    func withinRightBound(piece: TetrisPiece) -> Bool {
        for i in 1..<5 {
            if piece.getElementNumbered(i)!.getX() >= 9 {
                return false
            }
        }
        return true

    }
    
    
    // board position checking
    
    private func nextPositionIsFree(piece: TetrisPiece) -> Bool {
        
        for i in 1..<5 {
            let x = piece.getElementNumbered(i)!.getX()
            let y = piece.getElementNumbered(i)!.getY()
            
            if x > 9 || x < 0 || y < 0 || y > 19 {
                return false
            }
            
            if self.gamePositions[x][y + 1] == 1 {
                return false
            }
        }
        return true
    }
}




