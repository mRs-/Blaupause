//
//  PlaceHolderFileInjector.swift
//  Blaupause
//
//  Created by Marius Landwehr on 03.07.17.
//

import Foundation

class PlaceHolderFileInjector {
    
    let template: String
    let placeHolderProvider: PlaceholderReplaceable
    
    init(stringWithPlaceHolder: String, and nameProvider: PlaceholderReplaceable) {
        self.template = stringWithPlaceHolder
        self.placeHolderProvider = nameProvider
    }
    
    func fileWithoutPlaceHolder() -> String {
        return template.replacingOccurrences(of: placeHolderProvider.placeHolderToken,
                                             with: placeHolderProvider.placeHolderName)
    }
}
