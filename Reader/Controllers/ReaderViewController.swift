//
//  ReaderViewController.swift
//  Reader
//
//  Created by Anton Tyurin on 16.04.2023.
//

import UIKit

class ReaderViewController: UIViewController {
    
    let nameBookLabel = UILabel()
    let closeButton = UIButton()
    let myTextView = UITextView()
    let pageLabel = UILabel()
    let settingsButton = UIButton()
    
    let colorGray = #colorLiteral(red: 0.9012193084, green: 0.9012193084, blue: 0.9012193084, alpha: 1)
    let colorSlider = #colorLiteral(red: 1, green: 0.6919025779, blue: 0.04128493369, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        createMethod()

    }
    
    func createMethod() {
        createNameBookLabel()
        createCloseButton()
        creatMyTextView()
        createPageLabel()
        createSettingsButton()
    }
    
    func createNameBookLabel() {
        nameBookLabel.frame = CGRect(x: 45, y: 65, width: 300, height: 30)
        nameBookLabel.font = UIFont.systemFont(ofSize: 15)
        nameBookLabel.textColor = .gray
        nameBookLabel.textAlignment = .center
        view.addSubview(nameBookLabel)
    }
    
    func createCloseButton() {
        closeButton.frame = CGRect(x: 330, y: 67, width: 24, height: 24)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .gray
        closeButton.backgroundColor = colorGray
        closeButton.layer.cornerRadius = 12
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchDown)
    }
    
    func creatMyTextView() {
        myTextView.frame = CGRect(x: 25, y: 100, width: 345, height: 670)
        myTextView.font = UIFont.systemFont(ofSize: 20)
        myTextView.isEditable = false
        view.addSubview(myTextView)
    }
    
    func createPageLabel() {
        pageLabel.frame = CGRect(x: 150, y: 795, width: 100, height: 30)
        pageLabel.textColor = .gray
        pageLabel.font = UIFont.systemFont(ofSize: 15)
        pageLabel.textAlignment = .center
        view.addSubview(pageLabel)
    }
    
    func createSettingsButton() {
        settingsButton.frame = CGRect(x: 325, y: 795, width: 28, height: 28)
        settingsButton.setImage(UIImage(systemName: "textformat.size"), for: .normal)
        settingsButton.tintColor = .gray
        settingsButton.backgroundColor = colorGray
        settingsButton.layer.cornerRadius = 5
        view.addSubview(settingsButton)
        
        settingsButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchDown)
        
    }
    
    @objc func settingsButtonAction() {
        
        let popOverViewController = SettingsViewController()
        popOverViewController.modalPresentationStyle = .popover
        popOverViewController.preferredContentSize = CGSize(width: 350 , height: 250)
        popOverViewController.delegate = self

        guard let presentationVC = popOverViewController.popoverPresentationController else { return }
        presentationVC.delegate = self
        presentationVC.sourceView = settingsButton
        presentationVC.permittedArrowDirections = .down
        presentationVC.sourceRect = CGRect(x: settingsButton.bounds.midX, y: settingsButton.bounds.minY - 5, width: 0, height: 0)

        present(popOverViewController, animated: true)
        
    }
    
    @objc func closeButtonAction() {
        dismiss(animated: true)
    }

}

extension ReaderViewController: UIPopoverPresentationControllerDelegate {
    
    // Dlya togo chtoby popver ne otkryvalsya na ves' ekran
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

extension ReaderViewController: ActionsProtocol {
    func sliderAction(slider: Float) {
        myTextView.font = .systemFont(ofSize: CGFloat(slider))
    }
    
    func pressButtonAction(button: UIButton) {
        switch button.tag {
        case 1:
            myTextView.textColor = .black
            myTextView.backgroundColor = .white
            myTextView.font = UIFont(name: "Helvetica", size: 20)
            view.backgroundColor = .white
        case 2:
            myTextView.textColor = .lightGray
            myTextView.backgroundColor = .darkGray
            myTextView.font = UIFont(name: "Palatino", size: 20)
            view.backgroundColor = .darkGray
        case 3:
            myTextView.textColor = .white
            myTextView.backgroundColor = .black
            myTextView.font = UIFont(name: "American Typewriter", size: 20)
            view.backgroundColor = .black
        case 4:
            myTextView.textColor = .black
            myTextView.backgroundColor = colorSlider
            myTextView.font = UIFont(name: "Courier New", size: 20)
            view.backgroundColor = colorSlider
        default:
            break
        }
    }
    
    func segmentedControlAction(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            myTextView.font = UIFont(name: "Helvetica", size: 20)
        case 1:
            myTextView.font = UIFont(name: "Helvetica-Bold", size: 20)
        default:
            break
        }
    }
    
    func switchAction(isOn: Bool) {
        if isOn {
            myTextView.textColor = .white
            myTextView.backgroundColor = .black
            view.backgroundColor = .black
        } else {
            myTextView.textColor = .black
            myTextView.backgroundColor = .white
            view.backgroundColor = .white
        }
    }
    
    func pickerViewAction(font: String) {
        if font == "Helvetica" {
            myTextView.font = UIFont(name: "Helvetica", size: 20)
        } else if font == "Palatino" {
            myTextView.font = UIFont(name: "Palatino", size: 20)
        } else if font == "American Typewriter" {
            myTextView.font = UIFont(name: "American Typewriter", size: 20)
        } else if font == "Courier New" {
            myTextView.font = UIFont(name: "Courier New", size: 20)
        }
    }
}



    

