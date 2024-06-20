//
//  ApiManager.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 16/06/2024.
//

import Foundation

final class ApiManager {
    
    private static let apiKey = "a67e378b6c3749bca7887525c2b4b4e7"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "everything"
    
    
    // create url path and make request
    static func getGeneralNews(completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=bbc-news&language=en" + "&apiKey=\(apiKey)"
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        session.resume()
        
    }
    
    static func getTechnologyNews(completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=ars-technica&language=en" + "&apiKey=\(apiKey)"
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        session.resume()
        
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            if let error = error {
                completion(.failure(error))
            }
        }
        
    }
    
    // handle response
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(NewsResponseObject.self, from: data)
                
                completion(.success(model.articles ))
            }
            catch let decodeError {
                completion(.failure(decodeError ))
            }
        } else {
            completion(.failure(NetworkingError.unknown ))
        }
    }
    
}
