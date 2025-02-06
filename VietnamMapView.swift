//
//  VietnamMapView.swift
//  VietnamWildlifeConservation
//
//  Created by Mỹ Nguyễn on 27/1/25.
//

import SwiftUI
import MapKit

struct VietnamMapView: View {
    
    /// The map view of Vietnam
    @ViewBuilder func map() -> some View {
        if #available(iOS 17.0, *) {
            Map() {
                ForEach(Resources.parks, id: \.name) { park in
                    Annotation(park.name, coordinate: park.coordinates) {
                        NavigationLink(destination: ParkView(park: park)) {
                            Circle().frame(width: 12, height: 12).foregroundStyle(.teal)
                        }

                    }
                }
            }
        } else {
            // Fallback on earlier versions
            EmptyView()
        }
    }
    
    var body: some View {
        NavigationView {
            map()
        }
    }
}
