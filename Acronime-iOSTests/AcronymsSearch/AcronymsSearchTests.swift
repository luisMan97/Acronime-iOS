//
//  AcronymsSearchTests.swift
//  Acronime-iOSTests
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import XCTest
import Combine
import Acronime_iOS

class HomeTestViewTest: XCTestCase {
    
    var viewModel: AcronymsSearchViewModel!
    var getAbbreviatioDefinitionsUseCase: GetAbbreviatioDefinitionsUseCase!
    var repository: AcronymsSearchRepository!
    var dataSource: RemoteAcronymDataSource!
    var apiManager: APIManager!
    
    // Private Properties
    fileprivate(set) var subscriptions: Set<AnyCancellable> = [] // Cancellables

    override func setUp() {
        super.setUp()
        apiManager = APIManager()
        dataSource = AcronymsSearchURLSessionDataSource(apiManager: apiManager)
        repository = AcronymsSearchRepository(remoteAcronymDataSource: dataSource)
        getAbbreviatioDefinitionsUseCase = GetAbbreviatioDefinitionsUseCase(repository: repository)
        viewModel = AcronymsSearchViewModel(getAbbreviatioDefinitionsUseCase: getAbbreviatioDefinitionsUseCase)
    }
    
    func testViewModel() {
        // ViewModel
        
        let vars = [
            Variation(longform: "heavy meromyosin", freq: 244, since: 1971)
        ]
        
        let longforms = [
            Longform(name: "heavy meromyosin", freq: 267, since: 1971, vars: vars)
        ]
        
        let abbreviations = [
            Abbreviation(name: "HMM", longforms: longforms)
        ]
        
        viewModel.acronym = Acronym(abbreviations: abbreviations)
        
        XCTAssertEqual(viewModel.acronym?.abbreviations?.count, 1)
        XCTAssertEqual(viewModel.acronym?.abbreviations?.first?.name, "HMM")
        XCTAssertEqual(viewModel.acronym?.abbreviations?.first?.longforms?.first?.name, "heavy meromyosin")
        XCTAssertEqual(viewModel.acronym?.abbreviations?.first?.longforms?.first?.vars?.first?.longform, "heavy meromyosin")
    }
        
    /*func testDataSource() {
        let varsResponse = [
            VariationServerResponse(longform: "heavy meromyosin", freq: 244, since: 1971)
        ]
        
        let longformsResponse = [
            LongformServerResponse(name: "heavy meromyosin", freq: 267, since: 1971, vars: varsResponse)
        ]
        
        let abbreviationsServerResponse = [
            AbbreviationServerResponse(name: "HMM", longforms: longformsResponse)
        ]
        
        let acronymServerReponse = AcronymServerReponse(abbreviations: abbreviationsServerResponse)
        
        (dataSource as! AcronymsSearchURLSessionDataSource).getAbbreviatioDefinitions(abbreviation: "HMM")
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    self?.viewModel.error = IdentifiableError(message: error.localizedDescription)
                }
                
                self?.viewModel.showProgress = false
            }, receiveValue: { [weak self] (value: Acronym?) in
                self?.viewModel.acronym = value
            })
            .store(in: &subscriptions)
    }*/
     
    /*private func mapResponseToAcronym(_ ascronymServerReponse: [AbbreviationServerResponse]) -> Acronym? {
        Acronym(abbreviations: ascronymServerReponse.map { $0.toAbbreviationDomain() })
    }*/
        
}
