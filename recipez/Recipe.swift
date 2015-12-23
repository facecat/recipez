//
//  Recipe.swift
//  recipez
//
//  Created by 邱国邦 on 15/12/23.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

    func saveImage(img: UIImage) {
        let imageData = UIImagePNGRepresentation(img)
        recipeImage = imageData
    }
    
    func getImageFromData(imgData: NSData?) ->UIImage {
        let img = UIImage(data: imgData!)! // May this cause App crash ?
        return img
    }
}
