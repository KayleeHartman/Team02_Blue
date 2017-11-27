//
//  Restroom2.swift
//  Team02_Blue
//
//  Created by Gustavo E Soto on 11/26/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import UIKit

class Restroom2: UIViewController {
    
    var objectDictRestroom: [String:(
        is_active:Bool,
        is_clean:Bool
        )] = [:]
    var score:Int = 0
    
    // Show clean room
    @IBOutlet weak var cleanRoom: UIImageView!
    let roomImage = UIImage(named: "Bathroom.png")
    @IBAction func cleanRoomDown(_ sender: UIButton) {
        cleanRoom.image = roomImage
    }
    @IBAction func cleanRoomUp(_ sender: UIButton) {
        cleanRoom.image = nil
    }
    
    //Connect all outlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var restroomDirtyTowel: UIImageView!
    @IBOutlet weak var restroomDirtyTrash: UIImageView!
    @IBOutlet weak var restroomDirtyRag: UIImageView!
    @IBOutlet weak var restroomDirtyMirror: UIImageView!
    @IBOutlet weak var restroomDirtyShower: UIImageView!
    @IBOutlet weak var restroomDirtyFloor: UIImageView!
    @IBOutlet weak var restroomCleanRug: UIImageView!
    @IBOutlet weak var restroomDirtyRug: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Add Dirty Towel Tap
        if (objectDictRestroom["restroom_dirty_towel"]?.is_active)! && objectDictRestroom["restroom_dirty_towel"]?.is_clean == false {
            let dirtyTowelGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            restroomDirtyTowel.isUserInteractionEnabled = true
            restroomDirtyTowel.addGestureRecognizer(dirtyTowelGestureRecognizer)
            
        } else {
            restroomDirtyTowel.alpha = 0.0
            objectDictRestroom["restroom_dirty_towel"]?.is_clean = true
        }
        
        //Add Dirty Trash Can Tap
        if (objectDictRestroom["restroom_dirty_trash"]?.is_active)! && objectDictRestroom["restroom_dirty_trash"]?.is_clean == false {
            let dirtyTrashGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            restroomDirtyTrash.isUserInteractionEnabled = true
            restroomDirtyTrash.addGestureRecognizer(dirtyTrashGestureRecognizer)
        } else {
            restroomDirtyTrash.alpha = 0.0
            objectDictRestroom["restroom_dirty_trash"]?.is_clean = true
        }
        
        //Add Dirty Rag Tap
        if (objectDictRestroom["restroom_dirty_rag"]?.is_active)! && objectDictRestroom["restroom_dirty_rag"]?.is_clean == false {
            let dirtyRagGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            restroomDirtyRag.isUserInteractionEnabled = true
            restroomDirtyRag.addGestureRecognizer(dirtyRagGestureRecognizer)
        } else {
            restroomDirtyRag.alpha = 0.0
            objectDictRestroom["restroom_dirty_rag"]?.is_clean = true
        }
        
        //Add Dirty Mirror Tap
        if (objectDictRestroom["restroom_dirty_mirror"]?.is_active)! && objectDictRestroom["restroom_dirty_mirror"]?.is_clean == false {
            let dirtyMirrorGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            restroomDirtyMirror.isUserInteractionEnabled = true
            restroomDirtyMirror.addGestureRecognizer(dirtyMirrorGestureRecognizer)
        } else {
            restroomDirtyMirror.alpha = 0.0
            objectDictRestroom["restroom_dirty_mirror"]?.is_clean = true
        }
        
        //Add Dirty Shower Tap
        if (objectDictRestroom["restroom_dirty_shower"]?.is_active)! && objectDictRestroom["restroom_dirty_shower"]?.is_clean == false {
            let dirtyShowerGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            restroomDirtyShower.isUserInteractionEnabled = true
            restroomDirtyShower.addGestureRecognizer(dirtyShowerGestureRecognizer)
        } else {
            restroomDirtyShower.alpha = 0.0
            objectDictRestroom["restroom_dirty_shower"]?.is_clean = true
        }
        
        //Add Dirty Floor Tap
        if (objectDictRestroom["restroom_dirty_floor"]?.is_active)! && objectDictRestroom["restroom_dirty_floor"]?.is_clean == false {
            let dirtyFloorGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            restroomDirtyFloor.isUserInteractionEnabled = true
            restroomDirtyFloor.addGestureRecognizer(dirtyFloorGestureRecognizer)
        } else {
            restroomDirtyFloor.alpha = 0.0
            objectDictRestroom["restroom_dirty_floor"]?.is_clean = true
        }
        
        //Add Dirty Rug Tap
        if (objectDictRestroom["restroom_dirty_rug"]?.is_active)! && objectDictRestroom["restroom_dirty_rug"]?.is_clean == false {
            let dirtyRugGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            restroomDirtyRug.isUserInteractionEnabled = true
            restroomDirtyRug.addGestureRecognizer(dirtyRugGestureRecognizer)
        } else {
            restroomDirtyRug.alpha = 0.0
            restroomCleanRug.alpha = 1.0
            objectDictRestroom["restroom_dirty_rug"]?.is_clean = true
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
                case "restroom_dirty_towel":
                    print("Towel on the floor was clicked")
                    self.restroomDirtyTowel.alpha = 0.0
                    self.objectDictRestroom[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "restroom_dirty_trash":
                    print("Full trash can was clicked")
                    self.restroomDirtyTrash.alpha = 0.0
                    self.objectDictRestroom[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "restroom_dirty_rag":
                    print("Dirty rag was clicked")
                    self.restroomDirtyRag.alpha = 0.0
                    self.objectDictRestroom[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "restroom_dirty_mirror":
                    print("Dirty mirror was clicked")
                    self.restroomDirtyMirror.alpha = 0.0
                    self.objectDictRestroom[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "restroom_dirty_shower":
                    print("Dirty shower was clicked")
                    self.restroomDirtyShower.alpha = 0.0
                    self.objectDictRestroom[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "restroom_dirty_floor":
                    print("Dirty restroom floor was clicked")
                    self.restroomDirtyFloor.alpha = 0.0
                    self.objectDictRestroom[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                case "restroom_dirty_rug":
                    print("Flipped rug was clicked")
                    self.restroomDirtyRug.alpha = 0.0
                    self.restroomCleanRug.alpha = 1.0
                    self.objectDictRestroom[restorationIdentifier]?.is_clean = true
                    self.score += 1
                    self.scoreLabel.text = "Items Cleaned: \(self.score) / 12"
                default:
                    print("Error: Something was clicked but correct restoration identifier was not set!")
            }
            
            //Segue if we hit 12
            if self.score == 12 {
                self.performSegue(withIdentifier: "FinishBathroom", sender: self)
            }
        } else {
            //Transparent part of image view was selected
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func prevSegueArrowOrg(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToBedroom", sender: self)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FinishBathroom" {
            //let nextScene = segue.destination as? FinishViewController
            
        } else {
            let nextScene = segue.destination as? Bedroom2
            nextScene?.objectDict = self.objectDictRestroom
            nextScene?.score = self.score
        }
    }
}
