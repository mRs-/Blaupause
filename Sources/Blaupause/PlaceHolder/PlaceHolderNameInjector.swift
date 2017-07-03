//
//  PlaceHolderNameInjector.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

class PlaceHolderNameInjector {
    
    let template: NameAble
    let placeHolderProvider: PlaceholderReplaceable
    
    init(stringWithPlaceHolder: NameAble, and nameProvider: PlaceholderReplaceable) {
        self.template = stringWithPlaceHolder
        self.placeHolderProvider = nameProvider
    }
    
    func nameWithoutPlaceHolder() -> String {
        return template.name.replacingOccurrences(of: placeHolderProvider.placeHolderToken,
                                                  with: placeHolderProvider.placeHolderName)
    }
}
