//
//  addRecipeVC.swift
//  recipez
//
//  Created by 邱国邦 on 15/12/23.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit
import CoreData

class addRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    //MARK: Outlets
    @IBOutlet weak var lblTitle: UITextField! // Wrong outlets name lbl !!!
    @IBOutlet weak var lblSteps: UITextField!
    @IBOutlet weak var lblIngredients: UITextField!
    @IBOutlet weak var foodImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        foodImg.layer.cornerRadius = 8.0
        foodImg.clipsToBounds = true
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {

        foodImg.image = image
        print("ok")
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: Functions
    func saveRecipe() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
        let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
        
        recipe.recipeTitle = lblTitle.text
        recipe.recipeIngredients = lblIngredients.text
        recipe.recipeSteps = lblSteps.text
        recipe.saveImage(foodImg.image!)
        
        do {
            try context.save()
        } catch {
            print("fail to save")
        }
    }
    
    //MARK: Actions
    @IBAction func onAddImgBtnPressed(sender: UIButton) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onAddNewRecipeBtnPressed(sender: UIButton) {
        // Call some func to save data
        if let title = lblTitle.text where title != "" {
            saveRecipe()
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
