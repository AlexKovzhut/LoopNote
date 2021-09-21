//
//  NotesListVC.swift
//  LoopNote
//
//  Created by Alexander Kovzhut on 19.09.2021.
//

import CoreData
import UIKit

final class NotesListVC: UITableViewController {
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    private static let cellID = "cell"
    private var notes: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellID)
        setupNavigationBar()
        fetchData()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        title = "Notes List"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationBarAppereance = UINavigationBarAppearance()
        
        navigationBarAppereance.configureWithOpaqueBackground()
        navigationBarAppereance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppereance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppereance.backgroundColor = UIColor.systemOrange
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppereance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppereance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewNote)
        )
        
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @objc private func addNewNote() {
        let newNoteVC = NewNoteVC()
        newNoteVC.modalPresentationStyle = .fullScreen
        present(newNoteVC, animated: true)
    }

    private func fetchData() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            notes = try viewContext.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
    }
}

extension NotesListVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellID, for: indexPath)
        let note = notes[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = note.title
        
        cell.contentConfiguration = content
        
        return cell
    }
}
