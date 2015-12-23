//
//  RecipeCell.swift
//  recipez
//
//  Created by 邱国邦 on 15/12/23.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configureCell(recipe: Recipe) {
        recipeImg.image = recipe.getImageFromData(recipe.recipeImage)
        recipeTitle.text = recipe.recipeTitle
    }
    
}
