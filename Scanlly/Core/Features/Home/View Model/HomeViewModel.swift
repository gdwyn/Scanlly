import Foundation
import SwiftUI
import PhotosUI
import Vision

extension HomeView {
    @Observable
    class ViewModel {
        var showButtons = false
        var image: UIImage?
        var selectedItem: PhotosPickerItem? = nil
        var selectedImage: UIImage? = nil
        var showResults = false
        var recognizedText: String = ""
        var navigationPath = NavigationPath()
        
        // pick photos
        func pickPhotos() {
            Task {
                // Retrieve selected asset in the form of Data
                if let selectedItem = selectedItem {
                    do {
                        // Retrieve selected asset
                        let data = try await selectedItem.loadTransferable(type: Data.self)
                        if let data = data {
                            selectedImage = UIImage(data: data)
                            image = selectedImage
                        }
                    } catch {
                        print("Failed to load selected image data: \(error.localizedDescription)")
                    }
                }
            }
        }
        
        // recog text
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
                }.joined(separator: "\n")
                
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
        
    }
}
