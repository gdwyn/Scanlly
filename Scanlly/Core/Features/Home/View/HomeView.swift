import SwiftUI

struct HomeView: View {
    @State private var showButtons = false
    @State private var image: UIImage?
    @State private var isLoading = false
    @State private var recognizedText = ""
    
    @State private var showCamera = false
    
    var body: some View {
        
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
                    PhotoButton(icon: "camera", label: "Camera") {
                        showCamera.toggle()
                    }

                    PhotoButton(icon: "photo", label: "Gallery") {}

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
        .sheet(isPresented: $showCamera) {
            CameraView(image: $image)
        }
        
    }
}

#Preview {
    HomeView()
}
