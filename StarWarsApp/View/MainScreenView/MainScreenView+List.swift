//
//  MainScreenView+List.swift
//  StarWarsApp
//
//  Created by atme on 12/07/2022.
//

import SwiftUI

extension MainScreenView {
    var list: some View {
        ScrollView {
            ForEach((vm as! MainScreenViewModel).movies, id: \.self) { movie in
                MainScreenCellView(namespace: namespace, movie: movie)
                    .onTapGesture {
                        withAnimation {
                        vm.selectedMovie = movie
                        }
                    }
//                    .sheet(isPresented: $showingDetails) {
//                        DetailScreenView(vm: DetailScreenViewModel(movie), namespace: namespace)
//                    }
            }
        }
    }
}
