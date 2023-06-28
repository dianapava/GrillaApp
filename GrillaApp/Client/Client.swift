//
//  Client.swift
//  GrillaApp
//
//  Created by Diana Pava Avila on 22/06/23.
//

import Foundation

enum ClientError: Error {
    case notFound
}

class Client {
    
    func request(url: String,
                 headers: [String:String],
                 onSuccess: @escaping (MovieResult) -> Void, onFailure: @escaping (Error) -> Void){
        guard let url = URL(string: url) else{
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                onFailure(error)
            }
            
            guard let data = data else {
                onFailure(ClientError.notFound)
                return
            }
            
            do {
                let object = try JSONDecoder().decode(MovieResult.self, from: data)
                onSuccess(object)
            } catch {
                onFailure(error)
            }
            
        }.resume()
    }
}

struct MovieResult : Codable{
    let results: [MovieModel]
}

struct MovieModel: Codable {
    let title: String
    let original_title: String
}
