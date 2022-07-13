//
//  MainScreenView.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct MainScreenView<Model>: View where Model: MainScreenViewModelProtocol {
    
    @ObservedObject var vm: Model
    @Namespace var namespace
    @State internal var filterExpanded = false
    
    var body: some View {
        ZStack {
            background
            VStack(alignment: .center) {
                header
                if let _ = vm.selectedMovie {
                    DetailScreenView(vm: DetailScreenViewModel($vm.selectedMovie), namespace: namespace)
                } else {
                    if let selectedFilter = vm.selectedFilter {
                        searchBar
                    }
                    filterMenu
                    list
                }
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(vm: MainScreenViewModel(movieManager: MovieManager(networkManager: NetworkManager())))
    }
}
