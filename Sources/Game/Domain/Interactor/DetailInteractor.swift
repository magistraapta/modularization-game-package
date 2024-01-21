//
//  File.swift
//  
//
//  Created by Magistra Apta on 21/01/24.
//

import Foundation
import Combine

public protocol DetailUseCase {
    func getGame() -> GameModuleDomain
    func updateFavorite() -> AnyPublisher<GameModuleDomain, Error>
}

public class DetailInteractor: DetailUseCase {
    private let repository: GetGamesRepositoryProtocol
    private let game: GameModuleDomain
    
    required init (repository: GetGamesRepositoryProtocol, game: GameModuleDomain) {
        self.repository = repository
        self.game = game
    }
    
    public func getGame() -> GameModuleDomain {
        return game
    }
    
    public func updateFavorite() -> AnyPublisher<GameModuleDomain, Error> {
        return repository.updateFavoriteGame(by: game.id)
    }

    
}
