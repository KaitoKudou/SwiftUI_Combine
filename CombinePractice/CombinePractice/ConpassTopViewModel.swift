//
//  ConpassTopViewModel.swift
//  CombinePractice
//
//  Created by 工藤海斗 on 2021/03/03.
//

import Combine
import Foundation

class ConnpassTopViewModel: ObservableObject {
    var disposable = Set<AnyCancellable>()
    @Published var connpassGeneral: ConnpassGeneral?
    @Published var eventData: [Event]?
    
    init() {
        fetchConpassEvents()
    }
    
    func fetchConpassEvents() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let url = URL(string: "https://connpass.com/api/v1/event/?keyword=Swift&order=3")!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map({ (data, response) in
                return data
            })
            .decode(type: ConnpassGeneral.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("error ： " + error.localizedDescription)
                case .finished:
                    print("----------success-----------")
                }
            }, receiveValue: { [weak self] connpassGeneral in
                self?.eventData = connpassGeneral.events
                print(self?.eventData as Any)
            })
            .store(in: &disposable)
    }
}
