//
//  AbbreviationServerResponse.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

struct AbbreviationServerResponse: Codable {
    let name: String?
    let longforms: [LongformServerResponse]?
    
    private enum CodingKeys: String, CodingKey {
        case name = "sf"
        case longforms = "lfs"
    }
}

extension AbbreviationServerResponse {
    
    func toAbbreviationDomain() -> Abbreviation {
        Abbreviation(name: name,
                     longforms: longforms?.map { $0.toLongformDomain() }
        )
    }
    
}
