//
//  File.swift
//  
//
//  Created by Magistra Apta on 20/01/24.
//

//import Foundation
//import Core
//
//public struct GamesFavoriteMapper: Mapper {
//
//    public typealias Request = Any
//    public typealias Response = GameModuleEntryResponse
//    public typealias Entity = GameModuleEntity
//    public typealias Domain = GameModuleDomain
//
//    public init() {}
//
//    public func transformEntityToDomain(entity: GameModuleEntity) -> GameModuleDomain {
//        return GameModuleDomain(id: entity.id, slug: entity.slug, name: entity.name, released: entity.released, backgroundImage: entity.backgroundImage, rating: entity.rating)
//    }
//
//    public func transformResponseToEntity(request: Request?, response: GameModuleEntryResponse) -> GameModuleEntity {
//        let gameEntity = GameModuleEntity()
//        gameEntity.id = response.id
//        gameEntity.backgroundImage = response.backgroundImage
//        gameEntity.name = response.name
//        gameEntity.rating = response.rating
//        gameEntity.slug = response.slug
//        gameEntity.released = response.released
//        return gameEntity
//    }
//}
