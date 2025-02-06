//
//  AnimalView.swift
//  VietnamWildlifeConservation
//
//  Created by Mỹ Nguyễn on 1/2/25.
//

import SwiftUI
import ARKit
import RealityKit
import Combine

struct AnimalView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                //image
                Image(animal.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                    
                    .clipped()
                
                //animal details
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(animal.scientificName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                HStack {
                    Text("Type: \(animal.type.rawValue)")
                    Spacer()
                    Text("Status: \(animal.conservationStatus.rawValue)")
                        .foregroundColor(animal.conservationStatus.color)
                }
                .font(.subheadline)
                .padding(.horizontal)
                
                
                if let population = animal.estimatedPopulation {
                    Text("Estimated Population: \(population)")
                        .font(.footnote)
                        .padding(.horizontal)
                }
                
                
                Text("Protected Areas: \(animal.protectedAreas)")
                    .font(.footnote)
                    .padding(.horizontal)
                
                
                if !animal.threats.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Threats:")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(animal.threats, id: \.self) { threat in
                            Text("- \(threat.readableValue)")
                                .font(.body)
                                .padding(.horizontal)
                        }
                    }
                }


                
                

                
                NavigationLink(destination: AnimalPreview(animal: animal)) {
                    Text("View \(animal.name) in AR")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}




    




struct AnimalPreview: View {
    let animal: Animal
    @State private var filename: String? = nil
    
    var body: some View {
        ZStack {
            ARAnimalViewContainer(filename: $filename)
            VStack {
                Spacer()
                Button {
                    if filename == nil {
                        filename = "cup_saucer_set.usdz"
                    } else {
                        filename = nil
                    }
                } label: {
                    Label {
                        Text("Add \(animal.name) to your space")
                    } icon: {
                        Image(systemName: "plus")
                    }
                }.buttonStyle(.bordered)
            }
        }
    }
}

struct ARAnimalViewContainer: UIViewRepresentable {
    @Binding var filename: String?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARAnimalView(frame: .zero)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let filename = filename {
            // Resetting the ARView to its initial state
            if let config = uiView.session.configuration {
                uiView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
                
                guard let modelEntity = try? Entity.loadModel(named: filename) else { return }
                let anchor = AnchorEntity(plane: .horizontal)
                anchor.addChild(modelEntity)
                uiView.scene.addAnchor(anchor)
            } else {
                uiView.scene.anchors.removeAll()
                
            }
        }
        
    }
    
    class ARAnimalView: ARView {
        private var cancellable: AnyCancellable? = nil
        
        required init(frame frameRect: CGRect) {
            super.init(frame: frameRect)
            self.setUpARView()
            //self.addAnimalToHorizontalPlane()
        }
        
        func setUpARView() {
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal]
            config.environmentTexturing = .automatic
            
            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
                config.sceneReconstruction = .mesh
            }
            
            self.session.run(config)
        }
        
        func addAnimalToHorizontalPlane() {
            guard let modelEntity = try? Entity.load(named: "cup_saucer_set.usdz", in: Bundle.main) else {
                print("Failed to load model.")
                return
            }
            let anchor = AnchorEntity(plane: .horizontal)
            anchor.addChild(modelEntity.clone(recursive: false))
            self.scene.addAnchor(anchor)
        }
        
        @MainActor @preconcurrency required dynamic init?(coder decoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
