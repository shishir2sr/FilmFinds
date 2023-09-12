//
//  CustomError.swift
//  FilmFinds
//
//  Created by YeasirArefinTusher-11702 on 12/9/23.
//

import Foundation
enum CustomError: Error, Identifiable {
    case invalidURL
    case invalidData
    case unableToComplete
    case invalidResponse
    
    var id: String {
           return self.localizedDescription
       }
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "An error occurred while trying to load the data. Please try again later."
        case .invalidData: return "The data retrieved from the server is invalid. Please try again later."
        case .unableToComplete: return "Unable to complete your request at this time. Please check your internet connection and try again."
        case .invalidResponse: return "The server is currently unavailable. Please try again later"
        }
    }
}
