//
//  AcronymsBodyView.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import SwiftUI

struct AcronymsBodyView: View {
    
    @ObservedObject var viewModel: AcronymsSearchViewModel
    
    var body: some View {
        if viewModel.acronym?.abbreviations?.first?.longforms != nil {
            viewModel.acronym?.abbreviations?.first?.longforms.map { longform in
                VStack {
                    Text("Busquedas encontradas de \(viewModel.acronym?.abbreviations?.first?.name ?? ""):")
                        .padding(.top)
                    
                    List(longform, id: \.name) { item in
                        VStack(alignment: .leading) {
                            Text("Fullform: \(item.name ?? "")")
                            Text("Frequence: \(item.freq ?? 0)")
                            Text("Since: \(item.since ?? 0)")
                        }
                    }
                }
            }
        } else {
            VStack(alignment: .center, spacing: 10) {
                if !viewModel.searchText.isEmpty {
                    Text("Lo sentimos, no hemos encontrado resultados en la busqueda")
                        .font(.system(.title3, design: .rounded))
                        .multilineTextAlignment(.center)
                }
                
                Text("Puedes probar por ejemplo con HM")
                    .font(.system(.body, design: .rounded))
                    .multilineTextAlignment(.center)
                
                /*Button {
                    viewModel.getAbbreviatioDefinitions(abbreviation: "HMM")
                } label: {
                    Text("Intentar")
                }*/
            }
        }
    }
    
}

struct BodyWithSearch: View {
    
    @Binding var searchText: String
    @ObservedObject var viewModel: AcronymsSearchViewModel
    
    var body: some View {
        GeometryReader { g in
            ScrollView {
                SearchBarView(searchText: $searchText) { searchText in
                    viewModel.getAbbreviatioDefinitions(abbreviation: searchText)
                }
                List {
                    viewModel.acronym?.abbreviations?.first?.longforms.map { longform in
                        ForEach(longform, id: \.name) {
                            Text($0.name ?? "")
                        }
                    }
                }.frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)
            }
        }
    }
    
}

struct AcronymsSearchBodyView: View {
    
    @Binding var searchText: String
    @ObservedObject var viewModel: AcronymsSearchViewModel
    
    var body: some View {
        List {
            /*Section {
                SearchBar(searchText: $searchText) { searchText in
                    viewModel.getAbbreviatioDefinitions(abbreviation: searchText)
                }
            }*/
            SearchBarView(searchText: $searchText) { searchText in
                viewModel.getAbbreviatioDefinitions(abbreviation: searchText)
            }
                                .padding(7)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                            
            
            if viewModel.acronym?.abbreviations?.first?.longforms != nil {
                viewModel.acronym?.abbreviations?.first?.longforms.map { longform in
                    ForEach(longform, id: \.name) {
                        Text($0.name ?? "")
                    }
                }
            } else {
                
                VStack(alignment: .center, spacing: 10) {
                    
                    Spacer()
                    
                    Text("Lo sentimos, no hemos encontrado resultados en la busqueda")
                        .font(.system(.title3, design: .rounded))
                    
                    Text("Puedes probar por ejemplo con HMM")
                        .font(.system(.body, design: .rounded))
                }
                
                
            }
            
        }.padding(.top)
    }
    
    
}

struct BodyWithSearchInSection: View {
    
    @Binding var searchText: String
    @ObservedObject var viewModel: AcronymsSearchViewModel
    
    var body: some View {
        List {
            Section {
                SearchBarView(searchText: $searchText) { searchText in
                    viewModel.getAbbreviatioDefinitions(abbreviation: searchText)
                }
            }
            
            if viewModel.acronym?.abbreviations?.first?.longforms != nil {
                viewModel.acronym?.abbreviations?.first?.longforms.map { longform in
                    ForEach(longform, id: \.name) {
                        Text($0.name ?? "")
                    }
                }
            } else {
                
                VStack(alignment: .center, spacing: 10) {
                    
                    Spacer()
                    
                    Text("Lo sentimos, no hemos encontrado resultados en la busqueda")
                        .font(.system(.title3, design: .rounded))
                    
                    Text("Puedes probar por ejemplo con HMM")
                        .font(.system(.body, design: .rounded))
                }
                
                
            }
            
        }.padding(.top)
    }
    
}
