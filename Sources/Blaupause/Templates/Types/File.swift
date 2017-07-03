//
//  FileTemplate.swift
//  Blaupause
//
//  Created by Marius Landwehr on 16.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation
import Files

struct File: GenerateAble, FileTemplateAble {

    let name: String
    var placeHolderProvider: PlaceholderReplaceable!
    var fileTemplatePath: String?

    init(name: String) {
        self.name = name
    }

    func generate(with currentPath: String = "") throws -> RelativePath? {
        
        if let templateFilePath = fileTemplatePath {
            // when we have a template file we need create a file from there
            return try replacePlaceholder(in: templateFilePath)
        } else {
            try Files.Folder(path: currentPath).createFile(named: nameWithoutPlaceHolder)
        }
        
        return nil // we need no path for files
    }
}
