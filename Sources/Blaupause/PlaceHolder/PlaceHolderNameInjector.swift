//
//  PlaceHolderNameInjector.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

class PlaceHolderNameInjector {
    
    let template: TemplateNameable
    let placeHolderProvider: PlaceholderNameable
    
    init(stringWithPlaceHolder: TemplateNameable, and nameProvider: PlaceholderNameable) {
        self.template = stringWithPlaceHolder
        self.placeHolderProvider = nameProvider
    }
    
    func nameWithoutPlaceHolder() -> String {
        
        return template.name.replacingOccurrences(of: "*",
                                                  with: placeHolderProvider.placeHolderName)
    }
}
