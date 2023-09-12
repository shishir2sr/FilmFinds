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
  @Published var pageNo = 1
 @Published var errorMessage: CustomError? = nil
  
// Get all movies from discover endpoint
  func discoverMovies() async {
      DispatchQueue.main.async {
          self.isLoading = true
      }
      
      let url = URL(string: "generate error")
//      let url = EndPoint.shared.discoverMovie(with: [.page(pageNo)])
      let result: Result<MovieSearchResultsModel, CustomError>? = await ApiClient.shared.fetchData(url: url)
      switch result {
      case .success(let result):
        if let movies = result.results {
          DispatchQueue.main.async {
            
            self.results.append(contentsOf: movies)
          }
        }
      case .failure(let error):
          DispatchQueue.main.async {
              self.errorMessage = error
          }
        
      case .none:
        debugPrint("")
      }
      DispatchQueue.main.async {
        self.isLoading = false
      }
            
    }
      
    // Get query results
      func searchMovie(query:String) async{
          
          DispatchQueue.main.sync {
              self.results = []
              self.isLoading = true
          }
          
          let url = EndPoint.shared.searchMovie(with: [.search(query), .page(pageNo)])
          
          let result: Result<MovieSearchResultsModel, CustomError>? = await ApiClient.shared.fetchData(url: url)
          
          switch result {
          case .success(let result):
            if let movies = result.results {
              DispatchQueue.main.async {
                self.results.append(contentsOf: movies)
              }
            }
          case .failure(let error):
              DispatchQueue.main.async {
                  self.errorMessage = error
              }
          case .none:
            debugPrint("")
          }
          DispatchQueue.main.async {
            self.isLoading = false
          }
      }
  }
