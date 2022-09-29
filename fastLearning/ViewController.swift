//
//  ViewController.swift
//  fastLearning
//
//  Created by Luis Gustavo Fermino Moraes on 28/09/22.
//

import UIKit


class Conversa {
    let nomeDaPessoa : String
    let ultimaMensagem : String
    
    init(nomeDaPessoa: String, ultimaMensagem: String){
        self.nomeDaPessoa = nomeDaPessoa
        self.ultimaMensagem = ultimaMensagem
    }
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var conversas: [Conversa] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let conversa1 = Conversa(nomeDaPessoa: "Kogah", ultimaMensagem: "Testando o App")
        let conversa2 = Conversa(nomeDaPessoa: "Helio", ultimaMensagem: "Vai dar bom")
        let conversa3 = Conversa(nomeDaPessoa: "Zampo", ultimaMensagem: "Deu pau o PJ")
        let conversa4 = Conversa(nomeDaPessoa: "Vivi", ultimaMensagem: "Bom dia time")
        let conversa5 = Conversa(nomeDaPessoa: "Natan", ultimaMensagem: "Não entendi")
        let conversa6 = Conversa(nomeDaPessoa: "Fernandão", ultimaMensagem: "Bora fazer")
        let conversa7 = Conversa(nomeDaPessoa: "Timem Implmentação", ultimaMensagem: "Não vai dar pra subir")
        let conversa8 = Conversa(nomeDaPessoa: "GSI", ultimaMensagem: "Temos um incidente para vocês")
        let conversa9 = Conversa(nomeDaPessoa: "Caio", ultimaMensagem: "E o Firebase? ")
        
        conversas.append(conversa1)
        conversas.append(conversa2)
        conversas.append(conversa3)
        conversas.append(conversa4)
        conversas.append(conversa5)
        conversas.append(conversa6)
        conversas.append(conversa7)
        conversas.append(conversa8)
        conversas.append(conversa9)
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "whatsappCell", for: indexPath) as! WhatsAppCellTableViewCell
        cell.titleLabel.text = conversas[indexPath.row].nomeDaPessoa
        cell.subtitleLabel.text = conversas[indexPath.row].ultimaMensagem
        return cell
    }

}

