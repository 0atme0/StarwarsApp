//
//  DetailScreenView.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct DetailScreenView<Model>: View where Model: DetailScreenViewModelProtocol {
    @ObservedObject var vm: Model
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(vm: DetailScreenViewModel())
    }
}
