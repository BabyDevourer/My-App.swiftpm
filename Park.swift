//
//  Park.swift
//  VietnamWildlifeConservation
//

import CoreLocation
import SwiftUI

struct Park {
    let name: String
    let region: String
    let keyEndangeredSpecies: [Animal]
    let importance: String
    let coordinates: CLLocationCoordinate2D
    let imageName : String
}
