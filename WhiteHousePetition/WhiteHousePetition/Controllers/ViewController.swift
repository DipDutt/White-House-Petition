//
//  ViewController.swift
//  WhiteHousePetition
//
//  Created by Dip on 14/7/25.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: - Properties.
    
    var post:[PostModel] = []
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tap to show an Alert🚨", style: .plain, target: self, action: #selector(showAlert))
        getPetitions()
    }
    
    // MARK: - This Section for DataSource.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        let posts = post[indexPath.row]
        cell.textLabel?.text = posts.title
        cell.detailTextLabel?.text = posts.body
        return cell
    }
    
    
    // MARK: - this section for Delegate.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailvc = DetailViewController()
        detailvc.detailItem = post[indexPath.row]
        navigationController?.pushViewController(detailvc, animated: true)
    }
    
    // MARK: - Create GetPetitions method to get data from api.
    
    func getPetitions() {
        let url:String
        
        if navigationController?.tabBarItem.tag == 0 {
            url = "https://jsonplaceholder.typicode.com/posts"
        }
        
        else {
             url = "https://jsonplaceholder.typicode.com/posts"
        }
        
        guard let urlString = URL(string: url) else { return }
        
        downloadData(fromURL: urlString) { data in
            if let data = data {
                guard let newPost = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.post = newPost
                    self?.tableView.reloadData()
                }
            } else {
                self.showError()
                }
            }
        }
    
     // MARK: - Create Show error method as an alert.
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "OK", style: .default))
           present(ac, animated: true)
       }
    
    
     // MARK: - Create ShowAlert as an api Value.
   @objc func showAlert() {
        let ac = UIAlertController(title: "the data comes from the We The People API of the Whitehouse.", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
    }
}

