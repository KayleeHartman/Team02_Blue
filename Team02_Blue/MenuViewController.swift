//
//  MenuViewController.swift
//  Team02_Blue
//
//  Created by BlueTeam on 11/27/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

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
}
