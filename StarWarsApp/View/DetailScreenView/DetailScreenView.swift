//
//  DetailScreenView.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct DetailScreenView<Model>: View where Model: DetailScreenViewModelProtocol {
    
    @ObservedObject var vm: Model
    var namespace: Namespace.ID
    @State var starwarsTextStart = false
    @State var starwarsTextEnd = false
    internal let startAnimationDuration = 11.0
    internal let endAnimationDuration = 1.5

    var body: some View {
        ZStack {
            background
                .matchedGeometryEffect(id: vm.movie?.id ?? UUID(), in: namespace, properties: .frame)
            VStack {
                content
                    .background(Color.white.opacity(0.1))
                    .onTapGesture {
                        vm.close()
                    }
            }
        }
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        DetailScreenView(vm: DetailScreenViewModel(.constant(Movie(title: "Test", episodeID: 1, openingCrawl: "TestTest", director: "TestTest", producer: "TestTest", releaseDate: "2020-20-20", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "Test", edited: "Test", url: "Test"))), namespace: namespace)
    }
}
