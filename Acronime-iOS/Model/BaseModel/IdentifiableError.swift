//
//  IdentifiableError.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

struct IdentifiableError: Identifiable {
    var id = UUID()
    var message: String
}
