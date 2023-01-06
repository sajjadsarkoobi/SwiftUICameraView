//
//  CameraFrameView.swift
//  SwiftUICameraView
//
//  Created by Sajjad Sarkoobi on 6.01.2023.
//

import Foundation
import SwiftUI

struct CameraFrameView: View {
    
    ///This is the image that will updates when ever
    ///a new frame comes from camera preview buffer
    var image: CGImage?
    
    ///The label associated with the image. SwiftUI uses the label for accessibility.
    private let label = Text("Camera feed")
    
    var body: some View {
        ZStack {
            
            ///If we are using the front camera we have to use .upMirrored for orientation
            if let image = image {
                GeometryReader { geo in
                    Image(image, scale: 1.0, orientation: .up, label: label)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width,
                               height: geo.size.height,
                               alignment: .center)
                        .clipped()
                }
            } else {
                Color.black
                ProgressView {
                    Text("Camera Loading")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .progressViewStyle(.circular)
                .tint(.white)
                
            }
        }
    }
}


struct CameraFrameView_preview: PreviewProvider {
    static var previews: some View {
        CameraFrameView()
    }
}
