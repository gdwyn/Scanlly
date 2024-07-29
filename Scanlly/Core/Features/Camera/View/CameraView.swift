//
//  PhotoView.swift
//  Scanlly
//
//  Created by Godwin IE on 29/07/2024.
//

import SwiftUI

struct CameraView: View {
    @Binding var image: UIImage?
    @Binding var navigationPath: NavigationPath

    var body: some View {
        CameraImpl(image: $image, navigationPath: $navigationPath)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
}

#Preview {
    CameraView(image: .constant(nil), navigationPath: .constant(NavigationPath()))
}
