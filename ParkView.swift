import SwiftUI
import CoreLocation

struct ParkView: View {
    let park: Park
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Park Image on top
                Image(park.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.height * 0.4)
                    .cornerRadius(15)
                    .clipped()
                
                // Park Details
                Text(park.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(park.region)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Text(park.importance)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
                    .padding(.top, 2)
                
                // endangered species
                if !park.keyEndangeredSpecies.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Key Endangered Species:")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(park.keyEndangeredSpecies, id: \.name) { species in
                            NavigationLink(destination: AnimalView(animal: species)){
                                Text("- \(species.name)")
                                
                                    .padding(.horizontal)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(.top, 5)
                }

                // coordinate
                VStack(alignment: .leading, spacing: 5) {
                    Text("Coordinates:")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Text("Latitude: \(park.coordinates.latitude)")
                        .padding(.horizontal)
                    
                    Text("Longitude: \(park.coordinates.longitude)")
                        .padding(.horizontal)
                }
                .padding(.top, 10)
            }
            .padding(.bottom, 20)
        }
        .ignoresSafeArea(edges: .top)
    }
}
