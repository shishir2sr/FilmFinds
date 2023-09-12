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
    
    var imageFullPath: String{
        if let imagePath = imagePath{
            return NetworkConstants.shared.posterImageBaseUrl + imagePath
        }else
        {
            return ""
        }
    }
    
    var body: some View {
      HStack {
        AsyncImage(url: URL(string: imageFullPath)) { image in
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
                    .padding(.trailing, 10)
                    .cornerRadius(10)
            }
        }
        .background(Color(#colorLiteral(red: 0.9, green: 1, blue: 0.9, alpha: 0.4)))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
