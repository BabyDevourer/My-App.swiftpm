//
//  Animal.swift
//  VietnamWildlifeConservation
//
import SwiftUI

enum AnimalType {
    case mammal
    case bird
    case reptile
    case amphibian
}

extension AnimalType {
    var rawValue: String {
        switch self {
        case .mammal: return "Mammal"
        case .bird: return "Bird"
        case .reptile: return "Reptile"
        case .amphibian: return "Amphibian"
        }
    }
}

enum ConservationStatus {
    case extinct
    case extinctInTheWild
    case criticallyEndangered
    case endangered
    case vulnerable
}
//chatgpt
extension ConservationStatus {
    var rawValue: String {
        switch self {
        case .extinct: return "Extinct"
        case .extinctInTheWild: return "Extinct in the Wild"
        case .criticallyEndangered: return "Critically Endangered"
        case .endangered: return "Endangered"
        case .vulnerable: return "Vulnerable"
        }
    }
    var color: Color {
        switch self {
        case .extinct: return .gray
        case .extinctInTheWild: return .gray
        case .criticallyEndangered: return .red
        case .endangered: return .orange
        case .vulnerable: return .yellow
        }
    }
}
enum AnimalThreat {
    case poaching
    case habitatDestruction
    case deforestation
    case habitatLoss
    case humanWildlifeConflict
    case hunting
    case illegalPetTrade
    case illegalWildlifeTrade
    case wetlandDesctruction
    case farming
    case poachingForLeatherTrade
    case waterPollution
}

extension AnimalThreat {
    var readableValue: String {
        switch self {
        case .poaching: return "Poaching"
        case .habitatDestruction: return "Habitat Destruction"
        case .deforestation: return "Deforestation"
        case .habitatLoss: return "Habitat Loss"
        case .humanWildlifeConflict: return "Human-Wildlife Conflict"
        case .hunting: return "Hunting"
        case .illegalPetTrade: return "Illegal Pet Trade"
        case .illegalWildlifeTrade: return "Illegal Wildlife Trade"
        case .wetlandDesctruction: return "Wetland Destruction"
        case .farming: return "Farming"
        case .poachingForLeatherTrade: return "Poaching for Leather Trade"
        case .waterPollution: return "Water Pollution"
        }
    }
}

struct Animal: Identifiable {
    var id: String {
        return name
    }
    
    // MARK: - Properties
    let name: String
    let scientificName: String
    let type: AnimalType
    let conservationStatus: ConservationStatus
    let estimatedPopulation: Int?
    let protectedAreas: String
    let threats: [AnimalThreat]
    let imageName : String
    let ARName : String
}
