//
//  TetrisTileView.swift
//  Tetris
//
//  Created by Mark Mroz on 2016-03-29.
//  Copyright © 2016 MarkMroz. All rights reserved.
//

import UIKit

class TetrisTileView: UIView {
    
    private var position: Point
    private var occupied: Bool
    private var color: UIColor
    
    private var oldBGColor: UIColor = UIColor.blueColor()

    init(frame: CGRect, color: UIColor, x: Int, y: Int) {
        self.position = Point(x: x, y: y)
        self.color = color
        self.occupied = false
        super.init(frame: frame)
        
        self.backgroundColor = color
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColor(color: UIColor) {
        self.color = color
        self.backgroundColor = color
        self.occupied = true
    }
    
    func resetColor() {
        self.backgroundColor = oldBGColor
        self.occupied = false
    }


}
