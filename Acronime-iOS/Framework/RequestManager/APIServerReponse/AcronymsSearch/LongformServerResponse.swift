//
//  LongformServerResponse.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

struct LongformServerResponse: Codable {
    let name: String?
    let freq: Int?
    let since: Int?
    let vars: [VariationServerResponse]?
    
    private enum CodingKeys: String, CodingKey {
        case name = "lf"
        case freq
        case since
        case vars 
    }
}

extension LongformServerResponse {
    
    func toLongformDomain() -> Longform {
        Longform(name: name,
                 freq: freq,
                 since: since,
                 vars: vars?.map { $0.toVariationDomain() }
        )
    }
    
}
