//
//  LineUpVC.swift
//  BaseballCard
//
//  Created by Christian Hurtado on 7/22/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

enum TeamState {
    case home
    case away
}

class LineUpVC: UIViewController {
    
    var homePlayers = [String]()
    var awayPlayers = [String]()
    
    @IBOutlet weak var firstBatter: UITextField!
    @IBOutlet weak var secondBatter: UITextField!
    @IBOutlet weak var thirdBatter: UITextField!
    @IBOutlet weak var fourthBatter: UITextField!
    @IBOutlet weak var fifthBatter: UITextField!
    @IBOutlet weak var sixthBatter: UITextField!
    @IBOutlet weak var seventhBatter: UITextField!
    @IBOutlet weak var eighthBatter: UITextField!
    @IBOutlet weak var ninthBatter: UITextField!
    @IBOutlet weak var playBallOut: UIBarButtonItem!
    
    
    @IBOutlet weak var lineNums: UILabel!
    
    @IBOutlet weak var backgroundImage:UIImageView!
    
    private var teamState: TeamState = .home
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamState = .home
        configureNavBar()
        backgroundImage.image = UIImage(named: "LineupBackground")
        configureTextDel()
        configureLineup()
        configureTeamColor()
        playBallOut.title = ""
    }
    
    @IBAction func submitOrder(_ sender: UIButton) {
        teamState = .away
        configureTeamColor()
        configureLineup()
        configureNavBar()
        clearLine()
    }
    
    private func configureNavBar(){
        if teamState == .home{
            navigationItem.title = "Enter Home Team Order"
        } else {
            navigationItem.title = "Enter Away Team Order"
        }
    }
    
    private func configureTeamColor(){
        if teamState == .home{
            self.view.backgroundColor = .blue
        } else {
            self.view.backgroundColor = .red
        }
    }
    
    private func configureLineup(){
        if teamState == .home{
            firstBatter.textColor = .blue
            secondBatter.textColor = .blue
            thirdBatter.textColor = .blue
            fourthBatter.textColor = .blue
            fifthBatter.textColor = .blue
            sixthBatter.textColor = .blue
            seventhBatter.textColor = .blue
            eighthBatter.textColor = .blue
            ninthBatter.textColor = .blue
        } else {
            firstBatter.textColor = .red
            secondBatter.textColor = .red
            thirdBatter.textColor = .red
            fourthBatter.textColor = .red
            fifthBatter.textColor = .red
            sixthBatter.textColor = .red
            seventhBatter.textColor = .red
            eighthBatter.textColor = .red
            ninthBatter.textColor = .red
        }
    }
    
    private func configureTextDel(){
        firstBatter.delegate = self
        secondBatter.delegate = self
        thirdBatter.delegate = self
        fourthBatter.delegate = self
        fifthBatter.delegate = self
        sixthBatter.delegate = self
        seventhBatter.delegate = self
        eighthBatter.delegate = self
        ninthBatter.delegate = self
    }
    
    private func clearLine(){
        firstBatter.text = .none
        secondBatter.text = .none
        thirdBatter.text = .none
        fourthBatter.text = .none
        fifthBatter.text = .none
        sixthBatter.text = .none
        seventhBatter.text = .none
        eighthBatter.text = .none
        ninthBatter.text = .none
    }
    
}

extension LineUpVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if teamState == .home{
            homePlayers.append(textField.text ?? "no entry")
            print(homePlayers)
        } else {
            awayPlayers.append(textField.text ?? "no entry")
            print(awayPlayers)
        }
        textField.resignFirstResponder()
        return true
    }
    
}
