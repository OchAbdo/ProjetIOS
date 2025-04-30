import SwiftUI

struct BicycleDetails: View {
    var body: some View {
        VStack(spacing: 30) {
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .fill(Color(red: 112/255, green: 211/255, blue: 166/255))
                    .frame(height: 200)
                    .clipShape(RoundedCorner(radius: 60, corners: [.bottomLeft, .bottomRight]))
                    .padding(.top, -50)
                
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 150)
                        .padding(.leading)

                    Spacer()
                    
                    Image("notification")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)

                    Image("profile")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing)
                }
                .padding(.top, 20)
            }

            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Top Speed")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))

                    Text("200 km/h")
                        .foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .font(.system(size: 30, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Warranty")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))

                    Text("3 yrs")
                        .foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .font(.system(size: 30, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 67/255, green: 66/255, blue: 66/255))
            )
            .padding(.horizontal)

            VStack(spacing: 20) {
                Image("bikeImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .background(Color.white)
                    .cornerRadius(12)
                
                Button(action: {

                }) {
                    Text("Buy now")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                        )
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 58/255, green: 54/255, blue: 48/255))
    }
}

#Preview {
    BicycleDetails()
}
