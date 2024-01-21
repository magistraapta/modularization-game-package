//
//  File.swift
//  
//
//  Created by Magistra Apta on 21/01/24.
//

import Foundation
import Combine

public protocol HomeUseCase {
    func getGames() -> AnyPublisher<[GameModuleDomain], Error>
}

public class HomeInteractor: HomeUseCase {
    private let repository: GetGamesRepositoryProtocol
    
    required init(repository: GetGamesRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getGames() -> AnyPublisher<[GameModuleDomain], Error> {
        return repository.getGames()
    }
}
