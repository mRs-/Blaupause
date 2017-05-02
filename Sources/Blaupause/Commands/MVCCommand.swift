//
//  MVCCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

final class MVCCommand: AbstractTemplateCommand {

    override var verb: String {
        return "mvc"
    }

    override var function: String {
        return "Creates the default template for a MVC Module"
    }

    override var template: BuildInTemplates! {
        return .MVC
    }
}
