//
//  BaseRouter.swift
//  DownLoadFile
//
//  Created by Đặng Duy Cường on 1/4/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class BaseRouter {
    static let shared: BaseRouter = BaseRouter()
    
    func getData<T: Codable>(urlString: String, completion: @escaping(T)->()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("fullURLRequest: ", url)
                print("params: ", url.query as Any)
                print("header: ", url.relativeString)
                print("Response json:\n", dataString)
            }
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(data)
                }
            } catch let error {
                print("decode error: ", error)
            }
            }.resume()
    }
    
    // download image
//    func downloadImage() {
//        let url = URL(string: "")
//        let urlRequest = URLRequest(url: url!)
//        let downloadTask = URLSession.shared.downloadTask(with: <#T##URLRequest#>)
//    }
}
