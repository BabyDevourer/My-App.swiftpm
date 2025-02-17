//
//  AnimalView.swift
//  VietnamWildlifeConservation
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
                        filename = "\(animal.ARName).usdz"
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
        return ARAnimalView(frame: .zero, filename: filename ?? "default_model.usdz")
    }
    func updateUIView(_ uiView: ARView, context: Context) {
        guard let filename = filename else {
            uiView.scene.anchors.removeAll() // Clear AR scene if filename is nil
            return
        }

        // Remove all existing anchors to prevent duplicates
        uiView.scene.anchors.removeAll()

        // Reset the AR session
        if let config = uiView.session.configuration {
            uiView.session.run(config, options: [.resetTracking, .removeExistingAnchors])

            // Load and add the new model
            guard let modelEntity = try? Entity.load(named: filename, in: Bundle.main) else {
                print("Failed to load model: \(filename)")
                return
            }
            let anchor = AnchorEntity(plane: .horizontal)
            anchor.addChild(modelEntity)
            uiView.scene.addAnchor(anchor)
        }
    }
    
    class ARAnimalView: ARView {
        private var cancellable: AnyCancellable? = nil
        private var filename: String?
        
        required init(frame frameRect: CGRect, filename: String?) {
                self.filename = filename
                super.init(frame: frameRect)
                self.setUpARView()
                self.loadModel()
            //self.addAnimalToHorizontalPlane()
            }
        
        func setFilename(_ newFilename: String?) {
                guard let newFilename = newFilename else { return }
                self.filename = newFilename
                self.loadModel()
            }
        private func loadModel() {
               guard let filename = filename else {
                   print("Filename is nil. Cannot load model.")
                   return
               }

               guard let modelEntity = try? Entity.load(named: filename, in: Bundle.main) else {
                   print("Failed to load model: \(filename)")
                   return
               }

               self.scene.anchors.removeAll()
               let anchor = AnchorEntity(plane: .horizontal)
               anchor.addChild(modelEntity)
               self.scene.addAnchor(anchor)
            
                
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
            guard let filename = filename else {
                print("Filename is nil. Cannot load model.")
                return
            }

            guard let modelEntity = try? Entity.load(named: filename, in: Bundle.main) else {
                print("Failed to load model: \(filename)")
                return
            }

            let anchor = AnchorEntity(plane: .horizontal)
            anchor.addChild(modelEntity.clone(recursive: false))
            self.scene.addAnchor(anchor)
        }
        

            required init(frame frameRect: CGRect) {
                super.init(frame: frameRect)
                self.setUpARView()
            }

            required init?(coder decoder: NSCoder) {
                super.init(coder: decoder)
            }
        }
}
