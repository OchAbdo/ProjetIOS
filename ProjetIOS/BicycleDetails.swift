import SwiftUI

struct BicycleDetails: View {
    let bike: ListBike
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
                        .padding()

                    
               
                }
                .padding()
            }

            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))

                    Text(bike.name)
                        .foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .font(.system(size: 20, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Top Speed")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))

                    Text("\(bike.speed) km/h")
                        .foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .font(.system(size: 20, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Type")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))

                    Text(bike.type)
                        .foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255))
                        .font(.system(size: 20, weight: .bold))
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
                Image("\(bike.img)")
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
    BicycleDetails(bike: ListBike(
        id: "1",
        name: "Mountain X200",
        type: "Electric",
        speed: "45",
        brand: "X-Bike",
        img: "aa"
    ))
}
