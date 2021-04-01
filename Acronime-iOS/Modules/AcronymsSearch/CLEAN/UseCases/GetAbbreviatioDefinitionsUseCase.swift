//
//  GetAbbreviatioDefinitionsUseCase.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation
import Combine

class GetAbbreviatioDefinitionsUseCase: ObservableObject {
    
    // Repository
    private var repository: AcronymsSearchRepository
    
    // MARK: - Initializers
    
    init(repository: AcronymsSearchRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(abbreviation: String) -> AnyPublisher<Acronym?, Error>? {
        repository.getAbbreviatioDefinitions(abbreviation: abbreviation)
    }

}
