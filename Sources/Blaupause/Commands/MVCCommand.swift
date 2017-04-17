//
//  MVCCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

final class MVCCommand: AbstractTemplateCommand {
    
    override var template: BuildInTemplates! {
        return .MVC
    }
}
