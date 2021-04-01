//
//  RemoteAcronymDataSource.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation
import Combine

protocol RemoteAcronymDataSource {
    
    func getAbbreviatioDefinitions(abbreviation: String) -> AnyPublisher<Acronym?, Error>
    
}
