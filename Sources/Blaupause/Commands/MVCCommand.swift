//
//  MVCCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation
import Commandant
import Result

struct MVCCommand: CommandProtocol {
    
    struct Options: OptionsProtocol {
        let moduleName: String
        
        static func create(_ moduleName: String) -> Options {
            return Options(moduleName: moduleName)
        }
        
        static func evaluate(_ m: CommandMode) -> Result<Options, CommandantError<CommandantError<()>>> {
            return create
                <*> m <| Argument(usage: "Name of the new MVC Module")
        }
    }
    
    var verb: String = "MVC"
    var function: String = "Creates the default template for a MVC Module"
    
    func run(_ options: MVCCommand.Options) -> Result<(), CommandantError<()>> {
        
        let template = BuildInTemplates.MVC.template()
        let placeHolderProvider = PlaceHolderProvider(placeHolderName: options.moduleName)
        let generator = TemplateGenerator(with: template, and: placeHolderProvider)
        generator.generate()
        
        return .success()
    }
}
