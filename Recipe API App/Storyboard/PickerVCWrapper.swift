//
//  PickerVCWrapper.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import SwiftUI

struct PickerVCWrapper: UIViewControllerRepresentable {
    var dismiss:() -> Void
    @Environment(\.presentationMode) var presentationMode

    
    func makeUIViewController(context: Context) -> PickerVC {
        let storyboard = UIStoryboard(name: "PickerVC", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "PickerVC") as PickerVC
        controller.navigationItem.title = "Type Filter Settings"
        controller.dismissCallback = dismiss
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PickerVC, context: Context) {
        uiViewController.dismissCallback = {presentationMode.wrappedValue.dismiss()}
    }
}
