import SwiftUI
import Firebase

struct Signup: View {
    @State var fullname = ""
    @State var email = ""
    @State var birthday = ""
    @State var password = ""
    @State var conpassword = ""
    @State private var isChecked = false
    @State private var isSignedIn = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    // Function to handle sign-up and authentication
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "Please enter both email and password."
            showAlert = true
            return
        }
        
        guard password == conpassword else {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }
        
        Task {
            do {
                // Attempt to create user with email and password
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success:", returnedUserData)
                
                // After successful sign-up, check if the user is authenticated
                let authenticatedUser = try AuthenticationManager.shared.getAuthenticatedUser()
                print("User authenticated:", authenticatedUser)
                
                // If user is authenticated, navigate to main page
                isSignedIn = true
            } catch {
                print("error")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // NavigationLink to MainPage when isSignedIn is true
                NavigationLink(destination: MainPage(), isActive: $isSignedIn) {
                    EmptyView()
                }
                
                // Sign-up form
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
                    
                    ScrollView {
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
                    
                    // Remember me checkbox
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
                    
                    // Sign Up Button
                    Button(action: {
                        signIn()
                    }) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .frame(width: 310, height: 50)
                            .foregroundColor(.white)
                            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                            .cornerRadius(20)
                    }
                    .padding(.top, 20)
                    
                    // Social Media Sign-up Options
                
                        VStack {
                            // Autres éléments de votre formulaire de création de compte

                            // Texte cliquable pour rediriger vers la vue de connexion
                            NavigationLink(destination: LogInView()) {
                                Text("Already have an account?")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .underline()
                            }
                            .padding(.top, 1)

                            // Autres éléments de votre formulaire de création de compte
                        }
                        .navigationBarHidden(true)
                    
                    HStack {
                        Button(action: {}){
                            Image("gmail")
                        }
                        Button(action: {}){
                            Image("facebook")
                        }
                        Button(action: {}){
                            Image("instagram")
                        }
                    }
                    .padding(.bottom, 10)
                }
                .frame(width: 360, height: 650)
                .background(Color(red: 112/255, green: 211/255, blue: 166/255))
                .cornerRadius(20)
                .padding(.top, 80)
                .padding(.bottom, 150)
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Signup()
}
