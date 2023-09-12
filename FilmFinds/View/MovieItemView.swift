//
//  MovieView.swift
//  FilmFinds
//
//  Created by YeasirArefinTusher-11702 on 12/9/23.
//

import Foundation
import SwiftUI

struct MovieItemView: View {
    var movieTitle: String = "Loreaum ipsum"
    var movieDescription: String = "No Data"
    var imagePath: String?
    
    var body: some View {
      HStack {
        AsyncImage(url: URL(string: imagePath ?? "")) { image in
              image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 120)
                .cornerRadius(5)
                .clipped()
                .padding()
            } placeholder: {
              Image("EmptyImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 120)
                    .cornerRadius(5)
                    .clipped()
                    .padding()
            }
            
          VStack(spacing:0) {
                Text(movieTitle)
                    .font(.headline)
                    .foregroundColor(.black)
                    .lineLimit(1) // Limit title text to one line
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 0)
                Text(movieDescription)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .frame(maxHeight: 70) // Set the fixed height
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 0)
                    .cornerRadius(10)
                
            }
        }
        .background(Color(#colorLiteral(red: 0.9, green: 1, blue: 0.9, alpha: 0.4)))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}




//let movieList = ["SpiderMan", "SpiderMan", "SpiderMan","SpiderMan", "SpiderMan"]

struct DummyMovie: Hashable{
    let name: String
    let description: String
    let imagePath: String
}

let dummyMovie = DummyMovie(name: "SpiderMan", description: "Peter Parker is dissatisfied with life when he loses his job, the love of his life and his powers. Amid all the chaos, he must fight Doctor Octavius, who threatens to destroy New York City.", imagePath: "spidermanPoster")

let dummyMovie2 = DummyMovie(name: "Batman", description: "Peter Parker is dissatisfied with life when he loses his job, the love of his life and his powers. Amid all the chaos, he must fight Doctor Octavius, who threatens to destroy New York City.", imagePath: "batmanMovie")

var movieList: [DummyMovie] = [dummyMovie, dummyMovie, dummyMovie2, dummyMovie2, dummyMovie2]
