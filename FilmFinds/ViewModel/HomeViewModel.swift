//
//  HomeViewModel.swift
//  FilmFinds
//
//  Created by YeasirArefinTusher-11702 on 12/9/23.
//

import Foundation
class HomeViewModel: ObservableObject{
    @Published var results: Result<MovieSearchResultsModel, CustomError>? = nil
    func getResults() async{
        let url = EndPoint.shared.searchMovie(with: [.search("")])
        var result: Result<MovieSearchResultsModel, CustomError>? = await ApiClient.shared.fetchData(url: url)
        switch result{
        case .success(let result):
            print(result.results?[0].release_date as Any)
        case .failure(let error):
            print(error.localizedDescription)
        case .none:
            debugPrint("")
        }
    }
    
}
