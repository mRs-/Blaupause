//
//  FolderTemplate.swift
//  Blaupause
//
//  Created by Marius Landwehr on 16.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation
import Files

struct Folder: TemplateGenerateable, TemplateParantable {
    
    var placeHolderProvider: PlaceholderNameable!
    
    let name: String
    let children: [TemplateGenerateable]?
    
    init(name: String, children: [TemplateGenerateable]?) {
        self.name = name
        self.children = children
    }
    
    func generate(with currentPath: String) throws -> RelativePath? {
        
        try Files.Folder(path: currentPath).createSubfolder(named: nameWithoutPlaceHolder)
        
        return fullPath(for:currentPath)
    }
    
    private func fullPath(`for` path: String) -> String {
        if path.characters.count == 0 {
            return nameWithoutPlaceHolder
        } else {
            return "\(path)/\(nameWithoutPlaceHolder)"
        }
    }
}
