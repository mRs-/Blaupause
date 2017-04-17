//
//  TemplateGenerator.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation

class TemplateGenerator {
    
    let templates: [TemplateGenerateable]
    let placeHolderProvider: PlaceholderNameable
    
    init(with templates: [TemplateGenerateable], and placeHolderProvider: PlaceholderNameable) {
        self.templates = templates
        self.placeHolderProvider = placeHolderProvider
    }
    
    func generate() {
        generate(with: templates)
    }
    
    private func generate(with templates: [TemplateGenerateable], and relativePath: RelativePath = "") {
        templates.forEach {
            
            var template = $0
            template.placeHolderProvider = placeHolderProvider
            
            let returnedRelativePath = template.generate(with: relativePath) ?? ""
            
            if let children = (template as? TemplateParantable)?.children {
                generate(with: children, and: returnedRelativePath)
            }
        }
    }
}
