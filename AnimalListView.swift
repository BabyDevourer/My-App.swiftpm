//
//  AnimalListView.swift
//  VietnamWildlifeConservation
//
//  Created by Mỹ Nguyễn on 27/1/25.
//

import SwiftUI
import RealityKit
import ARKit

struct AnimalListView: View {
    var body: some View {
        NavigationView {
            List(Resources.animals) { animal in
                NavigationLink(destination: AnimalView(animal: animal)) {
                    Text(animal.name)
                }
            }
        }
        .navigationTitle("Animals")
    }
}
