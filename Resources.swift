//
//  Resources.swift
//  VietnamWildlifeConservation
//

import Foundation
import CoreLocation
import SwiftUI

struct Resources {
    static let vietnamCoordinates = CLLocationCoordinate2D(latitude: 14.0583, longitude: 108.2772)
    
    // MARK:  Animals
    static let saola = Animal(name: "Saola", scientificName: "Pseudoryx nghetinhensis", type: .mammal, conservationStatus: .criticallyEndangered, estimatedPopulation: 100, protectedAreas: "Vũ Quang NP, Pù Mát NP, Phong Nha-Kẻ Bàng NP", threats: [.poaching, .habitatDestruction], imageName: "saolaImage", ARName: "saola3D")
    
    static let indochineseTiger = Animal(name: "Indochinese Tiger", scientificName: "Panthera tigris corbetti", type: .mammal, conservationStatus: .criticallyEndangered, estimatedPopulation: 5, protectedAreas: "Yok Đôn NP, Pù Mát NP, Cát Tiên NP", threats: [.poaching, .deforestation], imageName: "indochineseTigerImage", ARName: "indochineseTiger3D")
    
    static let asianElephant = Animal(name: "Asian Elephant", scientificName: "Elephas maximus", type: .mammal, conservationStatus: .endangered, estimatedPopulation: 100, protectedAreas: "Yok Đôn NP, Cát Tiên NP, Pù Mát NP", threats: [.habitatLoss, .humanWildlifeConflict], imageName: "asianElephantImage", ARName: "asianElephant3D")
    
    static let delacoursLangur = Animal(name: "Delacour's Langur", scientificName: "Trachypithecus delacouri", type: .mammal, conservationStatus: .criticallyEndangered, estimatedPopulation: 300, protectedAreas: "Cúc Phương NP, Vân Long NR", threats: [.hunting, .habitatLoss], imageName: "delacourLangurImage", ARName: "delacoursLangur3D")
    
    static let redShankedDoucLangur = Animal(name: "Red-shanked Douc Langur", scientificName: "Pygathrix nemaeus", type: .mammal, conservationStatus: .endangered, estimatedPopulation: 2000, protectedAreas: "Sơn Trà NR, Phong Nha-Kẻ Bàng NP, Bạch Mã NP", threats: [.deforestation, .illegalPetTrade], imageName: "redShankedDoucLangurImage", ARName: "redShankedDoucLangur3D")
    
    static let tonkinSnubNosedMonkey = Animal(name: "Tonkin Snub-nosed Monkey", scientificName: "Rhinopithecus avunculus", type: .mammal, conservationStatus: .criticallyEndangered, estimatedPopulation: 250, protectedAreas: "Khau Ca NR, Na Hang NR", threats: [.habitatLoss, .hunting], imageName: "tonkinSnubNosedMonkeyImage", ARName: "tonkinSnubNosedMonkey3D")
    
    static let sundaPangolin = Animal(name: "Sunda Pangolin", scientificName: "Manis javanica", type: .mammal, conservationStatus: .criticallyEndangered, estimatedPopulation: nil, protectedAreas: "Cát Tiên NP, Pù Mát NP, Cúc Phương NP", threats: [.illegalWildlifeTrade], imageName: "sundaPangolinImage", ARName: "sundaPangolin3D")
    
    static let edwardsPheasant = Animal(name: "Edwards's Pheasant", scientificName: "Lophura edwardsi", type: .bird, conservationStatus: .criticallyEndangered, estimatedPopulation: nil, protectedAreas: "Bạch Mã NP, Phong Điền NR", threats: [.habitatLoss, .poaching], imageName: "edwardsPheasantImage", ARName:  "edwardsPheasant3D")
    
    static let sarusCrane = Animal(name: "Sarus Crane", scientificName: "Antigone antigone", type: .bird, conservationStatus: .vulnerable, estimatedPopulation: 100, protectedAreas: "Tràm Chim NP", threats: [.wetlandDesctruction], imageName: "sarusCraneImage", ARName: "sarusCrane3D")
    
    static let whiteShoulderedIbis = Animal(name: "White-shouldered Ibis", scientificName: "Pseudibis davisoni", type: .bird, conservationStatus: .criticallyEndangered, estimatedPopulation: 50, protectedAreas: "Tràm Chim NP, U Minh Thượng NP", threats: [.habitatDestruction], imageName: "whiteShoulderedIbisImage", ARName: "whiteShoulderedIbis3D")
    
    static let siameseCrocodile = Animal(name: "Siamese Crocodile", scientificName: "Crocodylus siamensis", type: .reptile, conservationStatus: .criticallyEndangered, estimatedPopulation: 50, protectedAreas: "Cát Tiên NP, U Minh Thượng NP", threats: [.habitatDestruction, .farming, .poachingForLeatherTrade], imageName: "siameseCrocodileImage", ARName: "siameseCrocodile3D")
    
    static let vietnameseLeafTurtle = Animal(name: "Vietnamese Leaf Turtle", scientificName: "Geoemyda spengleri", type: .reptile, conservationStatus: .endangered, estimatedPopulation: nil, protectedAreas: "Cúc Phương NP, Bạch Mã NP", threats: [.illegalPetTrade, .habitatLoss], imageName: "vietnameseLeafTurtleImage", ARName: "vietnameseLeafTurtle3D")
    
    static let annamChorusFrog = Animal(name: "Annam Chorus Frog", scientificName: "Microhyla annamensis", type: .amphibian, conservationStatus: .endangered, estimatedPopulation: nil, protectedAreas: "Bạch Mã NP, Phong Nha-Kẻ Bàng NP", threats: [.deforestation, .waterPollution], imageName: "annamChorusFrogImage", ARName: "annamChorusFrog3D")
    
    static let animals: [Animal] = [saola, indochineseTiger, asianElephant, delacoursLangur, redShankedDoucLangur, tonkinSnubNosedMonkey, sundaPangolin, edwardsPheasant, sarusCrane, whiteShoulderedIbis, siameseCrocodile, vietnameseLeafTurtle, annamChorusFrog]
    
    
    
    
    
    
    // MARK: Parks
    static let parks: [Park] = [
        Park(name: "Cát Tiên National Park", region: "Southern Vietnam", keyEndangeredSpecies: [], importance: "Largest lowland tropical forest in Vietnam, UNESCO Biosphere Reserve", coordinates: CLLocationCoordinate2D(latitude: 11.419, longitude: 107.426), imageName: "catTienImage"),
        Park(name: "Phong Nha-Kẻ Bàng National Park", region: "North Central Vietnam", keyEndangeredSpecies: [saola, redShankedDoucLangur], importance: "UNESCO World Heritage Site, houses Vietnam’s largest cave system", coordinates: CLLocationCoordinate2D(latitude: 17.533, longitude: 106.15), imageName: "phongNhaKeBangImage"),
        Park(name: "Bạch Mã National Park", region: "Central Vietnam", keyEndangeredSpecies: [edwardsPheasant, redShankedDoucLangur], importance: "Protects Annamite Mountain biodiversity corridor", coordinates: CLLocationCoordinate2D(latitude: 16.25, longitude: 107.833), imageName: "bachMaImage"),
        Park(name: "Cúc Phương National Park", region: "Northern Vietnam", keyEndangeredSpecies: [delacoursLangur, vietnameseLeafTurtle], importance: "Vietnam’s first national park, crucial for primate conservation", coordinates: CLLocationCoordinate2D(latitude: 20.24, longitude: 105.61), imageName: "cucPhuongImage"),
        Park(name: "Yok Đôn National Park", region: "Central Highlands", keyEndangeredSpecies: [asianElephant, indochineseTiger], importance: "Largest national park in Vietnam, key for elephant conservation", coordinates: CLLocationCoordinate2D(latitude: 12.829, longitude: 107.691), imageName: "yokDonImage"),
        Park(name: "Vũ Quang National Park", region: "North Central Vietnam", keyEndangeredSpecies: [saola], importance: "Discovery site of the Saola (\"Asian Unicorn\"), one of the world’s rarest mammals", coordinates: CLLocationCoordinate2D(latitude: 18.315, longitude: 105.445), imageName: "vuQuangImage"),
        Park(name: "Pù Mát National Park", region: "North Central Vietnam", keyEndangeredSpecies: [saola, indochineseTiger, asianElephant, asianElephant], importance: "Largest intact forest in northern Annamite Range", coordinates: CLLocationCoordinate2D(latitude: 19.05, longitude: 104.9), imageName: "puMatImage"),
        Park(name: "Sơn Trà Nature Reserve", region: "Central Vietnam", keyEndangeredSpecies: [redShankedDoucLangur], importance: "Home to the world’s largest population of this rare primate", coordinates: CLLocationCoordinate2D(latitude: 16.113, longitude: 108.28), imageName: "sonTraImage"),
        Park(name: "Tràm Chim National Park", region: "Mekong Delta", keyEndangeredSpecies: [whiteShoulderedIbis], importance: "Wetland ecosystem protecting Vietnam’s last wild cranes", coordinates: CLLocationCoordinate2D(latitude: 10.695, longitude: 105.497), imageName: "tramChimImage"),
        Park(name: "U Minh Thượng National Park", region: "Mekong Delta", keyEndangeredSpecies: [siameseCrocodile], importance: "One of Southeast Asia’s last peat swamp forests", coordinates: CLLocationCoordinate2D(latitude: 9.5, longitude: 105.145), imageName: "uMinhThuongImage")
    ]
    
}
