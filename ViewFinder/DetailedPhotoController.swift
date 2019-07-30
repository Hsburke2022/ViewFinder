//
//  DetailedPhotoController.swift
//  ViewFinder
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class DetailedPhotoController: UIViewController {

    
  
    
    @IBOutlet weak var newPhoto: UIImageView!
    
    
    var photo : Photos? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //below is issue line
        if let realPhoto = photo {
            title = realPhoto.caption
            
            
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                   newPhoto.image = cellPhotoImage
                    
                }// end of if let cellPhotoImage
            }// end of if let cellPhotoImageData
        }//end of if let realPhoto

        // Do any additional setup after loading the view.
    }
    
    


}
