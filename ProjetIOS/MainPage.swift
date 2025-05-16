import SwiftUI
import Firebase
import FirebaseAuth

struct MainPage: View {

    @StateObject private var service = FirebaseService()
    @State private var showChat = false // <- Toggle pour navigation
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                // Header
                VStack {
                    Spacer(minLength: 110)
                    HStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        
                        Spacer()
                        Button(action: {
                            do {
                                try Auth.auth().signOut()
                                isLoggedIn = false // ← redirige vers LoginView
                                print("User logged out successfully.")
                            } catch let error {
                                print("Error signing out: \(error.localizedDescription)")
                            }
                        }) {
                            Text("Logout")
                                .foregroundColor(.white)
                                .font(.custom("Poppins-Medium", size: 20).bold())
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .clipShape(
                            RoundedCorner(radius: 60, corners: [.bottomRight, .bottomLeft])
                        )
                )
                .padding(.top, -100)

                // Content
                ScrollView {
                    VStack(spacing: 40) {
                        SectionView(
                            title: "Electric Bikes",
                            bikes: service.listb.filter { $0.type.lowercased() == "electric" }
                        )

                        SectionView(
                            title: "Bikes",
                            bikes: service.listb.filter { $0.type.lowercased() == "normal" }
                        )
                    }
                    .padding()
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
            .navigationBarHidden(true)

            // ✅ Floating circle button
            Button(action: {
                showChat = true
            }) {
                Image(systemName: "message.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 112/255, green: 211/255, blue: 166/255))
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding(24)
            .fullScreenCover(isPresented: $showChat) {
                ChatView() // ← Remplace par ta vue cible
            }
        }
    }
}

#Preview {
    MainPage()
}
