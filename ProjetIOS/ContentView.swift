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
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom , 300)
                    .padding(.leading , -35)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: 500)
            .background(Color(red: 112/255, green: 211/255, blue: 166/255))
            Spacer()
            
            
            HStack{
                Image("fleche")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Text("Explore now")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design:.default))
                    .padding()
                    
            }.frame(
                maxWidth : .infinity,
                maxHeight : 80
            )
            .background(
                RoundedRectangle(cornerRadius: 0 , style: .continuous)
                    .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                    .clipShape(
                        RoundedCorner(radius : 100 , corners: [.topLeft, .bottomLeft])
                    )
            )
            .padding(.bottom , 80)
            .padding(.leading , 50)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
    }
}


struct RoundedCorner:Shape{
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
    
    
}
#Preview {
    ContentView()
}
