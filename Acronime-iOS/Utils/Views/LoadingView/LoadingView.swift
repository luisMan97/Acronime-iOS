//
//  LoadingView.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

import SwiftUI

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var text = "Cargando..."
    var defaultBlur = false
    
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: (self.isShowing && self.defaultBlur) ? 1 : 0)
                
                if self.isShowing && !self.defaultBlur {
                    VisualEffectView(effect: UIBlurEffect(style: .light))
                        .edgesIgnoringSafeArea(.all)
                }

                VStack {
                    Text(text)
                        .multilineTextAlignment(.center)
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 2)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }

}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(true), content: {
            EmptyView()
        })
    }
}