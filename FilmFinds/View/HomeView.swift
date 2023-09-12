//
//  ContentView.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import SwiftUI
struct HomeView: View {
    @State private var searchText = ""
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8151446581, green: 0.2807564139, blue: 0.3018198311, alpha: 1)),Color(#colorLiteral(red: 0.2078385055, green: 0.2078467906, blue: 0.3428357244, alpha: 1)),Color(#colorLiteral(red: 0.2078385055, green: 0.2078467906, blue: 0.3428357244, alpha: 1)),]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    Image("Logo")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    Text("Film Finds")
                        .font(.system(size: 28, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(.leading, 10)
                        .padding(.trailing, 5)
                        .frame(height: 40)
                    
                    Button(action: {
                        searchBarButtonClicked()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                    }
                }
                .background(Color(#colorLiteral(red: 0.9, green: 1, blue: 0.9, alpha: 0.75)))
                .cornerRadius(10)
                .padding()
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding()
                } else {
                    List(viewModel.results, id: \.id) { movie in
                        MovieItemView(movieTitle: movie.title ?? "No data found", movieDescription: movie.overview ?? "Empty", imagePath: movie.poster_path)
                            .listRowBackground(Color(.clear))
                    }
                    .listStyle(.plain)
                }
                
                Spacer()
            }
            
        }
        .task {
            await viewModel.discoverMovies()
        }
    }

    func searchBarButtonClicked() {
        if searchText.isEmpty {
            // If search text is empty, reset to the original list
            viewModel.results = []
            viewModel.pageNo = 1
            Task {
                await viewModel.discoverMovies()
            }
        } else {
            // Search the movie list based on the search text
            viewModel.results = []
            viewModel.pageNo = 1
            Task {
                await viewModel.searchMovie(query: searchText)
            }
        }
    }
}


