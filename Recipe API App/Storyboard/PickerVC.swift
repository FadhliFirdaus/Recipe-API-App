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
    @ObservedObject var viewModel = ViewModel.shared
    var presentationMode: PresentationMode?
    var dismissCallback: (() -> Void)?


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataSourceType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataSourceType.allCases[row].description
    }

    @IBAction func filterButton(_ sender: Any) {
        if let selectedRow = typePicker?.selectedRow(inComponent: 0) {
            let selectedString = DataSourceType.allCases[selectedRow].description
            if let selectedType = DataSourceType.fromString(selectedString) {
                viewModel.changeDatasourceSettings(to: selectedType)
            }
        }
        viewModel.fetchDataWithCurrentSetting()
        self.dismissCallback?()
    }
    
    @IBOutlet weak var typePicker: UIPickerView!
    
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
