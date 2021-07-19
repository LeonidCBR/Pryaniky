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

    private func performRequest(to apiUrl: URL, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {

        let task = URLSession.shared.dataTask(with: apiUrl) { data, response, error in

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
                  (mimeType == "application/json") || ( mimeType.hasPrefix("image") ),
                  let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.unexpectedData))
                }
                return
            }

            DispatchQueue.main.async {
                completionHandler(.success(data))
            }
        }

        task.resume()
    }


    func downloadJsonData(completionHandler: @escaping (Result<JsonData, NetworkError>) -> Void) {

        performRequest(to: K.urlMultiData) { result in
            switch result {
            case .success(let data):
                do {

                    // TODO: Use for test
//                    print("DEBUG: Using fake json data")
//                    let jsonData = try JsonData(from: K.jsonDataWithUnknownBlocks)
                    let jsonData = try JsonData(from: data)

                    completionHandler(.success(jsonData))

                } catch {
                    completionHandler(.failure(.unexpectedJSON))
                    return
                }

            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

    
    func downloadImage(with path: String, completionHandler: @escaping (Result<Data, NetworkError>) -> Void ) {
//        print("DEBUG: \(#function) Downloading image with url \(path)")
        guard let url = URL(string: path) else {
            print("DEBUG: Path of the image is invalid!")
            return
        }

        performRequest(to: url) { result in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
