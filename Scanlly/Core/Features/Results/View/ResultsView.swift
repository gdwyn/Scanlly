//
//  ResultsView.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI
import Vision

struct ResultsView: View {
    let image: UIImage
    @Binding var navigationPath: NavigationPath
    var recognizedText: String

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            ResultTopBar() {
                dismiss()
            }
            
            ScrollView{
                VStack(spacing: 24) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                    
                    ResultCard(
                        copyAction: {},
                        saveAction: {},
                        recognizedText: recognizedText
                    )
                }
            }
            
        }
        .padding()
    }
}

func recognizeText(image: UIImage, completion: @escaping (String) -> Void) {
    guard let cgimage = image.cgImage else { return }
    
    let handler = VNImageRequestHandler(cgImage: cgimage)
    let request = VNRecognizeTextRequest { request, error in
        guard error == nil else {
            print(error?.localizedDescription ?? "")
            completion("")
            return
        }
        
        guard let results = request.results as? [VNRecognizedTextObservation] else {
            completion("")
            return
        }
        
        let recognizedText = results.compactMap { observation in
            observation.topCandidates(1).first?.string
        }.joined(separator: " ")
        
        DispatchQueue.main.async {
            completion(recognizedText)
        }
    }
    
    request.recognitionLevel = .accurate
    
    do {
        try handler.perform([request])
    } catch {
        print("Failed to perform text recognition request: \(error.localizedDescription)")
        completion("")
    }
}

#Preview {
    ResultsView(image: UIImage(systemName: "photo")!, navigationPath: .constant(NavigationPath()), recognizedText: "")
}
