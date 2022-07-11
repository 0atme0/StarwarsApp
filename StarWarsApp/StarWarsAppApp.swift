//
//  StarWarsAppApp.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

@main
struct StarWarsAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreenView(vm: MainScreenViewModel())
        }
    }
}
