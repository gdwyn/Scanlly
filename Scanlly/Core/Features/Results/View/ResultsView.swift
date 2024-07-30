import SwiftUI
import Translation
import Vision

struct ResultsView: View {
    let image: UIImage
    var recognizedText: String

    @Binding var navigationPath: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    @State private var vm = ViewModel()

    var body: some View {
            VStack(spacing: 16) {
                ResultTopBar() {
                    dismiss()
                }
                
                ScrollView(showsIndicators: false){
                    VStack(spacing: 24) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 250)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                        
                        ResultCard(
                            copyAction: {vm.copyToClipboard(text: recognizedText)},
                            translateAction: {
                                vm.showTranslation = true
                            },
                            recognizedText: recognizedText
                        )
                        
                        if #available(iOS 17.4, *) {

                        Text("")
                                .translationPresentation(isPresented: $vm.showTranslation, text: recognizedText)
                        } else {
                            Text("")
                            .sheet(isPresented: $vm.showTranslation) {
                                Text("Update your ios version to use translation")
                            }
                        }

                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.top)
    
    }
}

#Preview {
    ResultsView(image: UIImage(systemName: "photo")!, recognizedText: "", navigationPath: .constant(NavigationPath()))
}
