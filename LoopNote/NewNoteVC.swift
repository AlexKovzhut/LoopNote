//
//  NewNoteVC.swift
//  LoopNote
//
//  Created by Alexander Kovzhut on 20.09.2021.
//

import CoreData
import UIKit

final class NewNoteVC: UIViewController {
    
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
            noteTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            noteTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            noteTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

        saveButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

        cancelButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func save() {
        guard let text = noteTextField.text else { return }
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: viewContext) else { return }
        guard let note = NSManagedObject(entity: entityDescription, insertInto: viewContext) as? Task else { return }

        note.title = text
        
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error {
                print(error)
            }
        }
        
        dismiss(animated: true)
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
}
