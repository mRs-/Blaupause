//
//  Template.swift
//  Blaupause
//
//  Created by Marius Landwehr on 14.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation

typealias RelativePath = String

protocol TemplateNameable {
    var name: String { get }
}

protocol TemplateGenerateable: TemplateNameable {
    var placeHolderProvider: PlaceholderNameable! { get set }
    func generate(with currentPath: String) -> RelativePath?
}

extension TemplateGenerateable {
    
    var nameWithoutPlaceHolder: String {
        let injector = PlaceHolderNameInjector(stringWithPlaceHolder: self, and: placeHolderProvider)
        return injector.nameWithoutPlaceHolder()
    }
}

protocol TemplateParantable {
    var children: [TemplateGenerateable]? { get }
}
