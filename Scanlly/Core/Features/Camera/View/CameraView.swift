import Foundation
import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
        viewController.sourceType = .camera
        viewController.cameraDevice = .rear
        //viewController.cameraOverlayView = .none
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> CameraView.Coordinator {
        return Coordinator(parent: self)
    }
}

extension CameraView {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
        func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
            let widthRatio = targetSize.width / image.size.width
            let heightRatio = targetSize.height / image.size.height
            let scaleFactor = min(widthRatio, heightRatio)
            
            let newSize = CGSize(width: image.size.width * scaleFactor, height: image.size.height * scaleFactor)
            let renderer = UIGraphicsImageRenderer(size: newSize)
            
            return renderer.image { _ in
                image.draw(in: CGRect(origin: .zero, size: newSize))
            }
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                print("Image taken")
                print("Width: " + image.size.width.description)
                print("Height: " + image.size.height.description)
                
                if (image.size.width > image.size.height) {
                    self.parent.image = image.imageResized(to: CGSize(width: 3000, height: 2250))
                } else {
                    self.parent.image = image.imageResized(to: CGSize(width: 3000, height: 2250))
                }
            }
        }
        
    }
}
    
extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
