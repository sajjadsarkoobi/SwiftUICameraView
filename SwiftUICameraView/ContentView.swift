//
//  ContentView.swift
//  SwiftUICameraView
//
//  Created by Sajjad Sarkoobi on 6.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            CameraFrameView(image: viewModel.frame)
                .ignoresSafeArea()
            
            ErrorView(error: viewModel.error)
            
            filters
        }
    }
}

extension ContentView {
    var filters: some View {
        VStack {
            Spacer()
            HStack {
                ToggleButton(selected: $viewModel.comicFilter, label: "🤣")
                ToggleButton(selected: $viewModel.monoFilter, label: "🌚")
                ToggleButton(selected: $viewModel.crystalFilter, label: "🔮")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
