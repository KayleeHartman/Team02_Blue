//
//  BathroomViewController.swift
//  Team02_Blue_Todd
//
//  Created by Haines D Todd on 11/18/17.
//  Copyright © 2017 Haines D Todd. All rights reserved.
//

import UIKit

class BathroomViewController: UIViewController {
    
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
        
        background = createImageViewFromAsset(assetName: "Bathroom_Background.png", width: width, height: height)
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bathroom_DirtyRag.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "dirty dirty dish rag"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bathroom_DirtyTowel.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "larger dirty dirty dish rag"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bathroom_FlippedRug.png", width: width, height: height),
                                        viewWhenClean: createImageViewFromAsset(assetName: "Bathroom_Rug.png", width: width, height: height),
                                        identifier: "another disgruntled rug"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bathroom_FloorDirt.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "could grow some plants in this"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bathroom_FullTrashcan.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "trash can of full"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bathroom_MirrorSmudges.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "who needs reflections anyways"))
        
        cleanupItems.append(CleanupItem(viewWhenDirty: createImageViewFromAsset(assetName: "Bathroom_ShowerSmudges.png", width: width, height: height),
                                        viewWhenClean: nil,
                                        identifier: "slightly moldy"))

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


