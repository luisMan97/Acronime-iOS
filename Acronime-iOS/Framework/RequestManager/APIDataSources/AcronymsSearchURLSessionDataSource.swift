//
//  AcronymsSearchURLSessionDataSource.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation
import Combine

class AcronymsSearchURLSessionDataSource: RemoteAcronymDataSource {
    
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getAbbreviatioDefinitions(abbreviation: String) -> AnyPublisher<Acronym?, Error> {
        let parameters = [
            "sf": abbreviation
        ] as [String : String]
        
        return getAbbreviatioDefinitionsPublisher(parameters: parameters)
            .map(mapResponseToAcronym)
            .eraseToAnyPublisher()
    }
    
}

private extension AcronymsSearchURLSessionDataSource {
    
    /*func getAbbreviatioDefinitionsPublisher(parameters: [String: String]) -> AnyPublisher<AcronymServerReponse, Error> {
        APIManager
            .request(service: .Dictionary(parameters))
    }
    
    private func mapResponseToAcronym(_ ascronymServerReponse: AcronymServerReponse) -> Acronym? {
        ascronymServerReponse.toAcronymDomain()
    }*/
    
    func getAbbreviatioDefinitionsPublisher(parameters: [String: String]) -> AnyPublisher<[AbbreviationServerResponse], Error> {
        APIManager
            .request(service: .Dictionary(parameters))
    }
    
    private func mapResponseToAcronym(_ ascronymServerReponse: [AbbreviationServerResponse]) -> Acronym? {
        Acronym(abbreviations: ascronymServerReponse.map { $0.toAbbreviationDomain() })
    }
    
}
