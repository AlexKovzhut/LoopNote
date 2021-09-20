//
//  NotesListVC.swift
//  LoopNote
//
//  Created by Alexander Kovzhut on 19.09.2021.
//

import UIKit

final class NotesListVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Notes List"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationBarAppereance = UINavigationBarAppearance()
        
        //Navigation Bar Appereance
        navigationBarAppereance.configureWithOpaqueBackground()
        navigationBarAppereance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppereance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppereance.backgroundColor = UIColor.systemOrange
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppereance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppereance
        
        // Add button
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewNote)
        )
        
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @objc private func addNewNote() {
        let newNoteVC = NewNoteVC()
        present(newNoteVC, animated: true)
    }


}
