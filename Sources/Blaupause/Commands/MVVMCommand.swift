//
//  MVVMCommand.swift
//  Blaupause
//
//  Created by Marius Landwehr on 17.04.17.
//
//

import Foundation

final class MVVMCommand: AbstractTemplateCommand {

    override var verb: String {
        return "mvvm"
    }

    override var function: String {
        return "Creates the default template for a MVVM Module"
    }

    override var template: BuildInTemplates! {
        return .MVVM
    }
}
