//
//  TemplateGenerator.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation

class TemplateGenerator {

    let templates: [GenerateAble]
    let placeHolderProvider: PlaceholderReplaceable

    init(with templates: [GenerateAble], and placeHolderProvider: PlaceholderReplaceable) {
        self.templates = templates
        self.placeHolderProvider = placeHolderProvider
    }

    func generate() throws {

        try generate(with: templates)
    }

    private func generate(with templates: [GenerateAble], and relativePath: RelativePath = "") throws {

        try templates.forEach {

            var template = $0
            template.placeHolderProvider = placeHolderProvider

            let returnedRelativePath = try template.generate(with: relativePath) ?? ""

            if let children = (template as? ParentAble)?.children {
                try generate(with: children, and: returnedRelativePath)
            }
        }
    }
}
