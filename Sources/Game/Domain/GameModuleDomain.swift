//
//  File.swift
//  
//
//  Created by Magistra Apta on 19/01/24.
//

import Foundation

public struct GameModuleDomain: Equatable, Identifiable {
    public let id: Int
    public let slug, name, released: String
    public let backgroundImage: String
    public let rating: Double
    public var favorite: Bool = false
}
