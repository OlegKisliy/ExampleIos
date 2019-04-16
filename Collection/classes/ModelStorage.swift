//
//  Model.swift
//  Collection
//
//  Created by ijk on 4/10/19.
//  Copyright © 2019 x. All rights reserved.
//

import Foundation
import UIKit

public class ModelStorage{
    
    public func saveFile(fileName: String, fileData: String) -> UIAlertController{
        let str = fileData
        let filename = getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            try
                str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            let ac = UIAlertController(title: "File Manager", message: "File: " + fileName + " - Saved", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                return ac
        } catch {
            let ac = UIAlertController(title: "File Manager", message: "Save error", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            return ac
        }
        
    }
   
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    
}
