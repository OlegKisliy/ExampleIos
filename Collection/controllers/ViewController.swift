//
//  ViewController.swift
//  Collection
//
//  Created by ijk on 4/10/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editPref: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editPref.text = getPreg()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "\n\n", message: "", preferredStyle: UIAlertController.Style.alert)
                let rect = CGRect(x: 20, y: 45.0,
                                  width: 220,
                                  height: 20)
        let fileName: UITextField! = UITextField(frame: rect)
        fileName.backgroundColor = .white
        fileName.placeholder = "Text"
        
        let rect2 = CGRect(x: alertController.view.frame.width/6, y: 15.0,
                          width: 200,
                          height: 20)
        let textField: UITextField = UITextField(frame: rect2)
        textField.text = "Shared preferences"
        
        alertController.view.addSubview(textField)
        alertController.view.addSubview(fileName)
     
        let somethingAction = UIAlertAction(title: "Save", style: .default, handler: {(alert: UIAlertAction!) in print("something")
            self.savePref(text: fileName.text ?? "<#default value#>")
            self.editPref.text = fileName.text ?? "<#default value#>"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
        
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion:{})
        }
    }
    
    
    func savePref(text: String) {
        let preferences = UserDefaults.standard
        let currentLevelKey = "prefKey"
        preferences.set(text, forKey: currentLevelKey)
        //  Save to disk
        let didSave = preferences.synchronize()
        
        if !didSave {
            //  Couldn't save (I've never seen this happen in real world testing)
        }
    }
    
    func getPreg() -> String{
        var res = ""
        
        let preferences = UserDefaults.standard
        
        let currentLevelKey = "prefKey"
        
        if preferences.object(forKey: currentLevelKey) == nil {
            //  Doesn't exist
        } else {
            let currentLevel = preferences.string(forKey: currentLevelKey)
            res = currentLevel ?? "<#default value#>"
        }
     return res
    }
    



}

