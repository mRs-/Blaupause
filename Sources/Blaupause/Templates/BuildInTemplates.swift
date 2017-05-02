//
//  ViperTemplate.swift
//  Blaupause
//
//  Created by Marius Landwehr on 16.04.17.
//  Copyright © 2017 Marius Landwehr. All rights reserved.
//

import Foundation

enum BuildInTemplates {
    case Viper
    case MVC
    case MVVM

    func template() -> [TemplateGenerateable] {
        switch self {
        case .MVC:
            return [
                Folder(name: "*", children: [
                    Folder(name: "Model", children: [
                        File(name: "*Model.swift")
                        ]),
                    Folder(name: "View", children: [
                        File(name: "*View.swift")
                        ]),
                    Folder(name: "Controller", children: [
                        File(name: "*ViewController.swift")
                        ])
                    ]
                )
            ]
        case .MVVM:
            return [
                Folder(name: "*", children: [
                    Folder(name: "Model", children: [
                        File(name: "*Model.swift")
                        ]),
                    Folder(name: "View", children: [
                        File(name: "*View.swift")
                        ]),
                    Folder(name: "ViewModel", children: [
                        File(name: "*ViewModel.swift")
                        ]),
                    Folder(name: "Controller", children: [
                        File(name: "*ViewController.swift")
                        ])
                    ]
                )
            ]
        case .Viper:
            return [
                Folder(name: "*", children: [
                    Folder(name: "Application Logic", children: [
                        Folder(name: "Interactor", children: [
                            File(name: "*Interactor.swift"),
                            File(name: "*InteractorIO.swift")
                            ]),
                        Folder(name: "Manager", children: [
                            File(name: "*DataManager.swift")
                            ])
                        ]),
                    Folder(name: "Module Interface", children: [
                        File(name: "*ModuleInterface.swift")
                        ]),
                    Folder(name: "User Interface", children: [
                        Folder(name: "Presenter", children: [
                            File(name: "*Presenter.swift")
                            ]),
                        Folder(name: "View", children: [
                            File(name: "*ViewController.swift"),
                            File(name: "*ViewInterface.swift")
                            ]),
                        Folder(name: "Wireframe", children: [
                            File(name: "*Wireframe.swift")
                            ])
                        ])
                    ]
                )
            ]
        }
    }
}
