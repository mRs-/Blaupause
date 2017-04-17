//
//  FileTemplate.swift
//  Blaupause
//
//  Created by Marius Landwehr on 16.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation
import Files

struct File: TemplateGenerateable {

    let name: String
    var placeHolderProvider: PlaceholderNameable!
    
    init(name: String) {
        self.name = name
    }
    
    func generate(with currentPath: String = "") -> RelativePath? {
        
        do {
            try Files.Folder(path: currentPath).createFile(named: nameWithoutPlaceHolder)
            print("Created File \(nameWithoutPlaceHolder)")
            return nil
        } catch {
            print("Can't create File \(nameWithoutPlaceHolder)")
            return nil
        }
    }
}
