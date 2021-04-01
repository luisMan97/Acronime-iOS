//
//  AcronymsSearchRepository.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation
import Combine

class AcronymsSearchRepository: ObservableObject {
    
    private var remoteAcronymDataSource: RemoteAcronymDataSource
    
    init(remoteAcronymDataSource: RemoteAcronymDataSource) {
        self.remoteAcronymDataSource = remoteAcronymDataSource
    }
    
    func getAbbreviatioDefinitions(abbreviation: String) -> AnyPublisher<Acronym?, Error>? {
        remoteAcronymDataSource.getAbbreviatioDefinitions(abbreviation: abbreviation)
            .eraseToAnyPublisher()
    }
    
}
