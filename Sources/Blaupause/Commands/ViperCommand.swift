//
//  ViperCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

final class ViperCommand: AbstractTemplateCommand {
    
    override var template: BuildInTemplates! {
        return .Viper
    }
}
