//
//  ViewController.swift
//  Team02_Blue
//
//  Created by BlueTeam on 11/17/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Show level
    @IBAction func showLevel(_ sender: UIButton) {
        let levelVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "levelID") as! LevelViewController
        self.addChildViewController(levelVC)
        levelVC.view.frame = self.view.frame
        self.view.addSubview(levelVC.view)
        levelVC.didMove(toParentViewController: self)
    }
    
    // Show how to
    @IBAction func showHowTo(_ sender: UIButton) {
        let howtoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "howtoID") as! HowToViewController
        self.addChildViewController(howtoVC)
        howtoVC.view.frame = self.view.frame
        self.view.addSubview(howtoVC.view)
        howtoVC.didMove(toParentViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

