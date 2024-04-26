//
//  PickerVCWrapper.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import SwiftUI

struct PickerVCWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> PickerVC {
        let storyboard = UIStoryboard(name: "PickerVC", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "PickerVC") as PickerVC
        controller.navigationItem.title = "Type Filter Settings"
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PickerVC, context: Context) {
    }
}
