//
//  ViperCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation
import Commandant
import Result

class AbstractTemplateCommand: CommandProtocol {
    
    struct Options: OptionsProtocol {
        let moduleName: String
        
        static func create(_ moduleName: String) -> Options {
            return Options(moduleName: moduleName)
        }
        
        static func evaluate(_ m: CommandMode) -> Result<Options, CommandantError<CommandantError<()>>> {
            return create
            <*> m <| Argument(usage: "Name of the new Viper Module")
        }
    }
    
    var verb: String {
        fatalError("Must be overwritten in subclass")
    }
    var function: String {
        fatalError("Must be overwritten in subclass")
    }
    var template: BuildInTemplates! {
        fatalError("Must be overwritten in subclass")
    }
    
    func run(_ options: Options) -> Result<(), CommandantError<()>> {
        
        let template = self.template.template()
        let placeHolderProvider = PlaceHolderProvider(placeHolderName: options.moduleName)
        let generator = TemplateGenerator(with: template, and: placeHolderProvider)
        
        do {
            try generator.generate()
            return .success()
        } catch {
            print(error)
            exit(2)
        }
    }
}
