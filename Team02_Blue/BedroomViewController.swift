//
//  BedroomViewController.swift
//  Team02_Blue_Todd
//
//  Created by Haines D Todd on 11/18/17.
//  Copyright © 2017 Haines D Todd. All rights reserved.
//

import UIKit

class BedroomViewController: UIViewController {
    
    var background: UIImageView?
    var cleanupItems: [CleanupItem] = []
    
    var model: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCleanupItemImages() //create UIImages from the assets related to the bedroom and initialize the cleanupItems array
        model = Model(itemsToClean: cleanupItems.count, cleanupItems: cleanupItems) //initialize the model by passing all of the cleanup items into it
        
        //the background is the only image that needs a tapGestureRecognizer attached to it
        background?.isUserInteractionEnabled = true
        background?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(itemTapped)))
        
    }
    
    @objc func itemTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let touchPoint = tapGestureRecognizer.location(in: background)
        model?.update(coordinates: touchPoint)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    //programmatically create UIImageViews for all of the images used for this room
    //the background image is placed alone and will have a TapGestureRecognizer attached to it
    //it is important that all of the images have the same size and location within the main view
    
    //cleanup items are placed in an instance of the CleanupItem class along
    //the CleanupItem class accepts the image for the dirty version of the item and the clean version (i.e. unmadeBed.png and madeBed.png)
    //if the dirty version of the item has no compliment, nil is passed into the CleanupItem constructor
    func loadCleanupItemImages() {
        let width = view.frame.width - 250
        let height = view.frame.height - 250
        
        background = createImageViewFromAsset(assetName: "Bedroom_Background.png", width: width, height: height)
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_OnePillow.png", width: width, height: height),
                                        viewWhenClean: createImageViewFromAsset(assetName: "Bedroom_AllPillows.png", width: width, height: height),
                                        identifier: "pillow fight leftovers"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_DirtyTowel.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "dirty towel"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_FallenLamp.png", width: width, height: height),
                                        viewWhenClean: createImageViewFromAsset(assetName: "Bedroom_Lamp.png", width: width, height: height),
                                        identifier: "sleeping lamp"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_FlippedRug.png", width: width, height: height),
                                        viewWhenClean: createImageViewFromAsset(assetName: "Bedroom_Rug.png", width: width, height: height),
                                        identifier: "rug that is flipping you off"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_FullTrashcan.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "trash full of can"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_UnmadeBed.png", width: width, height: height),
                                        viewWhenClean: createImageViewFromAsset(assetName: "Bedroom_MadeBed.png", width: width, height: height),
                                        identifier: "bootcamp seargent would not approve"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_WindowSmudges.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "window stains of unknown origin"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_SpilledDrink.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "chemical spill (most likely Ricin)"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_FullStool.png", width: width, height: height),
                                        viewWhenClean: createImageViewFromAsset(assetName: "Bedroom_Stool.png", width: width, height: height),
                                        identifier: "ottomon is evolving"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_Remote.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "RF transmitting device does not meet FCC regulations"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bedroom_OpenNightstand.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "lock out tagout protocol not followed"))
    }
    
    //create a UIImageView and place it in the center of the screen with specified height and width
    func createImageViewFromAsset (assetName: String, width: CGFloat, height: CGFloat) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: assetName))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: view.center.x-(width/2), y: view.center.y-(height/2), width: width, height: height)
        self.view.addSubview(imageView)
        
        return imageView
    }
    
}

