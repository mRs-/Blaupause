//
//  PlaceHoldable.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

protocol PlaceholderReplaceable {
    var placeHolderName: String { get set }
    var placeHolderToken: String { get set }
}

struct PlaceHolderProvider: PlaceholderReplaceable {
    var placeHolderName: String = "Map"
    var placeHolderToken: String = "*"
}
