//
//  ViewController.swift
//  marubatsu
//
//  Created by 田中優樹 on 2017/10/19.
//  Copyright © 2017年 yuki.tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var state = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningconditon = [[0, 1, 2,], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 7], [2, 4, 6]]
    
    var gameActive = true

    @IBAction func action(_ sender: Any) {
        
        if state[(sender as AnyObject).tag - 1] == 0 && gameActive == true {
            state[(sender as AnyObject).tag - 1] = activePlayer
        
            if activePlayer == 1 {
                (sender as AnyObject).setImage(UIImage(named: "maru"), for: UIControlState())
                activePlayer = 2
            } else {
                (sender as AnyObject).setImage(UIImage(named: "batsu"), for: UIControlState())
                activePlayer = 1
            
            }
        }
        
        for condition in winningconditon {
            if state[condition[0]] != 0 && state[condition[0]] == state[condition[1]] && state[condition[1]] == state[condition[2]] {
                
                gameActive = false
                
                if state[condition[0]] == 1{
                    winnerLabel.text = "マルの勝ち"
                    
                } else {
                    winnerLabel.text = "バツの勝ち"
                }
                winnerLabel.isHidden = false
                restart.isHidden = false
                
            }
        }
    }
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var restart: UIButton!
    @IBAction func restartButton(_ sender: Any) {
        state = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        activePlayer = 1
        winnerLabel.isHidden = true
        restart.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

