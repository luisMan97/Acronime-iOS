//
//  AcronymsSearchViewModel.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation
import Combine

class AcronymsSearchViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var acronym: Acronym?
    @Published var error: IdentifiableError?
    
    // Internal Input Properties
    @Published var searchText: String = ""
    
    // Internal Properties
    var searchBar = SearchBar()
    var progressTitle = ""
    
    // Interactor
    private var getAbbreviatioDefinitionsUseCase: GetAbbreviatioDefinitionsUseCase
    
    // Private Properties
    fileprivate(set) var subscriptions: Set<AnyCancellable> = [] // Cancellables
    
    // MARK: - Initializers

    init(getAbbreviatioDefinitionsUseCase: GetAbbreviatioDefinitionsUseCase) {
        self.getAbbreviatioDefinitionsUseCase = getAbbreviatioDefinitionsUseCase
        publishedAssign()
        search()
    }
    
    // MARK: - Internal Methods
    
    func getAbbreviatioDefinitions(abbreviation: String) {
        progressTitle = "Cargando definiciones de abreviaturas..."
        showProgress = true
        
        getAbbreviatioDefinitionsUseCase.invoke(abbreviation: abbreviation)?
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    self?.error = IdentifiableError(message: error.localizedDescription)
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: Acronym?) in
                self?.acronym = value
            })
            .store(in: &subscriptions)
    }
    
    // MARK: - Private Methods
    
    private func publishedAssign() {
        searchBar.$text
            .assign(to: \.searchText, on: self)
            .store(in: &subscriptions)
    }
    
    private func search() {
        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main) // debounces the string publisher, such that it delays the process of sending request to remote server.
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < 1 {
                    self.acronym?.abbreviations = []
                    return nil
                }
                
                return string
            }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
            .compactMap{ $0 } // removes the nil values so the search string does not get passed down to the publisher chain
            .sink { (_) in
                //
            } receiveValue: { [self] (searchField) in
                getAbbreviatioDefinitions(abbreviation: searchField)
            }.store(in: &subscriptions)
    }
    
}
