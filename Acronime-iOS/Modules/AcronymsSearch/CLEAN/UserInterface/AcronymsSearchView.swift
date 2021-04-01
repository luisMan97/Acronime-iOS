//
//  AcronymsSearchView.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import SwiftUI

struct AcronymsSearchView: View {
    
    @ObservedObject var viewModel: AcronymsSearchViewModel
    
    var body: some View {
            NavigationView {
                VStack {
                    if viewModel.showProgress == false {
                        AcronymsBodyView(viewModel: viewModel)
                            .add(viewModel.searchBar)
                            .alert(item: $viewModel.error) {
                                Alert(
                                    title: Text("Error"),
                                    message: Text($0.message),
                                    dismissButton: .default(Text("Ok"))
                                )
                            }
                    } else {
                        LoadingView(isShowing: $viewModel.showProgress, text: viewModel.progressTitle) {
                            EmptyView()
                        }
                    }
                }.navigationBarTitle("Definiciones de abreviaturas")
            }
    }
    
}

struct AcronymsSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AcronymsSearchBuilder.createModule()
    }
}
