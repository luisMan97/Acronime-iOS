//
//  UINavigationBarAppearanceExtensions.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import UIKit

extension UINavigationBarAppearance {
    
    func setup() -> UINavigationBarAppearance {
    
        let apperance = UINavigationBarAppearance()
        
        apperance.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 29),
        ]
                
        return apperance
    }
    
}
