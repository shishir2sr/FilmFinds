//
//  ContentView.swift
//  FilmFinds
//
//  Created by Yeasir Arefin Tusher on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onAppear{
                    Task {
                        await viewModel.getResults()
                        
                    }
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
