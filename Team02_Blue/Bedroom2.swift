//
//  Bedroom2.swift
//  Team02_Blue
//
//  Created by Gustavo E Soto on 11/25/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import UIKit

class Bedroom2: UIViewController {
    
    @IBAction func unwindToBedroom(segue: UIStoryboardSegue) {}
    
    //Connect All Outlets
    @IBOutlet weak var scoreLabel: UILabel!
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
    @IBOutlet weak var dirtyTowel: UIImageView!
    @IBOutlet weak var dirtyDrink: UIImageView!
    @IBOutlet weak var dirtyWindow: UIImageView!
    @IBOutlet weak var dirtyStool: UIImageView!
    @IBOutlet weak var cleanStool: UIImageView!
    
    //Build object dictionary
    var objectDict: [String:(
        is_active:Bool,
        is_clean:Bool
    )] = [:]
    var activeObjs = [String]()
    var score:Int = 0
    
    override func viewDidAppear(_ animated: Bool) {
        self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize object Dictionary
        initDict()
        getActiveObj()
        
        //Add Dirty Bed Tap
        if (objectDict["bedroom_dirty_bed"]?.is_active)! {
            let dirtyBedGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyBed.isUserInteractionEnabled = true
            dirtyBed.addGestureRecognizer(dirtyBedGestureRecognizer)
        } else {
            dirtyBed.alpha = 0.0
            cleanBed.alpha = 1.0
            objectDict["bedroom_dirty_bed"]?.is_clean = true
        }
        
        //Add Dirty Pillows Tap
        if (objectDict["bedroom_dirty_pillows"]?.is_active)! {
            let dirtyPillowGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyPillow.isUserInteractionEnabled = true
            dirtyPillow.addGestureRecognizer(dirtyPillowGestureRecognizer)
        } else {
            dirtyPillow.alpha = 0.0
            cleanPillows.alpha = 1.0
            objectDict["bedroom_dirty_pillows"]?.is_clean = true
        }
        
        //Add Dirty Trash Can Tap
        if (objectDict["bedroom_dirty_trash"]?.is_active)! {
            let dirtyTrashCanGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyTrashCan.isUserInteractionEnabled = true
            dirtyTrashCan.addGestureRecognizer(dirtyTrashCanGestureRecognizer)
        } else {
            dirtyTrashCan.alpha = 0.0
            objectDict["bedroom_dirty_trash"]?.is_clean = true
        }
        
        //Add Dirty Lamp Tap
        if (objectDict["bedroom_dirty_lamp"]?.is_active)! {
            let dirtyLampGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyLamp.isUserInteractionEnabled = true
            dirtyLamp.addGestureRecognizer(dirtyLampGestureRecognizer)
        } else {
            dirtyLamp.alpha = 0.0
            cleanLamp.alpha = 1.0
            objectDict["bedroom_dirty_lamp"]?.is_clean = true
        }
        
        //Add Dirty Nightstand Tap
        if (objectDict["bedroom_dirty_nightstand"]?.is_active)! {
            let dirtyNightstandGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyNightstand.isUserInteractionEnabled = true
            dirtyNightstand.addGestureRecognizer(dirtyNightstandGestureRecognizer)
        } else {
            dirtyNightstand.alpha = 0.0
            objectDict["bedroom_dirty_nightstand"]?.is_clean = true
        }
        
        //Add Dirty Rug Tap
        if (objectDict["bedroom_dirty_rug"]?.is_active)! {
            let dirtyRugGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyRug.isUserInteractionEnabled = true
            dirtyRug.addGestureRecognizer(dirtyRugGestureRecognizer)
        } else {
            dirtyRug.alpha = 0.0
            cleanRug.alpha = 1.0
            objectDict["bedroom_dirty_rug"]?.is_clean = true
        }
        
        //Add Dirty Towel Tap
        if (objectDict["bedroom_dirty_towel"]?.is_active)! {
            let dirtyTowelGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyTowel.isUserInteractionEnabled = true
            dirtyTowel.addGestureRecognizer(dirtyTowelGestureRecognizer)
        } else {
            dirtyTowel.alpha = 0.0
            objectDict["bedroom_dirty_towel"]?.is_clean = true
        }
        
        //Add Dirty Drink Tap
        if (objectDict["bedroom_dirty_drink"]?.is_active)! {
            let dirtyDrinkGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyDrink.isUserInteractionEnabled = true
            dirtyDrink.addGestureRecognizer(dirtyDrinkGestureRecognizer)
        } else {
            dirtyDrink.alpha = 0.0
            objectDict["bedroom_dirty_drink"]?.is_clean = true
        }
        
        //Add Dirty Window Tap
        if (objectDict["bedroom_dirty_window"]?.is_active)! {
            let dirtyWindowGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyWindow.isUserInteractionEnabled = true
            dirtyWindow.addGestureRecognizer(dirtyWindowGestureRecognizer)
        } else {
            dirtyWindow.alpha = 0.0
            objectDict["bedroom_dirty_window"]?.is_clean = true
        }
        
        //Add Dirty Stool Tap
        if (objectDict["bedroom_dirty_stool"]?.is_active)! {
            let dirtyStoolGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            dirtyStool.isUserInteractionEnabled = true
            dirtyStool.addGestureRecognizer(dirtyStoolGestureRecognizer)
        } else {
            dirtyStool.alpha = 0.0
            cleanStool.alpha = 1.0
            objectDict["bedroom_dirty_stool"]?.is_clean = true
        }
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
                case "bedroom_dirty_nightstand":
                    print("Nightstand's open drawer was clicked")
                    self.dirtyNightstand.alpha = 0.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_pillows":
                    print("Pillow on the floor was clicked")
                    self.dirtyPillow.alpha = 0.0
                    self.cleanPillows.alpha = 1.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_bed":
                    print("Messy bed was clicked")
                    self.dirtyBed.alpha = 0.0
                    self.cleanBed.alpha = 1.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_rug":
                    print("Flipped rug was clicked")
                    self.dirtyRug.alpha = 0.0
                    self.cleanRug.alpha = 1.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_lamp":
                    print("Flipped lamp was clicked")
                    self.dirtyLamp.alpha = 0.0
                    self.cleanLamp.alpha = 1.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_towel":
                    print("Towel on the floor was clicked")
                    self.dirtyTowel.alpha = 0.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_trash":
                    print("Full trash can was clicked")
                    self.dirtyTrashCan.alpha = 0.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_drink":
                    print("Spilled drink on the floor was clicked")
                    self.dirtyDrink.alpha = 0.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_stool":
                    print("Misplaced stool was clicked")
                    self.dirtyStool.alpha = 0.0
                    self.cleanStool.alpha = 1.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "bedroom_dirty_window":
                    print("Dirty Window was clicked")
                    self.dirtyWindow.alpha = 0.0
                    self.objectDict[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                default:
                    print("Error: Something was clicked but correct restoration identifier was not set!")
            }
            
            //Segue if we hit 12 (clean all dirty items)
            if self.score == 12 {
                self.performSegue(withIdentifier: "FinishBedroom", sender: self)
            }
            
        } else {
            //Transparent part of image view was selected
        }
    }
    
    func getActiveObj() {
        //Add all restoration identifiers to active object array
        for (objectName,_) in self.objectDict {
            self.activeObjs.append(objectName)
        }
        
        //Remove 5 random from active objects...
        for _ in 0...4 {
            let randomIndex = Int(arc4random_uniform(UInt32(self.activeObjs.count)))
            self.activeObjs.remove(at:randomIndex)
        }
        
        //Set active objects in dictionary!
        for activeObj in self.activeObjs {
            self.objectDict[activeObj]?.is_active = true
            self.objectDict[activeObj]?.is_clean = false
        }
        
    }
    
    func initDict(){
        //Bedroom Objects
        self.objectDict["bedroom_dirty_nightstand"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_pillows"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_bed"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_rug"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_lamp"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_towel"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_trash"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_drink"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_stool"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["bedroom_dirty_window"] = (
            is_active:false,
            is_clean:false
        )
        
        //Restroom Objects
        self.objectDict["restroom_dirty_towel"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["restroom_dirty_trash"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["restroom_dirty_rag"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["restroom_dirty_mirror"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["restroom_dirty_shower"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["restroom_dirty_floor"] = (
            is_active:false,
            is_clean:false
        )
        
        self.objectDict["restroom_dirty_rug"] = (
            is_active:false,
            is_clean:false
        )
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "restroomSegue" {
            let nextScene = segue.destination as? Restroom2
            nextScene?.objectDictRestroom = self.objectDict
            nextScene?.score = self.score
        } else if segue.identifier == "FinishBedroom" {
            //let nextScene = segue.destination as? FinishViewController
        }
    }
    

}
