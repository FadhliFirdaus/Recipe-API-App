//
//  ContentView.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel.shared
    var body: some View {
        HomeView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
