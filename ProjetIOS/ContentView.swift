import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isUserLoggedIn: Bool = Auth.auth().currentUser != nil

    var body: some View {
        Group {
            if isUserLoggedIn {
                // If user is logged in, show the MainPage
                MainPage()
            } else {
                // If user is not logged in, show the WelcomeView
                WelcomeView()
            }
        }
        .onAppear {
            // Recheck the user status when the view appears
            isUserLoggedIn = Auth.auth().currentUser != nil
        }
    }
}

// This will be shown when the user is not logged in
struct WelcomeView: View {
    var body: some View {
        NavigationView {
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

                NavigationLink(destination: Acceuil()) {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 58/255, green: 54/255, blue: 48/255))
        }
    }

    // Custom shape for rounded corners
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
}
#Preview {
    ContentView()
}
