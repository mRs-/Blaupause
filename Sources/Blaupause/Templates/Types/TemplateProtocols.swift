//
//  Template.swift
//  Blaupause
//
//  Created by Marius Landwehr on 14.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation
import Files

typealias RelativePath = String

protocol PlaceHolderProvideable {
    var placeHolderProvider: PlaceholderReplaceable! { get set }
}

protocol NameAble: PlaceHolderProvideable {
    var name: String { get }
}

protocol GenerateAble: NameAble {
    func generate(with currentPath: String) throws -> RelativePath?
}

protocol FileTemplateAble: GenerateAble {
    var fileTemplatePath: String? { get }
}

protocol ParentAble {
    var children: [GenerateAble]? { get }
}

extension GenerateAble {
    
    var nameWithoutPlaceHolder: String {
        let injector = PlaceHolderNameInjector(stringWithPlaceHolder: self, and: placeHolderProvider)
        return injector.nameWithoutPlaceHolder()
    }
}

extension FileTemplateAble {
    
    func replacePlaceholder(`in` path: String) throws -> String {
        
        let templateFileString = try Files.File(path: path).readAsString()
        let injector = PlaceHolderFileInjector(stringWithPlaceHolder: templateFileString, and: placeHolderProvider)
        return injector.fileWithoutPlaceHolder()
    }
}
