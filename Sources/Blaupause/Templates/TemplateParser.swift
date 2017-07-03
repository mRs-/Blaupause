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

    func parse() throws -> [GenerateAble] {

        let parsedTemplateGeneratable = try serialize().map({ (value: Any) -> GenerateAble in
            
            /// Generates the recusrive structure from the JSON File
            ///
            /// - Parameter value: must be an JSON-Dictionary
            /// - Returns: TemplateGeneratable content
            /// - Throws: TypeNotSupportedError, TypeNotADictionaryError, TypeNotSetError
            func parseRecursive(value: [String: Any]) throws -> GenerateAble {

                // get name and type
                guard
                    let type = value["type"] as? String,
                    let name = value["name"] as? String else {
                        throw TypeNotSetError()
                }

                switch type.lowercased() {
                    
                case "file": // generate a file
                    var file = File(name: name)
                    file.fileTemplatePath = value["file"] as? String
                    return file
                    
                case "folder": // generate a folder, can be recursive

                    var children: [GenerateAble]? = nil

                    // when we got children we try to parse them as well
                    if let unparsedChildren = value["children"] as? [[String: Any]] {
                        
                        // try to map the children recursive
                        children = try unparsedChildren.map {
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

        return parsedTemplateGeneratable
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
