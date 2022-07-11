//
//  MainScreenView.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct MainScreenView<Model>: View where Model: MainScreenViewModelProtocol {
    
    @ObservedObject var vm: Model
    
    var body: some View {
        ZStack {
            Color
                .black
                .opacity(0.9)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("The StarWars Episods")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                ScrollView {
                    ForEach((vm as! MainScreenViewModel).movies, id: \.self) { item in
                        VStack {
                            HStack {
                                Text(item.title)
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.body)
                                Spacer()
                                Text("\(item.episodeID)")
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                                    .font(.caption)
                            }
                            HStack {
                                Spacer()
                                Text(item.releaseDate)
                                    .padding(5)
                                    .background(Color.green)
                                    .cornerRadius(5)
                                    .opacity(0.8)
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    }
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
