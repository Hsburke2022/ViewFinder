//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/29/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }// end of override
    
    
    @IBAction func takeSelfie(_ sender: Any) {
        imagePicker.sourceType = .camera
        present (imagePicker, animated: true, completion: nil)
    } //end of takeSelfie

    
    @IBAction func galleryTap(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present (imagePicker, animated: true, completion: nil)
    }// end of galleryTap
    
    
    @IBOutlet weak var newImage: UIImageView!
    
    
    internal func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage =
            info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                newImage.image = selectedImage
            imagePicker.dismiss(animated: true, completion: nil)

        }// end of if
        
        
        
    } //end of private
    
   
    @IBAction func savePhotoTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
                photoToSave.caption = captionText.text
            
            if let userImage = newImage.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                } //end of if let useImageData
            }// end of if let userImage
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            navigationController?.popViewController(animated: true)
            
        }//end of if let context
    }//end of savePhotoTapped
    
    @IBOutlet weak var captionText: UITextField!
    
}// end of class
