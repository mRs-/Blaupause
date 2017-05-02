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

    func generate(with currentPath: String = "") throws -> RelativePath? {
        try Files.Folder(path: currentPath).createFile(named: nameWithoutPlaceHolder)
        return nil // we need no path for files
    }
}
