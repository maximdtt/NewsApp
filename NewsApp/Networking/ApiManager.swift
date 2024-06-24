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
    private static let path = "top-headlines"
    
    static func getGeneralNews(completion: @escaping (Result<NewsDTO, Error>) -> Void) {
        let stringUrl = baseUrl + path + "?category=general&language=en&apiKey=\(apiKey)"
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        session.resume()
    }
    
    static func getTechnologyNews(completion: @escaping (Result<NewsDTO, Error>) -> Void) {
        let stringUrl = baseUrl + path + "?category=technology&language=en&apiKey=\(apiKey)"
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        session.resume()
    }
    
    private static func handleResponse(data: Data?, error: Error?, completion: @escaping (Result<NewsDTO, Error>) -> Void) {
           if let error = error {
               completion(.failure(NetworkingError.networkingError(error)))
               return
           }
           
           guard let data = data else {
               completion(.failure(NetworkingError.unknown))
               return
           }
           
           do {
               let model = try JSONDecoder().decode(NewsDTO.self, from: data)
               completion(.success(model))
           } catch let decodeError as DecodingError {
               // Логирование подробной ошибки декодирования, что бы понимать если не декодировалось то почему
               switch decodeError {
               case .typeMismatch(let type, let context):
                   print("Type '\(type)' mismatch:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               case .valueNotFound(let type, let context):
                   print("Value '\(type)' not found:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               case .keyNotFound(let key, let context):
                   print("Key '\(key)' not found:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               case .dataCorrupted(let context):
                   print("Data corrupted:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               @unknown default:
                   print("Unknown decoding error")
               }
               completion(.failure(decodeError))
           } catch {
               completion(.failure(error))
           }
       }
}
