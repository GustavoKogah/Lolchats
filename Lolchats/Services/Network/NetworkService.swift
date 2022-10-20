//
//  Network.swift
//  Lolchats
//
//  Created by Luis Gustavo Fermino Moraes on 19/10/22.
//

import Foundation

class NetworkService {
    
    static func performRequest<X: Decodable>(url: URL,
                                             responseModel: X.Type,
                                             onSuccess: @escaping (X) -> Void,
                                             onFailure: @escaping (Error) -> ()
    ){
        let urlRequest = URLRequest(url: url)
        
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
                do {
                    let decodeObject = try JSONDecoder().decode(X.self, from: data ?? Data())
                    DispatchQueue.main.async {
                        onSuccess(decodeObject)
                    }
                } catch {
                    onFailure(error)
                }
                
            }.resume()
    }
}
