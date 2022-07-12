//
//  FilterType.swift
//  StarWarsApp
//
//  Created by atme on 12/07/2022.
//

import Foundation

enum FilterType: String {
    case director = "Director",
         opening_crawl = "Opening Crawl",
         producers = "Producers",
         title = "Title"
}
extension FilterType: Identifiable {
    var id: RawValue { rawValue }
}
