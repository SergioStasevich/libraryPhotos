//
//  Network.swift
//  libraryPhotos
//
//  Created by Siarhei Stasevich on 14/11/2022.
//

import Foundation

class NetworkSerwice {
    
    // построение запроса данных по URL
    func reqest (SearchTerm: String, completion: @escaping (Data?, Error?)-> Void) {
        let parametrs = self.prepareParaments(searchTerm: SearchTerm)
        let url = self.url(params: parametrs)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareHeaders()-> [String:String]{
        var headers = [String:String]()
        headers["Authorizacion"] = "Client-ID vk2ZhKhXleuM7ElRAsYjA5IBCAhXJ142iVARorWdrqc"
        return headers
    }
    
    private func prepareParaments(searchTerm: String?)-> [String:String] {
        var parameters = [String:String]()
        
        parameters["query"] = searchTerm // запрос
        parameters["page"] = String(1) // колличество страниц
        parameters["per_page"] = String(30) // колличество картинок
        return parameters
    }
    
    private func url(params: [String:String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map {URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void)  -> URLSessionDataTask{
        
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
