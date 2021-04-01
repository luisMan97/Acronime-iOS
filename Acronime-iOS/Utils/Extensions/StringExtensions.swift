//
//  StringExtensions.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

extension String {
    
    func queryString(params: [String: Any]) -> String {
        var components = URLComponents(string: self)
        components?.setQueryItems(with: params)
        return components?.url?.absoluteString ?? self
    }

}
