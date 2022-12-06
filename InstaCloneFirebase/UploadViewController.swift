//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Ummugulsum Çekin on 24.11.2022.
//

import UIKit
import Firebase

class UploadViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
            let gestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(self.chooseImage))
             imageView.addGestureRecognizer(gestureRecognizer)
             imageView.isUserInteractionEnabled = true
         }

   @objc func chooseImage() {
       let pickerController = UIImagePickerController ()
       pickerController.delegate = self
       pickerController.sourceType = .photoLibrary
       present(pickerController, animated: true, completion: nil)
                 
             }
    func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
             }

    @IBAction func actionButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        
        if let  data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let imageReference = mediaFolder.child("image.jpg")
            imageReference.putData(data, metadata: nil) {
                (metadata, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    
                }else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                    }
                    
                }
            }
            
        }
    }
}
