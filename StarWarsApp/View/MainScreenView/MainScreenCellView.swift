//
//  MainScreenCellView.swift
//  StarWarsApp
//
//  Created by atme on 12/07/2022.
//

import SwiftUI

struct MainScreenCellView: View {
    
    public var namespace: Namespace.ID
    @State var movie: Movie
    
    var body: some View {
        VStack {
            HStack {
                Text(movie.title)
                    .foregroundColor(.white)
                    .bold()
                    .font(.body)
                    .matchedGeometryEffect(id: movie.title, in: namespace)
                Spacer()
                Text("\(movie.episodeID)")
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .font(.caption)
            }
            HStack {
                Spacer()
                Text(movie.releaseDate)
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
        .matchedGeometryEffect(id: movie.id, in: namespace, properties: .frame)
    }
}

struct MainScreenCellView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        MainScreenCellView(namespace: namespace, movie: Movie(title: "Test", episodeID: 1, openingCrawl: "TestTest", director: "TestTest", producer: "TestTest", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "Test", edited: "Test", url: "Test"))
    }
}
