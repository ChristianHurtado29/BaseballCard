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
    
    @IBOutlet weak var firstBatter: UITextField!
    @IBOutlet weak var secondBatter: UITextField!
    @IBOutlet weak var thirdBatter: UITextField!
    @IBOutlet weak var fourthBatter: UITextField!
    @IBOutlet weak var fifthBatter: UITextField!
    @IBOutlet weak var sixthBatter: UITextField!
    @IBOutlet weak var seventhBatter: UITextField!
    @IBOutlet weak var eighthBatter: UITextField!
    @IBOutlet weak var ninthBatter: UITextField!
    
    @IBOutlet weak var lineNums: UILabel!
    
    @IBOutlet weak var backgroundImage:UIImageView!
    
    private var teamState: TeamState = .home

    override func viewDidLoad() {
        super.viewDidLoad()
        teamState = .home
        backgroundImage.image = UIImage(named: "LineupBackground")
        configureTextDel()
        configureLineup()
        configureTeamColor()
    }
    
    @IBAction func submitOrder(_ sender: UIButton) {
        teamState = .away
        configureTeamColor()
        configureLineup()
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
    

}

extension LineUpVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
