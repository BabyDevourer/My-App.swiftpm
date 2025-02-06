//
//  Park.swift
//  VietnamWildlifeConservation
//
//  Created by Mỹ Nguyễn on 27/1/25.
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
