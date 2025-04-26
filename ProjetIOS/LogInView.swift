import SwiftUI

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isChecked = false
    
    var body: some View {
        VStack {
            // Header with back arrow and logo centered
            HStack {
                Image("backarrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding()
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 160) // Adjusted size for better balance
                Spacer()
            }
            .padding(.top, 40)
            
            // Login Form
            VStack(spacing: 20) {
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Welcome back, glad to see you again!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                // Email TextField
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    TextField("Enter your email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 310, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                }
                
                // Password TextField
                VStack(alignment: .leading) {
                    Text("Password")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 310, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                }
                
                // Remember Me + Forgot Password Section
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
                
                // Log In Button
                Button(action: {
                    // Handle log in action
                }) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(width: 310, height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                // Alternative Login Option
                Text("Or log in with")
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                HStack {
                    // Social Login Buttons (Add images here if needed)
                    Button(action: {
                        // Handle Facebook login action
                    }) {
                        Image(systemName: "facebook.fill")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        // Handle Google login action
                    }) {
                        Image(systemName: "google")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 10)
            }
            .padding(.horizontal)
            .background(Color(red: 112/255, green: 211/255, blue: 166/255))
            .cornerRadius(20)
            .padding(.top, 30)
            
            Spacer()
        }
        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LogInView()
}
