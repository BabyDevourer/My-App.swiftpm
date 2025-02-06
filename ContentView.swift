import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        TabView {
            VietnamMapView()
                .tabItem {
                Label("Vietnam Map", systemImage: "map.fill")
            }
            AnimalListView()
                .tabItem {
                    Label("Animals", systemImage: "pawprint.circle.fill")
            }
        }
    }
}

