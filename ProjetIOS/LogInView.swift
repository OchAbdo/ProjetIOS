import SwiftUI
import FirebaseAuth

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isChecked = false
    @State private var isSignedIn = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    // Function to handle login
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "Please enter both email and password."
            showAlert = true
            return
        }
        
        Task {
            do {
                let authData = try await Auth.auth().signIn(withEmail: email, password: password)
                if authData.user != nil {
                    isSignedIn = true
                    isLoggedIn = true
                    print("Logged in successfully")
                }
            } catch {
                alertMessage = error.localizedDescription
                showAlert = true
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: MainPage(), isActive: $isSignedIn) {
                    EmptyView()
                }
                
            
                HStack {
                    
                    NavigationLink(destination: Acceuil()) {
                        Image("backarrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 40)
                            .padding()
                    }
                    .padding(.top, 1)

                   
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 300)
                        .padding(.leading, -90)
                }
                .padding(.top, 50)
                
                VStack(spacing: 20) {
                    Text("Log In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Welcome back, glad to see you again!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    // Email input field
                    VStack(alignment: .leading) {
                        Text("Email")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        TextField("Enter your email", text: $email)
                            .padding()
                            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(width: 310, height: 50)
                    }
                    
                    // Password input field
                    VStack(alignment: .leading) {
                        Text("Password")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(width: 310, height: 50)
                    }
                    
                    // Remember me checkbox and forgot password text
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
                        
                        Text("Forgot password?")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.trailing)
                    }
                    .padding()
                    
                    // Log In button
                    Button(action: {
                        login() // Trigger login when button is pressed
                    }) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .frame(width: 310, height: 50)
                            .foregroundColor(.white)
                            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    
                    // Social media login options
                    Text("------ Or log in with ------")
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
                    .padding(.top, 10)
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
            
            // Show alert if there is an error
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LogInView()
}
