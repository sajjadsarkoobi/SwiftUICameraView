//
//  CombineCameraViewModel.swift
//  SwiftUICameraView
//
//  Created by Sajjad Sarkoobi on 6.01.2023.
//

import Foundation
import CoreImage
import Combine

class CombineCameraViewModel: ObservableObject {
   
    @Published var frame: CGImage?
    @Published var error: Error?
    
    private let frameManager = FrameManager.shared
    private let cameraManager = CameraManager.shared
    private var cancellable = Set<AnyCancellable>()

    var comicFilter = false
    var monoFilter = false
    var crystalFilter = false
    //Since CIContexts are expensive to create,
    //its better to have it as private to reuse the context instead of recreating it every frame.
    private let context = CIContext()
    
    init() {
        setupSubscriptions()
    }
    
    func setupSubscriptions() {
       
        //Set frames Pipline
        frameManager.$current
            .receive(on: RunLoop.main)
            .compactMap { [weak self] buffer in

                guard let image = CGImage.create(from: buffer) else {
                  return nil
                }

                var ciImage = CIImage(cgImage: image)
     
                if self?.comicFilter ?? false {
                  ciImage = ciImage.applyingFilter("CIComicEffect")
                }
                if self?.monoFilter ?? false {
                  ciImage = ciImage.applyingFilter("CIPhotoEffectNoir")
                }
                if self?.crystalFilter ?? false {
                  ciImage = ciImage.applyingFilter("CICrystallize")
                }
                
                return self?.context.createCGImage(ciImage, from: ciImage.extent)
            }
            .assign(to: &$frame)
      
        
        //Set Errors pipLine
        cameraManager.$error
            .receive(on: RunLoop.main)
            .map { $0 }
            .assign(to: &$error)
        
    }
}
