//
//  AcronymServerReponse.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

struct AcronymServerReponse: Codable {
    let abbreviations: [AbbreviationServerResponse]?
}

extension AcronymServerReponse {
    func toAcronymDomain() -> Acronym {
        Acronym(abbreviations: abbreviations?.map { $0.toAbbreviationDomain() })
    }
}
