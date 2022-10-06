//
//  ConversationTableViewController.swift
//  fastLearning
//
//  Created by Luis Gustavo Fermino Moraes on 06/10/22.
//

import UIKit

class Message: Decodable {
    
    
    let message: String
    let itsMe: Bool
    
    enum CodingKeys: String, CodingKey {
        case message = "mensagem"
        case itsMe = "souEu"
    }
}

class ConversationTableViewController: UITableViewController {
    
    var chat: Chat?
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let name = chat?.name else{ return }
        let url = URL(string: "https://us-central1-whatslol-1460f.cloudfunctions.net/\(name.lowercased())")!
        let urlRequest = URLRequest(url: url)
        
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
                do {
                    let decodeObject = try JSONDecoder().decode([Message].self, from: data ?? Data())
                    self.messages = decodeObject
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
                
            }.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MessageTableViewCell else {
            return UITableViewCell()
        }
        let message = messages[indexPath.row]
        cell.messageLabel.text = message.message
        if message.itsMe {
            cell.messageLabel.textAlignment = .right
        } else {
            cell.messageLabel.textAlignment = .left
        }
        return cell
    }
}
