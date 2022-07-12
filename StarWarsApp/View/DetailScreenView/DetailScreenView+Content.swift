//
//  DetailScreenView+Content.swift
//  StarWarsApp
//
//  Created by atme on 12/07/2022.
//

import SwiftUI

extension DetailScreenView {
    var content: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(vm.movie?.title ?? "")
                    .foregroundColor(.white)
                    .bold()
                    .font(.body)
                    .matchedGeometryEffect(id: vm.movie?.title, in: namespace, properties: .frame)
                Spacer()
                Text("\(vm.movie?.episodeID ?? 1)")
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .font(.caption)
            }
            HStack {
                Spacer()
                Text(vm.movie?.releaseDate ?? "")
                    .padding(5)
                    .background(Color.green)
                    .cornerRadius(5)
                    .opacity(0.8)
                    .foregroundColor(.white)
                    .font(.caption)
            }
            Divider()
            Text("Director: \(vm.movie?.director ?? "")")
                .foregroundColor(.white)
                .opacity(0.8)
                .font(.caption)
            Text("Producer: \(vm.movie?.producer ?? "")")
                .foregroundColor(.white)
                .opacity(0.8)
                .font(.caption)
            Divider()
            Text("\(vm.movie?.openingCrawl ?? "")")
                .foregroundColor(.white)
                .opacity(0.8)
                .font(.caption)
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
    }
}
