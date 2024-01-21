//
//  File.swift
//  
//
//  Created by Magistra Apta on 19/01/24.
//

import Foundation
import Combine
import RealmSwift

protocol LocaleDataSourceProtocol {
    func getGames() -> AnyPublisher<[GameModuleEntity], Error>
    func addGames(from games: [GameModuleEntity]) -> AnyPublisher<Bool, Error>
    func getFavoriteGames() -> AnyPublisher<[GameModuleEntity], Error>
    func updateFavorite(id: Int) -> AnyPublisher<GameModuleEntity, Error>
}

class LocaleDataSource: NSObject {
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = {
        realmDatabase in return LocaleDataSource(realm: realmDatabase)
    }
    
}


extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getGames() -> AnyPublisher<[GameModuleEntity], Error> {
        return Future<[GameModuleEntity], Error> { completion in
          if let realm = self.realm {
            let games: Results<GameModuleEntity> = {
              realm.objects(GameModuleEntity.self)
                .sorted(byKeyPath: "name", ascending: true)
            }()
              completion(.success(games.toArray(ofType: GameModuleEntity.self)))
          } else {
              completion(.failure(DatabaseError.invalidInstance))
          }
        }.eraseToAnyPublisher()
      }
    
    func addGames(from games: [GameModuleEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
          if let realm = self.realm {
            do {
              try realm.write {
                for game in games {
                  realm.add(game, update: .all)
                }
                completion(.success(true))
              }
            } catch {
              completion(.failure(DatabaseError.requestFailed))
            }
          } else {
              completion(.failure(DatabaseError.invalidInstance))
          }
        }.eraseToAnyPublisher()
    }
    
    func getFavoriteGames() -> AnyPublisher<[GameModuleEntity], Error> {
        return Future<[GameModuleEntity], Error> { completion in
            if let realm = self.realm {
                let gameEntities = {
                    realm.objects(GameModuleEntity.self)
                        .filter("favorite = \(true)")
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                completion(.success(gameEntities.toArray(ofType: GameModuleEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    func updateFavorite(id: Int) -> AnyPublisher<GameModuleEntity, Error> {
        return Future<GameModuleEntity, Error> { completion in
            if let realm = self.realm, let GameModuleEntity = {
                realm.objects(GameModuleEntity.self).filter("id = \(id)")
            }().first {
                do {
                    try realm.write {
                        GameModuleEntity.setValue(!GameModuleEntity.favorite, forKey: "favorite")
                    }
                    completion(.success(GameModuleEntity))
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    
}

extension Results {

  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }

}
