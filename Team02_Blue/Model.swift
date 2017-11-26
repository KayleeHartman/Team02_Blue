//
//  Model.swift
//  Team02_Blue_Todd
//
//  Created by Haines D Todd on 11/18/17.
//  Copyright © 2017 Haines D Todd. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    let DEBUG = true
    
    var itemsToClean: Int = 0
    var cleanupItems: [CleanupItem] = []
    
    init(itemsToClean: Int, cleanupItems: [CleanupItem]) {
        
        self.itemsToClean = min(cleanupItems.count, itemsToClean)
        self.cleanupItems = cleanupItems
        
        shuffleItems()
        for i in 0..<itemsToClean { //set the first few items as the ones to be cleaned in this instantiation of the cleaning game
            cleanupItems[i].activateItem()
        }
    }
    
    //randomizes the order of the cleanupItems array
    private func shuffleItems() {
        for i in 0..<cleanupItems.count {
            let rand = Int(arc4random_uniform(UInt32(cleanupItems.count-1)))
            
            let temp = cleanupItems[rand]
            cleanupItems[rand] = cleanupItems[i]
            cleanupItems[i] = temp
        }
    }
    
    func reset() {
        for item in cleanupItems {item.deactivateItem()}
        
        shuffleItems()
        for i in 0..<itemsToClean { //set the first few items as the ones to be cleaned in this instantiation of the cleaning game
            cleanupItems[i].activateItem()
        }
    }
    
    //when a user event occurs update the model
    //The model assumes that all of the images are have the same size and location.
    //Thus, the only piece of information the model needs is the coordinates of the event the user
    //initiated. The coordinates are given relative to the images used by the model
    func update(coordinates: CGPoint) {
        
        for item in cleanupItems {
            
            //if the item is being used in the current game instantiation and hasn't already been cleaned
            if item.isActive() && !item.isClean() {
                
                //get RGBA value of the pixel at the coordinates of the event the user initiated
                if let imageView = item.getDirtyView() {
                    let color = imageView.image?.getPixelColor(location: coordinates, size: imageView.frame.size)
                    
                    print(color!)
                    
                    //if the alpha of that pixel is nonzero, then the user tapped on the relevant
                    //part of the image (the part that isn't transparent)
                    if color?.colorComponents?.alpha != 0.0 {
                        
                        //mark the item as cleaned as check to see if the game is finished
                        item.clean()
                        if (DEBUG) {print(item.getIdentifier())}
                    }
                }
            }
            else {continue}
        }
    }
    
}

