//
//  File.swift
//  
//
//  Created by Magistra Apta on 19/01/24.
//

import Foundation
import Alamofire
import Core
import Combine

protocol GetGameRemoteDataSourceProtocol {
    func getGames() -> AnyPublisher<[GameModuleEntryResponse], Error>
}

class GetGameRemoteDataSource: NSObject {
    private override init() { }
    
    static let sharedInstance: GetGameRemoteDataSource = GetGameRemoteDataSource()
}

extension GetGameRemoteDataSource: GetGameRemoteDataSourceProtocol {
    
    func getGames() -> AnyPublisher<[GameModuleEntryResponse], Error> {
        return Future<[GameModuleEntryResponse], Error> { completion in
            if let url = URL(string: "https://api.rawg.io/api/games?token&key=f26f41e3c0074fa68c798b02bae584a0&page=1") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GameModuleResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError(.badServerResponse)))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
}

