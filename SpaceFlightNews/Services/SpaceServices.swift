//
//  SpaceServices.swift
//  SpaceFlightNews
//
//  Created by Anggi Fergian on 16/05/23.
//

import Foundation
import Alamofire

class SpaceServices {
    static let shared: SpaceServices = SpaceServices()
    
    private let baseUrl = "https://api.spaceflightnewsapi.net/v3/"
    
    private init() { }
    
    func fetchNews(completion: @escaping (Result<[Response], Error>) -> Void) {
        AF.request("\(baseUrl)articles", method: .get)
            .validate()
            .responseDecodable(of: [Response].self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
