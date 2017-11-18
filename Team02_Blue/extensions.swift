//
//  extensions.swift
//  Team02_Blue
//
//  Created by Haines D Todd on 11/18/17.
//  Copyright © 2017 BlueTeam. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    //retrieve the color of a pixel as a specific point using the frame size of the view to scale
    func getPixelColor(location: CGPoint, size: CGSize) -> UIColor {
        let x: CGFloat = (self.size.width) * location.x / size.width
        let y: CGFloat = (self.size.height) * location.y / size.height
        
        let pixelPoint: CGPoint = CGPoint(x: x, y: y) //the scaled point relative to the frame size
        
        //retrieve the pixel data via some low UI stuff
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelIndex: Int = ((Int(self.size.width) * Int(pixelPoint.y)) + Int(pixelPoint.x)) * 4
        
        let r = CGFloat(data[pixelIndex]) / CGFloat(255.0)
        let g = CGFloat(data[pixelIndex+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelIndex+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelIndex+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}

extension UIColor {
    
    //a computed property for UIColor that makes it easier to pick out the RGBA values of a UIColor
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        if let components = self.cgColor.components {
            return (red: components[0],green: components[1],blue: components[2],alpha: components[3])
        }
        else {return nil}
    }
}
