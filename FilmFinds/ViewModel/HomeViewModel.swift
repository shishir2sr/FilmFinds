//
//  HomeViewModel.swift
//  FilmFinds
//
//  Created by YeasirArefinTusher-11702 on 12/9/23.
//

import Foundation


class HomeViewModel: ObservableObject {
  @Published var results: [Movie] = []
  @Published var isLoading = false
  @Published var page = 1
  
  func getResults() async {
    isLoading = true
    let url = EndPoint.shared.discoverMovie(with: [.page(page)])
    var result: Result<MovieSearchResultsModel, CustomError>? = await ApiClient.shared.fetchData(url: url)
    switch result {
    case .success(let result):
      if let movies = result.results {
        results.append(contentsOf: movies)
      }
    case .failure(let error):
      print(error.localizedDescription)
    case .none:
      debugPrint("")
    }
    isLoading = false
    page += 1
  }
}
