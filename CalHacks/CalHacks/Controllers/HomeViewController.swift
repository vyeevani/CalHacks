//
//  ViewController.swift
//  CalHacks
//
//  Created by Vineeth Yeevani on 10/7/17.
//  Copyright © 2017 Vineeth Yeevani. All rights reserved.
//





import UIKit

class HomeViewController: UIViewController {
    
    //Edit Text Field
    var editTextField: UITextField!
    
    //Button to convert and display image
    var convertButton: UIButton!
    
    //Button to transition to the next page and convert Images to QRCodes
    var nextPageButton: UIButton!
    
    //Text object
    var inputText: Text!
    
    //ImageView to display the QRCode
    var qrImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createEditText()
        createConvertButton()
        createNextPageButton()
        createQRImageView()
        inputText = Text(text: "{\"1\":\"/9j/4AAQSkZJRgABAQAASABIAAD\"}")
        inputText.qrConvert()
        qrImageView.image = inputText.image
    }
    
    //Create the text view for qrcode test
    func createEditText(){
        editTextField = UITextField(frame: CGRect(x:0, y:0, width: view.frame.height, height: view.frame.height * 0.1))
        editTextField.placeholder = "Enter text to QR Code:"
        view.addSubview(editTextField)
        
    }
    
    //Create the button view to convert the text
    func createConvertButton(){
        convertButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.1, width: view.frame.width, height: view.frame.height * 0.1))
        convertButton.setTitle("Convert to QRCode", for: .normal)
        convertButton.addTarget(self, action: #selector(convertToImage), for: .touchUpInside)
        convertButton.backgroundColor = .blue
        view.addSubview(convertButton)
    }
    
    //Create the ImageConverterViewController
    func createNextPageButton(){
        nextPageButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.2, width: view.frame.width, height: view.frame.height * 0.1))
        nextPageButton.setTitle("Go to next page", for: .normal)
        nextPageButton.backgroundColor = .blue
        nextPageButton.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        view.addSubview(nextPageButton)
    }
    
    //Create the qrCode ImageView to display the Image in
    func createQRImageView(){
        qrImageView = UIImageView(frame: CGRect(x: 0, y: view.frame.height * 0.4, width: view.frame.width, height: view.frame.width))
        view.addSubview(qrImageView)
    }
    
    //Convert the text and set make the ImageView Image the converted text
    @objc func convertToImage(){
        inputText = Text(text: editTextField.text!)
        inputText.qrConvert()
        qrImageView.image = inputText.image
    }
    
    //Go to next view
    @objc func goToNextPage(){
        self.performSegue(withIdentifier: "imageConverter", sender: self)
    }
}

