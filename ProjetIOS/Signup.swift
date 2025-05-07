//
//  Signup.swift
//  ProjetIOS
//
//  Created by Tekup-mac-4 on 26/4/2025.
//

import SwiftUI
import Firebase

struct Signup: View {
    @State var fullname = ""
    @State var email = ""
    @State var birthday = ""
    @State var password = ""
    @State var conpassword = ""
    @State private var isChecked = false
    
    func signIn(){
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or passwort")
            return
        }
        Task{
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("success")
                print(returnedUserData)
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    var body: some View {
        NavigationView{
            
        VStack {
            NavigationLink(destination: Acceuil()) {
            HStack {
                Image("backarrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 40)
                    .padding(.top, 25)
               
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 300)
                    .padding(.leading, -90)
            }
            .padding(.top, 50)
            }
            VStack(spacing: 20) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 58/255, green: 54/255, blue: 48/255))
                    .padding()
                
                Text("Create An Account")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, -20)
                    .padding(.bottom , 30)
                ScrollView{
                
                VStack(alignment: .leading) {
                    Text("Full Name")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    TextField("Full Name", text: $fullname)
                        .padding()
                        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .frame(width: 310, height: 50)
                    
                }.padding(.bottom , 30)
                
                VStack(alignment: .leading) {
                    Text("E-mail")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    TextField("E-mail", text: $email)
                        .padding()
                        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .frame(width: 310, height: 50)
                }.padding(.bottom , 30)
                    
                    VStack(alignment: .leading) {
                        Text("Date Of Birthday")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        TextField("Date Of Birthday", text: $birthday)
                            .padding()
                            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .frame(width: 310, height: 50)
                    }.padding(.bottom , 30)
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .frame(width: 310, height: 50)
                    }.padding(.bottom , 30)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Confirm Password")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        SecureField("Confirm Password", text: $conpassword)
                            .padding()
                            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .frame(width: 310, height: 50)
                    }.padding(.bottom , 30)
                    
                    
                }.frame(width: 350, height: 220)
                
                
                
                HStack {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                        .foregroundColor(isChecked ? .blue : .gray)
                        .onTapGesture {
                            isChecked.toggle()
                        }
                        .frame(width: 20, height: 20)
                    
                    Text("Remember me later")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .padding()
                
                Button(action: {
                    signIn()
                }) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(width: 310, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                        .cornerRadius(20)
                }
                .padding(.top, 20)
       
                Text("------ Or Sign Up with ------")
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                HStack {
           
                    Button(action:{}){
                        Image("gmail")
                    }
                    Button(action:{}){
                        Image("facebook")
                    }
                    Button(action:{}){
                        Image("instagram")
                    }
                }
                .padding(.bottom, 10)
            }
            .frame(width: 360, height: 650)
            .background(Color(red: 112/255, green: 211/255, blue: 166/255))
            .cornerRadius(20)
            .padding(.top, -80)
            .padding(.bottom, 150)
            .padding(.horizontal)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
        
        }.navigationBarHidden(true)
    }
}

#Preview {
    Signup()
}
