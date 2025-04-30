import SwiftUI

struct Acceuil: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 300)
                        .padding(.leading, -35)
                        .padding(.top, 50)
                }
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .clipShape(
                            RoundedCorner(radius: 60, corners: [.bottomRight, .bottomLeft])
                        )
                )
                .padding(.top, -100)
                
                Spacer()
                
                NavigationLink(destination: LogInView()) {
                    Text("Log In")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 220, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                                .clipShape(
                                    RoundedCorner(radius: 15, corners: [.allCorners])
                                )
                        )
                }
                .padding(.top, 100)
                
                NavigationLink(destination: Signup()) {
                    Text("Sign Up")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 220, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                                .clipShape(
                                    RoundedCorner(radius: 15, corners: [.allCorners])
                                )
                        )
                }
                .padding()
                
                Spacer()
                
                Text("More about us ?")
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding()
                
                HStack {
                    Button(action: {}) {
                        Image("gmail")
                    }
                    Button(action: {}) {
                        Image("facebook")
                    }
                    Button(action: {}) {
                        Image("instagram")
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 58/255, green: 54/255, blue: 48/255))

        }.navigationBarHidden(true)

    }
}

struct RoundedCorner: Shape {
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
    Acceuil()
}
