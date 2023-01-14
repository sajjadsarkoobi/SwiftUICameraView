//
//  AVCameraView.swift
//  SwiftUICameraView
//
//  Created by Sajjad Sarkoobi on 14.01.2023.
//

import SwiftUI

struct AVCameraView: View {
    var body: some View {
        ZStack {
            CameraPreviewHolder(captureSession: CameraManager.shared.session)
                .ignoresSafeArea()
        }
        .onAppear {
            CameraManager.shared.controllSession(start: true)
        }
        .onDisappear {
            CameraManager.shared.controllSession(start: false)
        }
    }
}

struct AVCameraView_Previews: PreviewProvider {
    static var previews: some View {
        AVCameraView()
    }
}
