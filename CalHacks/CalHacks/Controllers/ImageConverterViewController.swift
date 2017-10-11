//
//  ImageConverterViewController.swift
//  CalHacks
//
//  Created by Vineeth Yeevani on 10/7/17.
//  Copyright © 2017 Vineeth Yeevani. All rights reserved.
//

import UIKit


class ImageConverterViewController: UIViewController {

    //ImageView to display the QRCode
    var qrImageView: UIImageView!
    
    //Button to select an Image from the
    var selectFromLibraryButton: UIButton!
    
    //Image picker
    var picker = UIImagePickerController()
    
    //Image object
    var image: Image!
    
    
    
    override func viewDidLoad() {
        
        picker.delegate = self
        super.viewDidLoad()
        createQRImageView()
        createSelectFromLibrary()
    }
    
    //Create the qrCode ImageView to display the Image in
    func createQRImageView(){
        qrImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width * 0.4))
    }
    
    func createSelectFromLibrary() {
        selectFromLibraryButton = UIButton(frame: CGRect(x: view.frame.width * 0.05, y: view.frame.height * 0.7, width: view.frame.width * 0.9, height: view.frame.height * 0.1))
        selectFromLibraryButton.setTitle("Select Photo of Event From Library", for: .normal)
        selectFromLibraryButton.setTitleColor(UIColor(red: 67.0/255.0, green: 130.0/255.0, blue: 232.0/255.0, alpha: 1.0), for: .normal)
        selectFromLibraryButton.backgroundColor = .white
        selectFromLibraryButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        //selectFromLibraryButton.addTarget(self, action: #selector(readQR), for: .touchUpInside)
        view.addSubview(qrImageView)
        view.addSubview(selectFromLibraryButton)
        
        
    }
    
    //Image picker
    @objc func pickImage(sender: UIButton!) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    //Go to read qr codes
    @objc func readQR() {
        self.performSegue(withIdentifier: "toReader", sender: self)
    }
}



//Extension of UIImagePickerController
extension ImageConverterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("test")
        qrImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        image = Image(image: qrImageView.image!)
        image.convert()
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
