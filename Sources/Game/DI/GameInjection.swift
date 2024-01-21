//
//  File.swift
//  
//
//  Created by Magistra Apta on 21/01/24.
//

import Foundation
import RealmSwift

public final class GameInjection: NSObject {
    private func provideRepository() -> GetGamesRepositoryProtocol {
        let realm = try? Realm()

        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: GetGameRemoteDataSource = GetGameRemoteDataSource.sharedInstance

        return GetGamesRepository.sharedInstance(locale, remote)
    }

    public func provideHome() -> HomeUseCase {
        let repo = provideRepository()
        return HomeInteractor(repository: repo)
    }

    public func provideDetail(game: GameModuleDomain) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, game: game)
    }


    public func provideFavorite() -> FavoriteUseCase {
        let repo = provideRepository()
        return FavoriteInteractor(repository: repo)
    }

}
