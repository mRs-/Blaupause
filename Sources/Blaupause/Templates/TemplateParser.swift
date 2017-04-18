//
//  TemplateParser.swift
//  Blaupause
//
//  Created by Marius Landwehr on 09.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation

class TemplateParser {
    
    private let data: Data
    
    init(with data: Data) {
        self.data = data
    }
    
    func parse() throws -> [TemplateGenerateable] {
        
        let parsed = try serialize().map({ (value: Any) -> TemplateGenerateable in
            
            func parseRecursive(value: [String: Any]) throws -> TemplateGenerateable {
                
                guard let type = value["type"] as? String,
                    let name = value["name"] as? String else {
                        throw TypeNotSetError()
                }
                
                switch type.lowercased() {
                case "file":
                    return File(name: name)
                case "folder":
                    
                    var children: [TemplateGenerateable]? = nil
                    
                    if let unparsedChildren = value["children"] as? [[String: Any]] {
                        children = try unparsedChildren.map{
                            try parseRecursive(value: $0)
                        }
                    }
                    
                    return Folder(name: name, children: children)
                default:
                    throw TypeNotSupportedError()
                }
                
            }
            
            guard let dict = value as? [String : Any] else {
                throw TypeNotADictionaryError()
            }
            
            return try parseRecursive(value: dict)
        })
        
        return parsed
    }
    
    private func serialize() throws -> [Any] {
        let templateJSON = try JSONSerialization.jsonObject(with: data, options: [])
        
        guard let jsonArray = templateJSON as? [Any] else {
            throw TemplateIsNotArrayError()
        }
        
        return jsonArray
    }
}

class TemplateIsNotArrayError: Error { }
class TypeNotADictionaryError: Error { }
class TypeNotSetError: Error { }
class TypeNotSupportedError: Error { }
