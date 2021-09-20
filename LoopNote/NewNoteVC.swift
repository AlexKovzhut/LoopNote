//
//  NewNoteVC.swift
//  LoopNote
//
//  Created by Alexander Kovzhut on 20.09.2021.
//

import UIKit

final class NewNoteVC: UIViewController {
    
    private lazy var noteTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "New note"
        textField.textColor = UIColor.systemOrange
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        
        saveButton.backgroundColor = UIColor.systemOrange
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveButton.layer.cornerRadius = 4
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        return saveButton
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        
        cancelButton.backgroundColor = UIColor.systemBlue
        cancelButton.setTitleColor(UIColor.white, for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cancelButton.layer.cornerRadius = 4
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        return cancelButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupViews([noteTextField, saveButton, cancelButton])
        setConstraints()
    }
    
    private func setupViews(_ views: [UIView]) {
        views.forEach { view.addSubview($0) }
    }
    
    private func setConstraints() {
        noteTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noteTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            noteTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            noteTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 50),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90)
        ])
    }
    
    @objc private func save() {
        dismiss(animated: true)
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
}
