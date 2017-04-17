//
//  ViperCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

final class ViperCommand: AbstractTemplateCommand {
    
    override var verb: String {
        return "viper"
    }
    
    override var function: String {
        return "Creates the default template for a VIPER Module"
    }
    
    override var template: BuildInTemplates! {
        return .Viper
    }
}
