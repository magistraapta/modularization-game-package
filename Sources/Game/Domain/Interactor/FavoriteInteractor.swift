//
//  File.swift
//  
//
//  Created by Magistra Apta on 21/01/24.
//

import Foundation
import Combine

public protocol FavoriteUseCase {
    func getFavoriteGames() -> AnyPublisher<[GameModuleDomain], Error>
}

public class FavoriteInteractor: FavoriteUseCase {
    private let repository: GetGamesRepositoryProtocol
    
    required init(repository: GetGamesRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getFavoriteGames() -> AnyPublisher<[GameModuleDomain], Error> {
        return repository.getFavorite()
    }
}
