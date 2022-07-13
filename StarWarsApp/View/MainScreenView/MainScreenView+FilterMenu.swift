//
//  MainScreenView+FilterMenu.swift
//  StarWarsApp
//
//  Created by atme on 12/07/2022.
//

import SwiftUI

extension MainScreenView {
    var filterMenu: some View {
        DisclosureGroup(vm.selectedFilter?.rawValue ?? "Select filter", isExpanded: $filterExpanded) {
            ForEach(vm.filterList) { filter in
                Text(filter.rawValue)
                    .onTapGesture {
                        filterExpanded.toggle()
                        vm.selectFilter(filter)
                    }
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}
