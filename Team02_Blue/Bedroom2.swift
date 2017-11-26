//
//  Bedroom2.swift
//  Team02_Blue
//
//  Created by Gustavo E Soto on 11/25/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import UIKit

class Bedroom2: UIViewController {
    
    //Connect All Outlets
    @IBOutlet weak var dirtyBed: UIImageView!
    @IBOutlet weak var cleanBed: UIImageView!
    @IBOutlet weak var dirtyPillow: UIImageView!
    @IBOutlet weak var cleanPillows: UIImageView!
    @IBOutlet weak var dirtyTrashCan: UIImageView!
    @IBOutlet weak var cleanLamp: UIImageView!
    @IBOutlet weak var dirtyLamp: UIImageView!
    @IBOutlet weak var dirtyNightstand: UIImageView!
    @IBOutlet weak var dirtyRug: UIImageView!
    @IBOutlet weak var cleanRug: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add Dirty Bed Tap
        let dirtyBedGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        dirtyBed.isUserInteractionEnabled = true
        dirtyBed.addGestureRecognizer(dirtyBedGestureRecognizer)
        
        //Add Dirty Pillows Tap
        let dirtyPillowGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        dirtyPillow.isUserInteractionEnabled = true
        dirtyPillow.addGestureRecognizer(dirtyPillowGestureRecognizer)
        
        //Add Dirty Trash Can Tap
        let dirtyTrashCanGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        dirtyTrashCan.isUserInteractionEnabled = true
        dirtyTrashCan.addGestureRecognizer(dirtyTrashCanGestureRecognizer)
        
        //Add Dirty Lamp Tap
        let dirtyLampGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        dirtyLamp.isUserInteractionEnabled = true
        dirtyLamp.addGestureRecognizer(dirtyLampGestureRecognizer)
        
        //Add Dirty Nightstand Tap
        let dirtyNightstandGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        dirtyNightstand.isUserInteractionEnabled = true
        dirtyNightstand.addGestureRecognizer(dirtyNightstandGestureRecognizer)
        
        //Add Dirty Rug Tap
        let dirtyRugGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        dirtyRug.isUserInteractionEnabled = true
        dirtyRug.addGestureRecognizer(dirtyRugGestureRecognizer)
        
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
            print("Image was selected: \(restorationIdentifier)")
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
