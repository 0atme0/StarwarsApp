//
//  StartWarsView.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

protocol ViewProtocol: View {
    var vm: ViewModelProtocol {get set}
}
