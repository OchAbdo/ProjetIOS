//
//  MainPage.swift
//  ProjetIOS
//
//  Created by Tekup-mac-4 on 30/4/2025.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        VStack{
        VStack{
            Spacer(minLength: 110)
            HStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                
                Spacer()
                Button(action:{}){
                    Image("chariot").padding(.leading , -70)
                }
                
            }
            
        }.frame(maxWidth: .infinity,maxHeight: 200)
        .background(
            RoundedRectangle(cornerRadius: 0 , style: .continuous)
                .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                .clipShape(
                    RoundedCorner(radius : 60 , corners: [.bottomRight, .bottomLeft])
                )
        )
        .padding(.top , -100)
        
            ScrollView{
            
            VStack{
                Text("Electric Bikes").font(.system(size: 30, weight: .bold, design: .default)).foregroundColor(.white)
                
                HStack{
                    Text("Brands").font(.custom("Poppins-Medium", size: 20)).foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255)).padding(.leading , 20)
                    Spacer()
                    Text("n Products").font(.custom("Poppins-Medium", size: 15)).foregroundColor(.gray).padding()
                }
                
                HStack{
                    Spacer()
                    Button(action:{}){
                        Text("NIU").fontWeight(.bold).font(.callout).padding()
                    }
                    Button(action:{}){
                        Text("YAMAHA").fontWeight(.bold).font(.callout)
                    }
                    Button(action:{}){
                        Text("XIAOMI").fontWeight(.bold).font(.callout).padding()
                    }
                    
                }.padding(.top , -30)
                
                ScrollView(.horizontal){
                    
                    HStack(spacing: 20){
                        
                    
                    ForEach(0..<5){_ in

                    VStack{
                        
                    }.frame(width: 120 , height: 200)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                }
                
            }.padding()
                
          
            
            //deuxieme
            VStack{
                Text("Bikes").font(.system(size: 30, weight: .bold, design: .default)).foregroundColor(.white)
                
                HStack{
                    Text("Brands").font(.custom("Poppins-Medium", size: 20)).foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255)).padding(.leading , 20)
                    Spacer()
                    Text("n Products").font(.custom("Poppins-Medium", size: 15)).foregroundColor(.gray).padding()
                }
                
                HStack{
                    Spacer()
                    Button(action:{}){
                        Text("NIU").fontWeight(.bold).font(.callout).padding()
                    }
                    Button(action:{}){
                        Text("YAMAHA").fontWeight(.bold).font(.callout)
                    }
                    Button(action:{}){
                        Text("XIAOMI").fontWeight(.bold).font(.callout).padding()
                    }
                    
                }.padding(.top , -30)
                
                ScrollView(.horizontal){
                    
                    HStack(spacing: 20){
                        
                    
                    ForEach(0..<5){_ in

                    VStack{
                        
                    }.frame(width: 120 , height: 200)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                }
                
            }.padding()
            
            }
            
            
            
            Spacer()

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
        
        
    }
}

#Preview {
    MainPage()
}
