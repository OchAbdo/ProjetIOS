//
//  SplashScreenView.swift
//  ProjetIOS
//
//  Created by Tekup-mac-7 on 26/4/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isShowing = false
    var body: some View {
        VStack {
            if isShowing {
                ContentView()
            } else {
                LottieView(name: "animation", loopMode: .loop)
                    .background(Color(red: 58/255, green: 54/255, blue: 48/255))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    isShowing = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
