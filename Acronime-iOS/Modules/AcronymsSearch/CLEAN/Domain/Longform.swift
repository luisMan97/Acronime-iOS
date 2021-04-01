//
//  Longform.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

struct Longform: Identifiable {
    //var id: ObjectIdentifier?
    var id = UUID()
    let name: String?
    let freq: Int?
    let since: Int?
    let vars: [Variation]?
}
