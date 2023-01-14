//
//  AVVideoPlayerView.swift
//  SwiftUICameraView
//
//  Created by Sajjad Sarkoobi on 14.01.2023.
//

import SwiftUI
import AVKit

class CameraPreviewView: UIView {
    private var captureSession: AVCaptureSession
    
    init(session: AVCaptureSession) {
        self.captureSession = session
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if nil != self.superview {
            self.videoPreviewLayer.session = self.captureSession
            self.videoPreviewLayer.videoGravity = .resizeAspectFill
            //Setting the videoOrientation if needed
            //self.videoPreviewLayer.connection?.videoOrientation = .landscapeRight
        } else {
            self.videoPreviewLayer.session = nil
            self.videoPreviewLayer.removeFromSuperlayer()
        }
    }
}

struct CameraPreviewHolder: UIViewRepresentable {
    var captureSession: AVCaptureSession
    
    func makeUIView(context: UIViewRepresentableContext<CameraPreviewHolder>) -> CameraPreviewView {
        CameraPreviewView(session: captureSession)
    }
    
    func updateUIView(_ uiView: CameraPreviewView, context: UIViewRepresentableContext<CameraPreviewHolder>) {
    }
    
    typealias UIViewType = CameraPreviewView
}
