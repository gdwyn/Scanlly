import Foundation
import UIKit
import SwiftUI

struct CameraImpl: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    typealias UIViewControllerType = UIImagePickerController
    
    @Binding var navigationPath: NavigationPath
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
                
        // check if the device has a camera and supports the desired source type
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            viewController.sourceType = .camera
            
            // check if the device supports the rear camera
            if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                viewController.cameraDevice = .rear
            } else if UIImagePickerController.isCameraDeviceAvailable(.front) {
                viewController.cameraDevice = .front
            }
            
            // check if the device supports other camera settings (e.g., flash)
            if UIImagePickerController.isFlashAvailable(for: .rear) {
                viewController.cameraFlashMode = .off
            }
        } else {
            // fall back to photo library if the camera is not available
            viewController.sourceType = .photoLibrary
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> CameraImpl.Coordinator {
        return Coordinator(parent: self)
    }
}

extension CameraImpl {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraImpl
        
        init(parent: CameraImpl) {
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            //picker.dismiss(animated: true, completion: nil)
            picker.dismiss(animated: true) {
                self.parent.navigationPath = NavigationPath()
            }
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
                
                parent.image = image
                picker.dismiss(animated: true) {
                    // Update navigation path after the picker is dismissed
                    self.parent.navigationPath = NavigationPath()
                }
            } else {
                picker.dismiss(animated: true)
            }

//                if (image.size.width > image.size.height) {
//                    self.parent.image = image.imageResized(to: CGSize(width: 3000, height: 2250))
//                } else {
//                    self.parent.image = image.imageResized(to: CGSize(width: 3000, height: 2250))
//                }
        
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
