//
//  UINavigationBarExtensions.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import UIKit

extension UINavigationBar {
    
    func setup() {
        let apperance = UINavigationBar.appearance()
        let standardAppearance = UINavigationBarAppearance().setup()
    
        apperance.standardAppearance = standardAppearance
        apperance.compactAppearance = standardAppearance
        apperance.scrollEdgeAppearance = standardAppearance
    }
    
}
