//
//  PickerVC.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation
import UIKit
import SwiftUI

class PickerVC:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.recipeTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.recipeTypes[row]
    }
    
    @IBAction func filterButton(_ sender: Any) {
        print("hi")
    }
    @IBOutlet weak var typePicker: UIPickerView!
    
    
    @ObservedObject var viewModel = ViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        _ = self.view
        setupPicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupPicker(){
        self.typePicker.delegate = self
        self.typePicker.dataSource = self
    }
}
