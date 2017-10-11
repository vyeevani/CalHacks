//
//  Text.swift
//  CalHacks
//
//  Created by Vineeth Yeevani on 10/7/17.
//  Copyright © 2017 Vineeth Yeevani. All rights reserved.
//

import Foundation
import UIKit

class Text{
    
    //Actual text of the string
    var text: String?
    
    //Data from the text
    var textData: Data?
    
    //Filter to convert to QR code for the CIImage
    var filter: CIFilter?
    
    //QR code generated
    var qrCode: CIImage?
    
    //Image to be outputted
    var image: UIImage?

    init(text: String) {
        self.text = text
        
        //Sets the filter attributes for the class
        self.filter = CIFilter(name: "CIQRCodeGenerator")!
        self.filter?.setValue("Q", forKey: "inputCorrectionLevel")
    }
    
    
    //Convert the text into a qr code
    func qrConvert(){
        self.textData = self.text?.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        self.filter?.setValue(self.textData, forKey: "inputMessage")
        self.image = UIImage(ciImage: (self.filter?.outputImage)!)
    }

}
