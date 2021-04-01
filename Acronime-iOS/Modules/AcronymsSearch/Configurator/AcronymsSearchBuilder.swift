//
//  AcronymsSearchBuilder.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

class AcronymsSearchBuilder {
        
    class func createModule(repository: AcronymsSearchRepository = AcronymsSearchRepository(remoteAcronymDataSource: AcronymsSearchURLSessionDataSource(apiManager: APIManager()))) -> AcronymsSearchView {
        // Interactor
        let getAbbreviatioDefinitionsUseCase = GetAbbreviatioDefinitionsUseCase(repository: repository)
        
        let viewModel = AcronymsSearchViewModel(getAbbreviatioDefinitionsUseCase: getAbbreviatioDefinitionsUseCase)
        
        return AcronymsSearchView(viewModel: viewModel)
    }
    
}
