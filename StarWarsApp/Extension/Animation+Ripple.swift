//
//  Animation+Ripple.swift
//  StarWarsApp
//
//  Created by atme on 13/07/2022.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int, speed: Double = 2, fraction: CGFloat = 0.5) -> Animation {
        return Animation.spring(dampingFraction: fraction)
            .speed(speed)
            .delay(0.03 * Double(index))
    }
}
