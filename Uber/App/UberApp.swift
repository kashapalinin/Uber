//
//  UberApp.swift
//  Uber
//
//  Created by Павел Калинин on 03.03.2024.
//

import SwiftUI

@main
struct UberApp: App {
    @StateObject var viewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
