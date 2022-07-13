//
//  DetailScreenView+StarWarsText.swift
//  StarWarsApp
//
//  Created by atme on 13/07/2022.
//

import SwiftUI

extension DetailScreenView {
    var starwarsText: some View {
        ScrollView {
            Group {
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
            }
            .rotation3DEffect(.degrees(starwarsTextEnd ? 0 : 60), axis: (x: 1, y: 0, z: 0))
            .frame(width: 300, height: starwarsTextStart ? 400 : 0)
            .animation(Animation.linear(duration: starwarsTextEnd ? endAnimationDuration : startAnimationDuration))
            .onAppear {
                vm.playSound(sound: "starwars", type: "mp3")
                starwarsTextStart.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + self.startAnimationDuration) {
                    self.starwarsTextEnd.toggle()
                }
            }
        }
    }
}
