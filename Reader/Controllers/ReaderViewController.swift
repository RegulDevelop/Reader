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
    let popOverButton = UIButton()
    
    let colorGray = #colorLiteral(red: 0.9012193084, green: 0.9012193084, blue: 0.9012193084, alpha: 1)
    let colorYellow = #colorLiteral(red: 1, green: 0.6919025779, blue: 0.04128493369, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        createMethod()
    }
    
    func createMethod() {
        
        createNameBookLabel()
        createCloseButton()
        createMyTextView()
        createPageLabel()
        createPopOverButton()
        
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
    
    func createMyTextView() {
        
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
    
    func createPopOverButton() {
        
        popOverButton.frame = CGRect(x: 325, y: 795, width: 28, height: 28)
        popOverButton.setImage(UIImage(systemName: "textformat.size"), for: .normal)
        popOverButton.tintColor = .gray
        popOverButton.backgroundColor = colorGray
        popOverButton.layer.cornerRadius = 5
        view.addSubview(popOverButton)
        
        popOverButton.addTarget(self, action: #selector(popOverButtonAction), for: .touchDown)
        
    }
    
    @objc func popOverButtonAction() {
        
        let popOverViewController = SettingsViewController()
        popOverViewController.modalPresentationStyle = .popover
        popOverViewController.preferredContentSize = CGSize(width: 350 , height: 250)
        popOverViewController.delegate = self

        guard let presentationVC = popOverViewController.popoverPresentationController else { return }
        
        presentationVC.sourceView = popOverButton
        presentationVC.permittedArrowDirections = .down
        presentationVC.sourceRect = CGRect(x: popOverButton.bounds.midX, y: popOverButton.bounds.minY - 5, width: 0, height: 0)
        presentationVC.delegate = self

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
            myTextView.backgroundColor = colorYellow
            myTextView.font = UIFont(name: "Courier New", size: 20)
            view.backgroundColor = colorYellow
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
        
        myTextView.font = UIFont(name: font, size: 20)
        
    }
}



    

