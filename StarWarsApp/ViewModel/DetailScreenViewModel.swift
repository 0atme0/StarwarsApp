//
//  DetailScreenViewModel.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation
import SwiftUI
import AVFoundation

class DetailScreenViewModel: DetailScreenViewModelProtocol {
    
    @Binding var movie: Movie?
    var audioPlayer: AVAudioPlayer?

    init(_ movie: Binding<Movie?>) {
        self._movie = movie
    }
    
    public func close() {
        withAnimation(.ripple(index: 0)) {
            self.movie = nil
        }
    }
    public func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }
}
