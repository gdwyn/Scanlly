import SwiftUI

struct ResultCard: View {
    var copyAction: () -> Void
    var translateAction: () -> Void
    var recognizedText: String
    
    @State private var copied: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 18) {
                
                
                if recognizedText.isEmpty {
                    VStack(spacing: 14) {
                        Image("empty")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 84)

                        Text("No text detected")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)

                } else {
                    HStack(spacing: 18) {
                        Text("English")
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Button {
                            copyAction()
                            copied.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                copied.toggle()
                            }
                        } label: {
                            ZStack {
                                Text("Copy")
                                    .opacity(!copied ? 1 : 0)
                                
                                Text("Copied!")
                                    .scaleEffect(copied ? 1 : 0)
                                    .opacity(copied ? 1 : 0)
                            }
                            .foregroundStyle(.dark)
                            .font(.callout)
                        }
                        
                        Button {
                            translateAction()
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: "globe")
                                Text("Translate")
                                    .font(.callout)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .foregroundStyle(.white)
                        .background(.dark)
                        .clipShape(Capsule())
                    }
                                        
                    Text(recognizedText)
                }
                
            }
            .padding()
            
            
        }
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.02))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )

    }
}

#Preview {
    ResultCard(copyAction: {}, translateAction: {}, recognizedText: "Some transcribtion")
}
