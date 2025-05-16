import SwiftUI

struct SectionView: View {
    var title: String
    var bikes: [ListBike]

    @State private var selectedBrand: String = "All"
    @State private var selectedBike: ListBike? = nil

    var filteredBikes: [ListBike] {
        if selectedBrand == "All" {
            return bikes
        } else {
            return bikes.filter { $0.brand.lowercased() == selectedBrand.lowercased() }
        }
    }

    var brands: [String] {
        let allBrands = Set(bikes.map { $0.brand })
        return ["All"] + allBrands.sorted()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)

            HStack {
                Text("Brands")
                    .font(.custom("Poppins-Medium", size: 20))
                    .foregroundColor(Color(red: 112/255, green: 211/255, blue: 166/255))
                Spacer()
                Text("\(filteredBikes.count) Products")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(brands, id: \.self) { brand in
                        Button(action: {
                            selectedBrand = brand
                        }) {
                            Text(brand)
                                .fontWeight(.bold)
                                .font(.callout)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(selectedBrand == brand ? Color.green.opacity(0.7) : Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(filteredBikes) { bike in
                        Button(action: {
                            selectedBike = bike
                        }) {
                            VStack(alignment: .leading, spacing: 10) {
                                Image(" \(bike.img)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)

                                Text(bike.name)
                                    .font(.headline)
                                    .foregroundColor(.black)

                              /* Text("Brand: \(bike.brand)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                Text("Speed: \(bike.speed) km/h")
                                    .font(.subheadline)
                                    .foregroundColor(.gray) */
                            }
                            .padding()
                            .frame(width: 160, height: 200)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                        }
                    }
                }
                .padding(.horizontal)
            }

            // 🚀 Navigation vers BicycleDetails
            NavigationLink(
                destination: Group {
                    if let selectedBike = selectedBike {
                        BicycleDetails(bike: selectedBike)
                       // VeloDe(bike: selectedBike)
                    }
                },
                isActive: Binding(
                    get: { selectedBike != nil },
                    set: { if !$0 { selectedBike = nil } }
                )
            ) {
                EmptyView()
            }
        }
    }
}
