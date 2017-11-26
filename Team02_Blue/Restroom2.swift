//
//  Restroom2.swift
//  Team02_Blue
//
//  Created by Gustavo E Soto on 11/26/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import UIKit

class Restroom2: UIViewController {
    
    @IBOutlet weak var restroomDirtyTowel: UIImageView!
    
    @IBAction func prevSegueArrowOrg(_ sender: UIButton) {
        print("Clicked!")
        self.performSegue(withIdentifier: "unwindToBedroom", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Add Dirty Towel Tap
        let dirtyTowelGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        restroomDirtyTowel.isUserInteractionEnabled = true
        restroomDirtyTowel.addGestureRecognizer(dirtyTowelGestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Tapped Object Action
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        //Capture tapped Image Object.
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        //Get Restoration Identifier.
        guard let restorationIdentifier = tappedImage.restorationIdentifier else {
            print("Restoration Identifier for image was not set!")
            return
        }
        
        //Get image data.
        let coordinates = tapGestureRecognizer.location(in: tappedImage)
        guard let currentImage = tappedImage.image else {
            print("Error capturing tapped image object.")
            return
        }
        
        //Get image color components
        let color = currentImage.getPixelColor(location: coordinates, size: tappedImage.frame.size)
        guard let colorComponents = color.colorComponents else {
            print("Error capturing tapped image color components.")
            return
        }
        
        //Check if image was actually selected
        if colorComponents.alpha != 0 {
            
            //print("Image was selected: \(restorationIdentifier) -> \(colorComponents.alpha)")
            
            switch restorationIdentifier {
                case "restroom_dirty_towel":
                    print("Towel on the floor was clicked")
                    self.restroomDirtyTowel.alpha = 0.0
                default:
                    print("Error: Something was clicked but correct restoration identifier was not set!")
            }
            
            
        } else {
            //Transparent part of image view was selected
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
