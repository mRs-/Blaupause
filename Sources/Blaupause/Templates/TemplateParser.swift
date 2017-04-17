//
//  TemplateParser.swift
//  Blaupause
//
//  Created by Marius Landwehr on 09.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation
//import os.log
//import os.activity

//let jsonLogging: OSLog = OSLog(subsystem: "de.mariuslandwehr.blaupause", category: "JSON")

class TemplateParser {
    
    private let data: Data
    
    init(with data: Data) {
        self.data = data
    }
    
    func parse() {
        
        do {
            try serialize().map {
                
                print($0.key)
                print($0.value)
                
//                let template = Template(with: <#T##Template.Type#>, andName: <#T##String#>)
                
            }
            
            
        } catch {
//            os_log("Failed to create JSON", log: jsonLogging, type: .error)
        }
    }
    
    private func serialize() throws -> [String: Any] {
        let templateJSON = try JSONSerialization.jsonObject(with: data, options: [])
        
        guard let jsonArray = templateJSON as? [String: Any] else {
//            os_log("Template is not beginning with JSON", log: jsonLogging, type: .error)
            throw TemplateIsNotArrayError()
        }
        
        return jsonArray
    }
}

class TemplateIsNotArrayError: Error { }
