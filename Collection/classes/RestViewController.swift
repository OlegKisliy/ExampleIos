//
//  RestViewController.swift
//  Collection
//
//  Created by ijk on 4/11/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit

class RestViewController: UIViewController {

    @IBOutlet weak var strURL: UITextField!
    @IBOutlet weak var strResponse: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clickGET(_ sender: UIButton) {
        
//        let str = "http://date.jsontest.com/"
        
        let str: String = strURL.text ?? "qwe"
        
        print(str)
        
        guard let url = URL(string: str) else {return}
        
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
        
                DispatchQueue.main.async {
                    self.strResponse.text = String(data: dataResponse, encoding: .utf8)
                }
                
                
//                self.strResponse.text = String(jsonResponse)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
    }
    
    
    
    func JSONStringify(value: Any, prettyPrinted: Bool = true) -> String {
        var res = ""
        do {
            let data = try JSONSerialization.data(withJSONObject:value)
            let dataString = String(data: data, encoding: .utf8)!
            print(dataString)
            res = dataString
        } catch {
            print("JSON serialization failed: ", error)
        }
        return res
    }
    
    

}
