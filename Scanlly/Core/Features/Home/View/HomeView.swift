import SwiftUI
import PhotosUI

struct HomeView: View {
    
    @State private var vm = ViewModel()

    var body: some View {
        NavigationStack(path: $vm.navigationPath) {
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
                        NavigationLink(value: Routes.camera) {
                            PhotoButton(icon: "camera", label: "Camera")
                        }
                        
                        PhotosPicker(
                            selection: $vm.selectedItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                                PhotoButton(icon: "photo", label: "Gallery")
                                
                            }
                            .onChange(of: vm.selectedItem) { vm.pickPhotos() }
                    }
                    .opacity(vm.showButtons ? 1 : 0)
                    .scaleEffect(vm.showButtons ? 1 : 0)
                    .offset(y: vm.showButtons ? -40 : 0)
                    
                    ScanButton {
                        withAnimation {
                            vm.showButtons.toggle()
                        }
                    }
                    
                }
                    
                }
                .padding()
                .navigationDestination(for: Routes.self) { destination in
                    switch destination {
                    case .camera:
                        CameraView(image: $vm.image, navigationPath: $vm.navigationPath)
                    case .home:
                        HomeView()
                    }
                }
                .onChange(of: vm.image) {
                    if let newImage = vm.image {
                        vm.recognizeText(image: newImage) { text in
                            vm.recognizedText = text
                        }
                        vm.showResults = true
                    }
                }
                .sheet(isPresented: $vm.showResults) {
                    if let image = vm.image {
                        ResultsView(image: image, recognizedText: vm.recognizedText, navigationPath: $vm.navigationPath)
                            .interactiveDismissDisabled()
                    }
                }
                
            }
            
        }
    }

#Preview {
    HomeView()
}
