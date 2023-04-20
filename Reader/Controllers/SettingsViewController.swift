//
//  SettingsViewController.swift
//  Reader
//
//  Created by Anton Tyurin on 16.04.2023.
//

import UIKit


protocol ActionsProtocol {
    func sliderAction(slider: Float)
    func pressButtonAction(button: UIButton)
    func segmentedControlAction(segment: UISegmentedControl)
    func switchAction(isOn: Bool)
    func pickerViewAction(font: String)
}


class SettingsViewController: UIViewController {
    
    var delegate: ActionsProtocol?
    
    var sizeSlider = UISlider()
    var buttonTextColorOriginal = UIButton()
    var buttonTextColorGray = UIButton()
    var buttonTextColorBlack = UIButton()
    var buttonTextColorBeige = UIButton()
    var fontSegmentedControl = UISegmentedControl()
    var nightModeLabel = UILabel()
    var backgroundSwitch = UISwitch()
    var fontPickerView = UIPickerView()
    
    let colorSlider = #colorLiteral(red: 1, green: 0.6919025779, blue: 0.04128493369, alpha: 1)
    var arrayTitles = [UIImage(systemName: "textformat.size.smaller"), UIImage(systemName: "textformat.size.larger")]
    var arrayName = ["Helvetica", "Palatino", "American Typewriter", "Courier New"]

    override func viewDidLoad() {
        super.viewDidLoad()

        createMethod()
    }
    
    func createMethod() {
        createSizeSlider()
        createbuttonTextColor()
        createFontSegmentedControl()
        createNightModeLabel()
        createBackgroundSwitch()
        createFontPickerView()
    }
    
    func createSizeSlider() {
        sizeSlider.frame = CGRect(x: 30, y: 20, width: 290, height: 30)
        sizeSlider.minimumTrackTintColor = colorSlider
        sizeSlider.minimumValueImage = UIImage(systemName: "textformat.size.smaller")
        sizeSlider.maximumValueImage = UIImage(systemName: "textformat.size.larger")
        sizeSlider.tintColor = colorSlider
        sizeSlider.minimumValue = 20
        sizeSlider.maximumValue = 50
        view.addSubview(sizeSlider)
        
        sizeSlider.addTarget(self, action: #selector(sizeSliderAction), for: .valueChanged)
    }
    
    func createbuttonTextColor() {
        buttonTextColorOriginal.frame = CGRect(x: 20, y: 65, width: 70, height: 50)
        buttonTextColorOriginal.setTitle("Aa", for: .normal)
        buttonTextColorOriginal.setTitleColor(.black, for: .normal)
        buttonTextColorOriginal.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
        buttonTextColorOriginal.titleLabel?.textAlignment = .left
        buttonTextColorOriginal.backgroundColor = .white
        buttonTextColorOriginal.layer.cornerRadius = 10
        buttonTextColorOriginal.tag = 1
        view.addSubview(buttonTextColorOriginal)
        
        buttonTextColorOriginal.addTarget(self, action: #selector(buttonTextColorAction), for: .touchDown)
        
        buttonTextColorGray.frame = CGRect(x: 100, y: 65, width: 70, height: 50)
        buttonTextColorGray.setTitle("Aa", for: .normal)
        buttonTextColorGray.setTitleColor(.lightGray, for: .normal)
        buttonTextColorGray.titleLabel?.font = UIFont(name: "Palatino", size: 25)
        buttonTextColorGray.titleLabel?.textAlignment = .left
        buttonTextColorGray.backgroundColor = .darkGray
        buttonTextColorGray.layer.cornerRadius = 10
        buttonTextColorGray.tag = 2
        view.addSubview(buttonTextColorGray)
        
        buttonTextColorGray.addTarget(self, action: #selector(buttonTextColorAction), for: .touchDown)
        
        buttonTextColorBlack.frame = CGRect(x: 180, y: 65, width: 70, height: 50)
        buttonTextColorBlack.setTitle("Aa", for: .normal)
        buttonTextColorBlack.setTitleColor(.white, for: .normal)
        buttonTextColorBlack.titleLabel?.font = UIFont(name: "American Typewriter", size: 25)
        buttonTextColorBlack.titleLabel?.textAlignment = .left
        buttonTextColorBlack.backgroundColor = .black
        buttonTextColorBlack.layer.cornerRadius = 10
        buttonTextColorBlack.tag = 3
        view.addSubview(buttonTextColorBlack)
        
        buttonTextColorBlack.addTarget(self, action: #selector(buttonTextColorAction), for: .touchDown)
        
        buttonTextColorBeige.frame = CGRect(x: 260, y: 65, width: 70, height: 50)
        buttonTextColorBeige.setTitle("Aa", for: .normal)
        buttonTextColorBeige.setTitleColor(.black, for: .normal)
        buttonTextColorBeige.titleLabel?.font = UIFont(name: "Courier New", size: 25)
        buttonTextColorBeige.titleLabel?.textAlignment = .left
        buttonTextColorBeige.backgroundColor = colorSlider
        buttonTextColorBeige.layer.cornerRadius = 10
        buttonTextColorBeige.tag = 4
        view.addSubview(buttonTextColorBeige)
        
        buttonTextColorBeige.addTarget(self, action: #selector(buttonTextColorAction), for: .touchDown)
    }
    
    func createFontSegmentedControl() {
        fontSegmentedControl = UISegmentedControl(items: arrayTitles as [Any])
        fontSegmentedControl.frame = CGRect(x: 20, y: 130, width: 150, height: 30)
        fontSegmentedControl.selectedSegmentIndex = 0
        view.addSubview(fontSegmentedControl)
        
        fontSegmentedControl.addTarget(self, action: #selector(fontSegmentedControlAction), for: .valueChanged)
    }
    
    func createNightModeLabel() {
        nightModeLabel.frame = CGRect(x: 180, y: 130, width: 100, height: 30)
        nightModeLabel.text = "Night mode:"
        view.addSubview(nightModeLabel)
    }
    
    func createBackgroundSwitch() {
        backgroundSwitch.frame = CGRect(x: 280, y: 130, width: 50, height: 30)
        backgroundSwitch.isOn = false
        backgroundSwitch.onTintColor = .white
        backgroundSwitch.backgroundColor = .darkGray
        backgroundSwitch.layer.cornerRadius = 16
        backgroundSwitch.thumbTintColor = colorSlider
        view.addSubview(backgroundSwitch)
        
        backgroundSwitch.addTarget(self, action: #selector(backgroundSwitchAction), for: .valueChanged)
    }
    
    func createFontPickerView() {
        fontPickerView.frame = CGRect(x: 15, y: 165, width: 320, height: 80)
        fontPickerView.delegate = self
        fontPickerView.dataSource = self
        view.addSubview(fontPickerView)
    }
    
    @objc func sizeSliderAction(_ sender: UISlider) {
        delegate?.sliderAction(slider: sender.value)
    }
    
    @objc func buttonTextColorAction(_ sender: UIButton) {
        
        if sender.tag == 1 {
            buttonTextColorOriginal.layer.borderWidth = 2
            buttonTextColorOriginal.layer.borderColor = UIColor.black.cgColor
            sizeSlider.value = 20
        } else {
            buttonTextColorOriginal.layer.borderWidth = 0
        }
        
        if sender.tag == 2 {
            buttonTextColorGray.layer.borderWidth = 2
            buttonTextColorGray.layer.borderColor = UIColor.white.cgColor
            sizeSlider.value = 20
        } else {
            buttonTextColorGray.layer.borderWidth = 0
        }
        
        if sender.tag == 3 {
            buttonTextColorBlack.layer.borderWidth = 2
            buttonTextColorBlack.layer.borderColor = UIColor.white.cgColor
            sizeSlider.value = 20
        } else {
            buttonTextColorBlack.layer.borderWidth = 0
        }
        
        if sender.tag == 4 {
            buttonTextColorBeige.layer.borderWidth = 2
            buttonTextColorBeige.layer.borderColor = UIColor.black.cgColor
            sizeSlider.value = 20
        } else {
            buttonTextColorBeige.layer.borderWidth = 0
        }
        
        delegate?.pressButtonAction(button: sender)
    }
    
    @objc func fontSegmentedControlAction(_ sender: UISegmentedControl) {
        delegate?.segmentedControlAction(segment: sender)
    }
    
    @objc func backgroundSwitchAction(_ sender: UISwitch) {
        delegate?.switchAction(isOn: sender.isOn)
    }
    

}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            if arrayName[row] == arrayName[0] {
                delegate?.pickerViewAction(font: arrayName[0])
            } else if arrayName[row] == arrayName[1] {
                delegate?.pickerViewAction(font: arrayName[1])
            } else if arrayName[row] == arrayName[2] {
                delegate?.pickerViewAction(font: arrayName[2])
            } else if arrayName[row] == arrayName[3] {
                delegate?.pickerViewAction(font: arrayName[3])
            }
    }
    
}


