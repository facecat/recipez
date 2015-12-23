//
//  addRecipeVC.swift
//  recipez
//
//  Created by 邱国邦 on 15/12/23.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class addRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    //MARK: Outlets
    @IBOutlet weak var lblTitle: UITextField! // Wrong outlets name lbl !!!
    @IBOutlet weak var lblSteps: UITextField!
    @IBOutlet weak var lblIngredients: UITextField!
    @IBOutlet weak var foodImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.layer.cornerRadius = 8.0
        foodImg.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {

        foodImg.image = image
        print("ok")
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: Actions
    @IBAction func onAddImgBtnPressed(sender: UIButton) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onAddNewRecipeBtnPressed(sender: UIButton) {
        // Call some func to save data
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
