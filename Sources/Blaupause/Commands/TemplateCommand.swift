//
//  TemplateCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation
import Commandant
import Result
import Files

struct TemplateCommand: CommandProtocol {
    struct Options: OptionsProtocol {
        let moduleName: String
        let templateFilePath: String
        
        
        static func create(_ moduleName: String) -> (_ templateFilePath: String) -> Options {
            return { templateFilePath in
                Options(moduleName: moduleName, templateFilePath: templateFilePath)
            }
        }
        
        static func evaluate(_ m: CommandMode) -> Result<Options, CommandantError<CommandantError<()>>> {
        return create
            <*> m <| Argument(usage: "Name of the new Module from template")
            <*> m <| Option(key: "template", defaultValue: ".blaupause.json", usage: "blaupause file for creating new template. Defaults to .blaupause.json in the current folder")
        }
    }
    
    var verb: String = "template"
    var function: String = "Creates a new Folder / File Structure from a given .json file"
    
    func run(_ options: Options) -> Result<(), CommandantError<()>> {
        
        
        do {
            let file = try Files.File(path: options.templateFilePath)
            let data = try file.read()
            
            let templateJSONParser = TemplateParser(with: data)
            let parsedTemplate = try templateJSONParser.parse()
            
            // provide the placeholder
            let placeHolderProvider = PlaceHolderProvider(placeHolderName: options.moduleName)
            let generator = TemplateGenerator(with: parsedTemplate, and: placeHolderProvider)
            
            try generator.generate()
            return .success()
            
        } catch {
            print (error)
            exit(2)
        }
    }
}
