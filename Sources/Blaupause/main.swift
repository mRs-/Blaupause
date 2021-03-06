//
//  main.swift
//  Blaupause
//
//  Created by Marius Landwehr on 09.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation
import Commandant
import Dispatch

DispatchQueue.global().async {

    let registry = CommandRegistry<CommandantError<()>>()

    registry.register(ViperCommand())
    registry.register(MVCCommand())
    registry.register(MVVMCommand())
    registry.register(TemplateCommand())
    registry.register(HelpCommand(registry: registry))

    registry.main(defaultVerb: TemplateCommand().verb) { error in
        print(error.description)
    }
}

dispatchMain()
