//
//  FileViewController.swift
//  Collection
//
//  Created by ijk on 4/10/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit

class FileViewController: UIViewController {

    let modelStorage = ModelStorage()
    
    @IBOutlet weak var dogName: UITextField!
    @IBOutlet weak var dogBreed: UITextField!
    @IBOutlet weak var DogHeight: UITextField!
    @IBOutlet weak var dogWeight: UITextField!
    @IBOutlet weak var texViewJson: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    //Hide KeyBoard
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction2))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        //setting toolbar as inputAccessoryView
        self.dogName.inputAccessoryView = toolbar
        self.dogBreed.inputAccessoryView = toolbar
        self.DogHeight.inputAccessoryView = toolbar
        self.dogWeight.inputAccessoryView = toolbar
        self.texViewJson.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction2() {
        self.dogName.endEditing(true)
        self.dogBreed.endEditing(true)
        self.DogHeight.endEditing(true)
        self.dogWeight.endEditing(true)
        self.texViewJson.endEditing(true)
    }
    
   
    
    
    @IBAction func saveFileClick(_ sender: UIButton) {
        
        let name: String = dogName.text ?? "Sirko"
        let breed: String = dogBreed.text ?? "Taksa"
        let height: String = DogHeight.text ?? "0"
        let weight: String = dogWeight.text ?? "0"
        
        let dog = Dog(name: name,
                      breed: breed,
                      height: height,
                      weight: weight)
        
        let jsonString = Serialize.getEncode(obj: dog)
        
/////////////
        let alertController = UIAlertController(title: "\n\n", message: "", preferredStyle: UIAlertController.Style.alert)
        let rect = CGRect(x: 20, y: 45.0,
                          width: 220,
                          height: 20)
        let editFileName: UITextField! = UITextField(frame: rect)
        editFileName.backgroundColor = .white
        editFileName.placeholder = "name"
        
        let rect2 = CGRect(x: alertController.view.frame.width/3.5, y: 15.0,
                           width: 200,
                           height: 20)
        let textField: UITextField = UITextField(frame: rect2)
        textField.text = "File"
        
        alertController.view.addSubview(textField)
        alertController.view.addSubview(editFileName)
        
        let somethingAction = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in print("OK")
            self.texViewJson.text = jsonString
            let fileName = editFileName.text ?? "<#default value#>";
            let ac = self.modelStorage.saveFile(fileName: fileName + ".txt", fileData: jsonString)
            self.present(ac, animated: true)
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
        
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion:{})
        }
        
    }
    

}
