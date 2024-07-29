import SwiftUI

struct HomeView: View {
    @State private var showButtons = false
    @State private var image: UIImage?
    @State private var isLoading = false
    @State private var recognizedText: String = ""
    
    @State private var showResults = false
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $navigationPath) {
            VStack {
                Image("scanlly")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48)
                
                Spacer()
                
                Empty()
                
                Spacer()
                
                VStack(spacing: -24) {
                    
                    VStack(spacing: 12) {
                        NavigationLink(value: Destination.camera) {
                            PhotoButton(icon: "camera", label: "Camera")
                        }
                        
                        PhotoButton(icon: "photo", label: "Gallery")
                        
                    }
                    .opacity(showButtons ? 1 : 0)
                    .scaleEffect(showButtons ? 1 : 0)
                    .offset(y: showButtons ? -40 : 0)
                    
                    ScanButton {
                        withAnimation {
                            showButtons.toggle()
                        }
                    }
                    
                }
                
            }
            .padding()
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                    case .camera:
                    CameraView(image: $image, navigationPath: $navigationPath)
                    case .home:
                        HomeView()
                    }
                }
            .onChange(of: image) {
                if let newImage = image {
                        recognizeText(image: newImage) { text in
                            recognizedText = text
                        }
                    showResults = true
                    }
                }
            .sheet(isPresented: $showResults) {
                if let image = image {
                    ResultsView(image: image, navigationPath: $navigationPath, recognizedText: recognizedText)
                        .interactiveDismissDisabled()
                }
            }
           
        }
        
    }
}

#Preview {
    HomeView()
}
