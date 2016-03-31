//
//  TetrisBoardView.swift
//  Tetris
//
//  Created by Mark Mroz on 2016-03-29.
//  Copyright © 2016 MarkMroz. All rights reserved.
//

import UIKit

class TetrisBoardView: UIView {

    private var pieces: [[TetrisTileView]] = []
    private var bgColor = UIColor.blueColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
        
        for i in 0 ..< 10 {
            
            let tileWidth = self.frame.width / 10
            let tileHeight = self.frame.height / 20
            
            var tetrisCol = [TetrisTileView]()
            
            for j in 0 ..< 20 {
                
                let newTile = TetrisTileView(frame: CGRectMake( CGFloat(i) * tileWidth, CGFloat(j) * tileHeight, tileWidth, tileHeight), color: bgColor, x: i, y: j)
                addSubview(newTile)
                tetrisCol.append(newTile)
            }
            
            pieces.append(tetrisCol)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getTiles() -> [[TetrisTileView]] {
        return self.pieces
    }
    
    func getTileAtIndex(x: Int, y: Int) -> TetrisTileView {
        return self.pieces[x][y]
    }
    
    func getTileWithPoint(point: Point) -> TetrisTileView {
        return self.pieces[point.getX()][point.getY()]
    }
    
    func updateWithPiece(piece: TetrisPiece) {
        for i in 1 ..< 5 {
            
            self.getTileWithPoint(piece.getElementNumbered(i)!).setColor(piece.getColor())
        }
    }
    
    func clearPreviousPiece(piece: TetrisPiece) {
        for i in 1 ..< 5 {
            self.getTileWithPoint(piece.getElementNumbered(i)!).resetColor()
        }
    }

}
