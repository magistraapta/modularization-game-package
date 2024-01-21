//
//  File.swift
//  
//
//  Created by Magistra Apta on 19/01/24.
//

import Foundation
import Combine
import Core

public protocol GetGamesRepositoryProtocol {
    func getGames() -> AnyPublisher<[GameModuleDomain], Error>
    func getFavorite() -> AnyPublisher<[GameModuleDomain], Error>
    func updateFavoriteGame(by id: Int) -> AnyPublisher<GameModuleDomain, Error>
}

public class GetGamesRepository: NSObject {
    
    typealias GameInstance = (LocaleDataSource, GetGameRemoteDataSource) -> GetGamesRepository
    
    fileprivate let remote: GetGameRemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(remote: GetGameRemoteDataSource, locale: LocaleDataSource) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: GameInstance = { localeRepo, remoteRepo in
        return GetGamesRepository(remote: remoteRepo, locale: localeRepo)
    }
    
}

extension GetGamesRepository: GetGamesRepositoryProtocol {
    
    public func getGames() -> AnyPublisher<[GameModuleDomain], Error> {
      return self.locale.getGames()
        .flatMap { result -> AnyPublisher<[GameModuleDomain], Error> in
          if result.isEmpty {
            return self.remote.getGames()
                  .map { GamesMapper.mapGameResponsesToEntities(input: $0) }
              .flatMap { self.locale.addGames(from: $0) }
              .filter { $0 }
              .flatMap { _ in self.locale.getGames()
                .map { GamesMapper.mapGameEntitiesToDomains(input: $0) }
              }
              .eraseToAnyPublisher()
          } else {
            return self.locale.getGames()
              .map { GamesMapper.mapGameEntitiesToDomains(input: $0) }
              .eraseToAnyPublisher()
          }
        }.eraseToAnyPublisher()
    }
    
    public func getFavorite() -> AnyPublisher<[GameModuleDomain], Error> {
        return self.locale.getFavoriteGames()
            .map { GamesMapper.mapGameEntitiesToDomains(input: $0)}
            .eraseToAnyPublisher()
    }

    public func updateFavoriteGame(by id: Int) -> AnyPublisher<GameModuleDomain, Error> {
        return self.locale.updateFavorite(id: id)
            .map { GamesMapper.mapEntityToDomain(input: $0) }
            .eraseToAnyPublisher()
    }
    
}
