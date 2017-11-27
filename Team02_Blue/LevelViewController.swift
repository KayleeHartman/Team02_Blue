//
//  LevelViewController.swift
//  Team02_Blue
//
//  Created by BlueTeam on 11/27/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    var level = 0
    
    @IBAction func playEasy(_ sender: UIButton) {
        level = 1
        performSegue(withIdentifier: "level", sender: sender)
    }
    
    @IBAction func playMedium(_ sender: UIButton) {
        level = 2
        performSegue(withIdentifier: "level", sender: sender)
    }
    
    @IBAction func playHard(_ sender: UIButton) {
        level = 3
        performSegue(withIdentifier: "level", sender: sender)
    }
    
    @IBAction func closeMenu(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        let nextScene = segue.destination as? Bedroom2
        nextScene?.levelVal = level;
    }
}
