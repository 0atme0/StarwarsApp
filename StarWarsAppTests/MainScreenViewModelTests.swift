//
//  MainScreenViewModelTests.swift
//  StarWarsAppTests
//
//  Created by atme on 13/07/2022.
//

import XCTest
import SwiftUI

class MainScreenViewModelTests: XCTestCase {

    var vm: MainScreenViewModel!
    var movieManager: MockMovieManager!
    let movie1 = Movie(title: "Test1", episodeID: 1, openingCrawl: "TestTest", director: "TestTest", producer: "TestTest", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "Test", edited: "Test", url: "Test")
    let movie2 = Movie(title: "Test2", episodeID: 1, openingCrawl: "TestTest", director: "TestTest", producer: "TestTest", releaseDate: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "Test", edited: "Test", url: "Test")

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movieManager = MockMovieManager(mockMovieList: [movie1, movie2])
        vm = MainScreenViewModel(movieManager: movieManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelectFilter() throws {
        let type = FilterType.director
        vm.selectFilter(type)
        XCTAssertEqual(vm.selectedFilter, type)
    }

    func testSelectMovie() throws {
        vm.selectMovie(movie1)
        XCTAssertEqual(vm.selectedMovie, movie1)
    }
    
    func testSearchingWithEmptyValue() throws {
        vm.searchText = ""
        vm.selectFilter(.director)
        let movieListValue = [movie1, movie2]
        waitUntil(vm.$filteredMovies, equals: movieListValue)
    }
    func testSearchingWithWrongSearchType() throws {
        vm.searchText = "Test1"
        let movieListValue = [movie1, movie2]
        waitUntil(vm.$filteredMovies, equals: movieListValue)
    }
}
