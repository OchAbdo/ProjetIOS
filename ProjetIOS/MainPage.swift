import SwiftUI
import Firebase
import FirebaseAuth

struct MainPage: View {
    
    @StateObject private var firebaseService = FirebaseService()
    var service = FirebaseService()

    // Fetch data when the page appears
    var body: some View {
        VStack {
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
                            print("User logged out successfully.")
                        } catch let error {
                            print("Error signing out: \(error.localizedDescription)")
                        }
                    }) {
                        Text("Logout")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Medium", size: 20).bold())
                            .padding(.leading, -100)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(
                RoundedRectangle(cornerRadius: 0, style: .continuous)
                    .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                    .clipShape(
                        RoundedCorner(radius: 60, corners: [.bottomRight, .bottomLeft])
                    )
            )
            .padding(.top, -100)

            ScrollView {
                VStack {
                    Text("Electric Bikes").font(.system(size: 30, weight: .bold, design: .default)).foregroundColor(.white)
                    
                    HStack {
                        Text("Brands").font(.custom("Poppins-Medium", size: 20)).foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255)).padding(.leading , 20)
                        Spacer()
                        Text("n Products").font(.custom("Poppins-Medium", size: 15)).foregroundColor(.gray).padding()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            //service.readBikemodel()
                            print(service.listb)
                            print(service.obje.name)// Make sure the `value` is updated in `FirebaseService`
                        }) {
                            Text("55").fontWeight(.bold).font(.callout).padding()
                        }
                        Button(action: {}) {
                            Text("YAMAHA").fontWeight(.bold).font(.callout)
                        }
                        Button(action: {}) {
                            Text("XIAOMI").fontWeight(.bold).font(.callout).padding()
                        }
                    }.padding(.top , -30)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<5) { _ in
                                VStack {
                                    // Add image or content related to each bike
                                }
                                .frame(width: 120 , height: 200)
                                .background(Color.white)
                                .cornerRadius(20)
                            }
                        }
                    }
                }.padding()

                // Second section (Similar to the first section)
                VStack {
                    Text("Bikes").font(.system(size: 30, weight: .bold, design: .default)).foregroundColor(.white)
                    
                    HStack {
                        Text("Brands").font(.custom("Poppins-Medium", size: 20)).foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255)).padding(.leading , 20)
                        Spacer()
                        Text("n Products").font(.custom("Poppins-Medium", size: 15)).foregroundColor(.gray).padding()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Text("NIU").fontWeight(.bold).font(.callout).padding()
                        }
                        Button(action: {}) {
                            Text("YAMAHA").fontWeight(.bold).font(.callout)
                        }
                        Button(action: {}) {
                            Text("XIAOMI").fontWeight(.bold).font(.callout).padding()
                        }
                    }.padding(.top , -30)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<5) { _ in
                                VStack {
                                    // Add image or content related to each bike
                                }
                                .frame(width: 120 , height: 200)
                                .background(Color.white)
                                .cornerRadius(20)
                            }
                        }
                    }
                }.padding()
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
        .navigationBarHidden(true)
        .onAppear {
            // Call the data-fetching method when the view appears
 
        }
    }
}

#Preview {
    MainPage()
}
