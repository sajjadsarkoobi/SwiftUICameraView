//
//  ContentView.swift
//  SwiftUICameraView
//
//  Created by Sajjad Sarkoobi on 6.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    enum Path {
        case combine
        case avPreview
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
             
                NavigationLink(value: Path.combine) {
                    Text("Combine Camera View")
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink(value: Path.avPreview) {
                    Text("AVPreview Camera View")
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("SwiftUI Camera View")
            .navigationDestination(for: Path.self) { path in
                switch path {
                case .combine:
                    CombineCameraView()
                        .navigationTitle("Combine mode")
                    
                case .avPreview:
                    AVCameraView()
                        .navigationTitle("AVPreview mode")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
