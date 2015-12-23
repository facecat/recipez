//
//  Recipe+CoreDataProperties.swift
//  recipez
//
//  Created by 邱国邦 on 15/12/23.
//  Copyright © 2015年 FaceCat. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var recipeTitle: String?
    @NSManaged var recipeImage: NSData?
    @NSManaged var recipeSteps: String?
    @NSManaged var recipeIngredients: String?

}
