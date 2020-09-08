//
//  GameViewController.swift
//  BaseballCard
//
//  Created by Christian Hurtado on 8/7/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

enum TopBottom{
    case Top
    case Bottom
}

enum Inning{
    case First
    case Second
    case Third
    case Fourth
    case Fifth
    case Sixth
    case Seventh
    case Eigth
    case Ninth
}

class GameViewController: UIViewController {
    
    var state: TopBottom = .Top
    var inning: Inning = .First
    var onBase = 0
    var outs = 0
    var runs = 0
    var awayRuns = 0
    var homeRuns = 0
    var awayTotal = [Int]()
    var homeTotal = [Int]()
    //    var awayRuns = [Int]()
    //    var homeRuns = [Int]()
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var firstBaseImage: UIImageView!
    @IBOutlet weak var secondBaseImage: UIImageView!
    @IBOutlet weak var thirdBaseImage: UIImageView!
    
    @IBOutlet weak var topFirst: UILabel!
    @IBOutlet weak var bottomFirst: UILabel!
    @IBOutlet weak var topSecond: UILabel!
    @IBOutlet weak var bottomSecond: UILabel!
    @IBOutlet weak var topThird: UILabel!
    @IBOutlet weak var bottomThird: UILabel!
    @IBOutlet weak var topFourth: UILabel!
    @IBOutlet weak var bottomFourth: UILabel!
    @IBOutlet weak var topFifth: UILabel!
    @IBOutlet weak var bottonFifth: UILabel!
    @IBOutlet weak var topSixth: UILabel!
    @IBOutlet weak var bottomSixth: UILabel!
    @IBOutlet weak var topSeventh: UILabel!
    @IBOutlet weak var bottomSeventh: UILabel!
    @IBOutlet weak var topEigth: UILabel!
    @IBOutlet weak var bottomEighth: UILabel!
    @IBOutlet weak var topNinth: UILabel!
    @IBOutlet weak var bottomNinth: UILabel!
    
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    
    @IBOutlet weak var nowBattingLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmInning()
    }
    
    @IBAction func singleHit(_ sender: UIButton) {
        onBase += 1
        if thirdBaseImage.image != .none{
            thirdBaseImage.image = .none
            runs += 1
            onBase -= 1
        }
        if secondBaseImage.image != .none{
            secondBaseImage.image = .none
            thirdBaseImage.image = UIImage(named: "runner")
        }
        if firstBaseImage.image == UIImage(named: "runner"){
            secondBaseImage.image = UIImage(named: "runner")
        }
        firstBaseImage.image = UIImage(named: "runner")
        runsScored()
    }
    
    @IBAction func doubleHit(_ sender: UIButton) {
        onBase += 1
        if thirdBaseImage.image != .none{
            thirdBaseImage.image = .none
            runs += 1
            onBase -= 1
        }
        if secondBaseImage.image != .none{
            secondBaseImage.image = .none
            runs += 1
            onBase -= 1
        }
        if firstBaseImage.image == UIImage(named: "runner"){
            firstBaseImage.image = .none
            thirdBaseImage.image = UIImage(named: "runner")
        }
        secondBaseImage.image = UIImage(named: "runner")
        runsScored()
    }
    
    @IBAction func tripleHit(_ sender: UIButton) {
        onBase += 1
        if thirdBaseImage.image != .none{
            thirdBaseImage.image = .none
            runs += 1
            onBase -= 1
        }
        if secondBaseImage.image != .none{
            secondBaseImage.image = .none
            runs += 1
            onBase -= 1
        }
        if firstBaseImage.image == UIImage(named: "runner"){
            firstBaseImage.image = .none
            runs += 1
            onBase -= 1
        }
        thirdBaseImage.image = UIImage(named: "runner")
        runsScored()
    }
    
    @IBAction func homerunHit(_ sender: UIButton) {
        runs += onBase + 1
        clearBases()
        onBase = 0
        runsScored()
    }
    
    private func confirmInning(){
        navigationItem.title = "Inn: \(state) \(inning)   Outs: \(outs)"
    }
    
    private func clearBases(){
        firstBaseImage.image = .none
        secondBaseImage.image = .none
        thirdBaseImage.image = .none
        onBase = 0
    }
    
    private func runsScored(){
        if inning == .First{
            if state == .Top{
                topFirst.text = runs.description
//                awayRuns += runs
                print("awayRuns \(awayRuns)")
                print("onBase \(onBase)")
                print("runs \(runs)")
                awayScore.text = awayRuns.description
            } else {
                homeRuns += runs
                bottomFirst.text = runs.description
                homeScore.text = homeRuns.description
            }
        } else if inning == .Second{
            if state == .Top{
                topSecond.text = runs.description
            } else {
                bottomSecond.text = runs.description
            }
        } else if inning == .Third{
            if state == .Top{
                topThird.text = runs.description
            } else {
                bottomThird.text = runs.description
            }
        } else if inning == .Fourth{
            inning = .Fifth
        } else if inning == .Fifth{
            inning = .Sixth
        } else if inning == .Sixth{
            inning = .Seventh
        } else if inning == .Seventh{
            inning = .Eigth
        } else if inning == .Eigth{
            inning = .Ninth
        }
    }
    
    @IBAction func outAct(_ sender: UIButton) {
        if outs == 2{
            if state == .Top{
                state = .Bottom
                awayTotal.append(runs)
                awayScore.text = awayTotal.reduce(0, +).description
                runs = 0
                outs = 0
                clearBases()
            }
            else if state == .Bottom{
                state = .Top
                homeTotal.append(runs)
                homeScore.text = homeTotal.reduce(0, +).description
                runs = 0
                outs = 0
                clearBases()
                if inning == .First{
                    inning = .Second
                    
                } else if inning == .Second{
                    inning = .Third
                } else if inning == .Third{
                    inning = .Fourth
                } else if inning == .Fourth{
                    inning = .Fifth
                } else if inning == .Fifth{
                    inning = .Sixth
                } else if inning == .Sixth{
                    inning = .Seventh
                } else if inning == .Seventh{
                    inning = .Eigth
                } else if inning == .Eigth{
                    inning = .Ninth
                }
            }
        } else {
            outs += 1
        }
        confirmInning()
    }
    
    private func runsCheck(){

    }
    
}
