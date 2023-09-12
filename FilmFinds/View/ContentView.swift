//
//  ContentView.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import SwiftUI
struct ContentView: View {
    @State private var searchText = ""
    @State private var isScrolledUp = false
    @State var movieList: [DummyMovie] = [dummyMovie, dummyMovie, dummyMovie2, dummyMovie2, dummyMovie2]
    @State var originalMovieList: [DummyMovie] = [dummyMovie, dummyMovie, dummyMovie2, dummyMovie2, dummyMovie2] // Store the original movie list
    
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
                
                List(filteredMovieList, id: \.self) { movie in
                    MovieItemView(movieTitle: movie.name, movieDescription: movie.description, imagePath: movie.imagePath)
                        .listRowBackground(Color(.clear))
                }
                .listStyle(.plain)
                Spacer()
            }
            
        }
    }

    func searchBarButtonClicked() {
        if searchText.isEmpty {
            // If search text is empty, reset to the original list
            movieList = originalMovieList
        } else {
            // Filter the movie list based on the search text
            movieList = originalMovieList.filter { movie in
                movie.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    // Computed property to return the filtered movie list
    var filteredMovieList: [DummyMovie] {
        if searchText.isEmpty {
            return movieList // If search text is empty, return the original list
        } else {
            return movieList.filter { movie in
                movie.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

