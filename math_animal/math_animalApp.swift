//
//  math_animalApp.swift
//  math_animal
//
//  Created by tientran on 17/01/2021.
//

import SwiftUI

@main
struct math_animalApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(PlayViewModel())
        }
    }
}
