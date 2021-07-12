//
//  NetworkManager.swift
//  Pryaniky
//
//  Created by Яна Латышева on 11.07.2021.
//

import Foundation

struct NetworkManager {

    // MARK: - Properties

    static let shared = NetworkManager()
    private init() {}


    // MARK: - Methods

    func downloadJsonData(completionHandler: @escaping (Result<JsonData, NetworkError>) -> Void) {

        let task = URLSession.shared.dataTask(with: K.url) { data, response, error in

            if let error = error {
                print("DEBUG: \(#function) urlSession error \(error)")
                DispatchQueue.main.async {
                    completionHandler(.failure(.urlSessionError(error)))
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("DEBUG: \(#function) Response is nil")
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }

            if !(200...299).contains(httpResponse.statusCode) {
                let code = httpResponse.statusCode
                print("DEBUG: - Bad status code: \(code)")
                DispatchQueue.main.async {
                    if code == 401 {
                        completionHandler(.failure(.unauthorized))
                    } else {
                        completionHandler(.failure(.unhandledError(code)))
                    }
                }
                return
            }

            guard let mimeType = httpResponse.mimeType,
                  mimeType == "application/json",
                  let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.unexpectedData))
                }
                return
            }

            do {
                let jsonData = try JsonData(from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(jsonData))
                }
                
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(.unexpectedJSON))
                }
                return
            }
        }

        task.resume()
    }

    func downloadImage(with path: String) {
        print("DEBUG: \(#function) Downloading image with url \(path)")
    }
}
