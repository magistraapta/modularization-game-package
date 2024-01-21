//
//  File.swift
//  
//
//  Created by Magistra Apta on 20/01/24.
//

import Foundation
import Core

public struct GamesMapper {
    
    static func mapGameResponsesToEntities(
      input gameResponses: [GameModuleEntryResponse]
    ) -> [GameModuleEntity] {
      return gameResponses.map { result in
        let newGame = GameModuleEntity()
          newGame.id = result.id
          newGame.name = result.name
          newGame.slug = result.slug
          newGame.backgroundImage = result.backgroundImage
          newGame.released = result.released
          newGame.rating = result.rating
        return newGame
      }
    }

    static func mapGameEntitiesToDomains(
      input gameEntities: [GameModuleEntity]
    ) -> [GameModuleDomain] {
      return gameEntities.map { result in
          return GameModuleDomain(id: result.id, slug: result.slug, name: result.name, released: result.released, backgroundImage: result.backgroundImage, rating: result.rating, favorite: result.favorite)
      }
    }

    static func mapGameResponsesToDomains(
      input categoryResponses: [GameModuleEntryResponse]
    ) -> [GameModuleDomain] {

      return categoryResponses.map { result in
          return GameModuleDomain(id: result.id, slug: result.slug, name: result.name, released: result.released, backgroundImage: result.backgroundImage, rating: result.rating)
          
      }
    }
    
    static func mapEntityToDomain(input gameEntity: GameModuleEntity) -> GameModuleDomain {
        return GameModuleDomain(id: gameEntity.id, slug: gameEntity.slug, name: gameEntity.name, released: gameEntity.released, backgroundImage: gameEntity.backgroundImage, rating: gameEntity.rating, favorite: gameEntity.favorite)
    }
}

//public struct GamesMapper<GameMapper: Mapper
//>: Mapper where GameMapper.Request == Any, GameMapper.Response == GameModuleEntryResponse, GameMapper.Domain == GameModuleDomain, GameMapper.Entity == GameModuleEntity
//{
//
//    public typealias Request = Any
//    public typealias Response = [GameModuleEntryResponse]
//    public typealias Entity = [GameModuleEntity]
//    public typealias Domain = [GameModuleDomain]
//
//    private let gameMapper: GameMapper
//
//    public init(gameMapper: GameMapper) {
//        self.gameMapper = gameMapper
//    }
//
//    public func transformEntityToDomain(entity: [GameModuleEntity]) -> [GameModuleDomain] {
//        return entity.map { result in
//            self.gameMapper.transformEntityToDomain(entity: result)
//        }
//    }
//
//    public func transformResponseToEntity(request: Any?, response: [GameModuleEntryResponse]) -> [GameModuleEntity] {
//        return response.map { result in
//            self.gameMapper.transformResponseToEntity(request: request, response: result)
//        }
//    }
//}
