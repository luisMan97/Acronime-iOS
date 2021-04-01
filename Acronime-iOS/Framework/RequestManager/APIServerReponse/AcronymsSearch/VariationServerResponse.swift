//
//  VariationServerResponse.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

struct VariationServerResponse: Codable {
    let longform: String?
    let freq: Int?
    let since: Int?
    
    private enum CodingKeys: String, CodingKey {
        case longform = "lf"
        case freq
        case since
    }
}

extension VariationServerResponse {
    
    func toVariationDomain() -> Variation {
        Variation(longform: longform,
                  freq: freq,
                  since: since
        )
    }
    
}
