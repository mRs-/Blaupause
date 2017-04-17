//
//  PlaceHoldable.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

protocol PlaceholderNameable {
    var placeHolderName: String { get set }
}

struct PlaceHolderProvider: PlaceholderNameable {
    var placeHolderName: String = "Map"
}
