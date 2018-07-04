//
//  ViewController.swift
//  Tic Tac Toe 2
//
//  Created by Ashwin Mahesh on 7/3/18.
//  Copyright © 2018 Ashwin Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var turn=0
    var winningPositions:[[Int]]=[
        [0,1,2],[3,4,5],[6,7,8], //Horizontals
        [0,3,6],[1,4,7],[2,5,8], //Verticals
        [0,4,8],[2,4,6] //Diagonals
    ]
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBAction func buttonPushed(_ sender: UIButton) {
        if(sender.title(for: .normal)==nil){
            print("Sender tag: "+String(sender.tag))
            if turn==0{
                sender.setTitle("X", for: .normal)
            }
            else{
                sender.setTitle("O", for: .normal)
            }
            turn+=1
            turn=turn%2
        }
        if checkWinner(player:0){
            winnerLabel.text="X has won!"
            for button in buttons{
                button.isEnabled=false
            }
        }
        else if checkWinner(player:1){
            winnerLabel.text="O has won!"
            for button in buttons{
                button.isEnabled=false
            }
        }
        
    }
    
    func checkWinner(player:Int)->Bool{
        var playerChar:String
        if player==0{
            playerChar="X"
        }
        else{
            playerChar="O"
        }
        var wonGame=false
        for winningPosition in winningPositions{
            var button1:UIButton!
            var button2:UIButton!
            var button3:UIButton!
            for button in buttons{
                if button.tag==winningPosition[0]{
                    button1=button
                }
                else if button.tag==winningPosition[1]{
                    button2=button
                }
                else if button.tag==winningPosition[2]{
                    button3=button
                }
            }
            
            if button1.title(for:.normal)==playerChar && button2.title(for:.normal)==playerChar &&
                button3.title(for:.normal)==playerChar{
                    wonGame=true
                    break;
            }
        }
        if wonGame==true{
            return true
        }
        return false
    }
    
    @IBAction func resetPushed(_ sender: UIButton) {
        for button in buttons{
            button.backgroundColor=UIColor.black
            button.setTitle(nil, for:.normal)
            button.isEnabled=true
        }
        turn=0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for button in buttons{
            print(button.tag)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

