//
//  File.swift
//  
//
//  Created by Magistra Apta on 20/01/24.
//

import Foundation
import Combine
import Core
import SwiftUI

//
//class HomePresenter: ObservableObject {
//    
//    private var cancellables: Set<AnyCancellable> = []
//    private let homeUseCase: HomeUseCase
//    private var router = HomeRouter()
//    
//    @Published var games: [GameModuleDomain] = []
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String = ""
//    
//    init(homeUseCase: HomeUseCase){
//        self.homeUseCase = homeUseCase
//    }
//    
//    func getGames() {
//        isLoading = true
//        homeUseCase.getGames()
//        .receive(on: RunLoop.main)
//        .sink(receiveCompletion: { completion in
//          switch completion {
//          case .failure:
//            self.errorMessage = String(describing: completion)
//          case .finished:
//            self.isLoading = false
//          }
//        }, receiveValue: { games in
//          self.games = games
//        })
//        .store(in: &cancellables)
//    }
//    
//    func linkBuilder<Content: View>(for game: GameModuleDomain, @ViewBuilder content: () -> Content) -> some View {
//        NavigationLink(destination: router.makeDetailView(for: game)) {
//            content()
//        }
//    }
//}

//public class GamePresenter<
//    GameUseCase: UseCase,
//    FavoriteUseCase: UseCase
//>: ObservableObject where
//GameUseCase.Request == Any,
//GameUseCase.Response == GameModuleDomain,
//FavoriteUseCase.Request == Any,
//FavoriteUseCase.Response == GameModuleDomain
//{
//
//    private var cancellables: Set<AnyCancellable> = []
//
//    private let gameUseCase: GameUseCase
//    private let favoriteUseCase: FavoriteUseCase
//
//    @Published var game: GameModuleDomain?
//    @Published var isLoading: Bool = false
//    @Published var isError: Bool = false
//    @Published var errorMessage: String = ""
//
//    public init(gameUseCase: GameUseCase, favoriteUseCase: FavoriteUseCase) {
//        self.gameUseCase = gameUseCase
//        self.favoriteUseCase = favoriteUseCase
//    }
//
//    public func getGame(request: GameUseCase.Request) {
//        isLoading = true
//        self.gameUseCase.execute(request: request)
//            .receive(on: RunLoop.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    self.isLoading = false
//                case .failure(let error):
//                    self.isLoading = false
//                    self.isError = true
//                    self.errorMessage = error.localizedDescription
//                }
//            }, receiveValue: { item in
//                self.game = item
//            })
//            .store(in: &cancellables)
//    }
//
//    public func updateFavorite(request: FavoriteUseCase.Request) {
//        self.favoriteUseCase.execute(request: request)
//            .receive(on: RunLoop.main )
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    self.isLoading = false
//                    self.isError = true
//                    self.errorMessage = error.localizedDescription
//                case .finished:
//                    self.isLoading = false
//                }
//            }, receiveValue: { game in
//                self.game = game
//            })
//            .store(in: &cancellables)
//    }
//}
