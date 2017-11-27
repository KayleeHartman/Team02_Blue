//
//  CleanupItem.swift
//  Team02_Blue_Todd
//
//  Created by Haines D Todd on 11/18/17.
//  Copyright © 2017 Haines D Todd. All rights reserved.
//

import Foundation
import UIKit

//a class that holds all of the attributes of on item in the room that can be cleaned up
class CleanupItem {
    
    private var isItemActive: Bool = false //sets whether or not the item is being used for the current instantiation of the cleanup game
    private var isItemCleaned: Bool = false //flags whether or not the item has been cleaned
    
    private var viewWhenDirty: UIImageView?  //an image to show when the cleanup item is active and has not been cleaned yet
    private var viewWhenClean: UIImageView? //an image item to show when the cleanup item has been cleaned, if no such image exists it will be nil
    
    private var identifier: String = "null"
    
    //the contstuctor
    //if no viewWhenClean image exists for this cleanup item, pass nil in as a argument for it
    init(viewWhenDirty: UIImageView, viewWhenClean: UIImageView?, identifier id: String){
        identifier = id
        self.viewWhenDirty = viewWhenDirty
        self.viewWhenClean = viewWhenClean
        
        if (isItemActive) { //if the item is active set the dirty image to be showing
            if let dirty = self.viewWhenDirty {dirty.isHidden = false}
            if let clean = self.viewWhenClean {clean.isHidden = true}
        }
        else { //set only the clean item to be visible
            if let dirty = self.viewWhenDirty {dirty.isHidden = true}
            if let clean = self.viewWhenClean {clean.isHidden = false}
        }
    }
    
    func clean() {
        if isItemActive {
            if let dirty = self.viewWhenDirty {dirty.isHidden = true}
            if let clean = self.viewWhenClean {clean.isHidden = false}
            isItemCleaned = true
        }
    }
    
    func isClean() -> Bool {return isItemCleaned}
    func isActive() -> Bool {return isItemActive}
    func getIdentifier() -> String {return identifier}
    func getDirtyView() -> UIImageView? {return viewWhenDirty}
    func getCleanView() -> UIImageView? {return viewWhenClean}
    
    func activateItem() {
        isItemActive = true
        if let dirty = self.viewWhenDirty {dirty.isHidden = false}
        if let clean = self.viewWhenClean {clean.isHidden = true}
    }
    func deactivateItem() {
        isItemActive = false
        if let dirty = self.viewWhenDirty {dirty.isHidden = true}
        if let clean = self.viewWhenClean {clean.isHidden = false}
    }
    
}

