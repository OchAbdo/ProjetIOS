//
//  ContentView.swift
//  ProjetIOS
//
//  Created by Tekup-mac-4 on 23/4/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
            }
            .frame(
                width: 500,
                height: 500
            )
            .background(Color(red: 112/255, green: 211/255, blue: 166/255))
            Spacer()
            
            VStack{
                Text("Explore now")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design:.default))
                    
            }.frame(
                width: 390,
                height: 80
            )
            .background(Color(red: 112/255, green: 211/255, blue: 166/255))
            .cornerRadius(200)
            .padding(.bottom , 80)
            .padding(.leading , 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
    }
}

#Preview {
    ContentView()
}
