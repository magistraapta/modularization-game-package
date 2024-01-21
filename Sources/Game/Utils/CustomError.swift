//
//  File.swift
//  
//
//  Created by Magistra Apta on 21/01/24.
//

import Foundation

enum UrlError: LocalizedError {
    case invalidResponse
    case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "the server don't respond to your request"
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable"
        }
    }
}


enum DatabaseError: LocalizedError {
    
    case invalidInstance
    case requestFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidInstance: return "Database can't instance"
        case .requestFailed: return "Your request failed"
        }
    }
}
