//
//  File.swift
//  
//
//  Created by Magistra Apta on 21/01/24.
//

import Foundation
import Combine

//class DetailPresenter: ObservableObject {
//    
//    private var cancellables: Set<AnyCancellable> = []
//    private var detailUseCase: DetailUseCase
//    
//    @Published var game: GameModuleDomain
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String = ""
//    
//    
//    init(detailUseCase: DetailUseCase) {
//        self.detailUseCase = detailUseCase
//        game = detailUseCase.getGame()
//    }
//    
//    func updateFavoriteGame() {
//        detailUseCase.updateFavorite()
//            .receive(on: RunLoop.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    self.isLoading = false
//                case .failure:
//                    self.errorMessage = String(describing: completion)
//                }
//            }, receiveValue: { game in
//                self.game = game
//            })
//            .store(in: &cancellables)
//    }
//    
//    
//    
//    
//}
