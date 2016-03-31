//
//  ViewController.swift
//  Tetris
//
//  Created by Mark Mroz on 2016-03-29.
//  Copyright © 2016 MarkMroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var move = UIPanGestureRecognizer()
    
    private var board: TetrisBoardView = TetrisBoardView()
    private var game: TetrisGameController = TetrisGameController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panedView(_:)))
        self.view.addGestureRecognizer(gestureRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedView(_:)))
        self.view.addGestureRecognizer(tapRecognizer)
        
        board = TetrisBoardView(frame: CGRectMake(0, 65, self.view.frame.width, self.view.frame.height - 65))
        self.view.addSubview(board)
        
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(ViewController.timerDidFire(_:)), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerDidFire(sender: AnyObject) {
        self.startGame()
    }
    
    func startGame() {
        
        // adds the piece to the boards
        
        board.updateWithPiece(game.currentPiece)
    
        
        // removes the previous piece
        
        board.clearPreviousPiece(game.currentPiece)
        
        // drops the piece a board position
        
        game.dropPieceDownOne()
        
        // update tiles from board
        
        updateTilesFromGame()
        
        // updates the boards
        
        board.updateWithPiece(game.currentPiece)
    }
    
    func updateTilesFromGame() {
        for i in 0..<10 {
            for j in 0..<20 {
                if (game.gamePositions[i][j] == 1) {
                    board.getTileAtIndex(i, y: j).setColor(UIColor.grayColor())
                } else if (game.gamePositions[i][j] == 0) {
                    board.getTileAtIndex(i, y: j).resetColor()
                }
            }
        }
    }
    
    var touchStartLocation = CGPoint()
    
    func panedView(sender: UIPanGestureRecognizer){
        
        if sender.state == .Began {
            touchStartLocation = sender.translationInView(self.board)
        } else if sender.state == .Ended {
            touchStartLocation = sender.translationInView(self.board)
        }
        
        if (touchStartLocation.x - sender.translationInView(self.board).x) > self.view.frame.width / 10 {
            touchStartLocation = sender.translationInView(self.board)
            
            game.shiftPieceLeftOne()
            
            updateTilesFromGame()
            
            board.updateWithPiece(game.currentPiece)
            
        } else if -(touchStartLocation.x - sender.translationInView(self.board).x) > self.view.frame.width / 10 {
            touchStartLocation = sender.translationInView(self.board)
            
            game.shiftPieceRightOne()
            
            
            updateTilesFromGame()
            
            board.updateWithPiece(game.currentPiece)
            
        }
    }
    
    func tappedView(sender: UITapGestureRecognizer) {
        
        if !(game.currentPiece.getHasBeenRotated()) {
        game.currentPiece.moveAllElements()
        } else {
            game.currentPiece.moveAllElementsBack()
        }
    }
}



