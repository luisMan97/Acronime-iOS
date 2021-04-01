//
//  SearchBarView.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var onSearch: (( _ text: String) -> ())?
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.secondary)
            
            TextField("Search", text: $searchText, onCommit:  {
                onSearch?(searchText)
            })
            
            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill").foregroundColor(.secondary).opacity(searchText == "" ? 0 : 1)
            }
        }//.padding(.horizontal)
    }
}
