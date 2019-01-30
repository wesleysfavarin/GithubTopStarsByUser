//
//  GithubApi.swift
//  GitHubApiList
//
//  Created by mac on 29/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

class GithubApi  {
     private static let basePath = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
     static private let limit = 50
    
    class func LoadGithubRanking( page: Int = 1, onComplete:@escaping (GithubInfo?) -> Void) {
       
        let url = basePath
        Alamofire.request(url).responseJSON {(response) in
            guard let data = response.data else{
                onComplete(nil)
                return
            }
            do{
                let githubInfo = try? newJSONDecoder().decode(GithubInfo.self, from: data)
               onComplete(githubInfo)
                return
            }catch{
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
        
        func newJSONDecoder() -> JSONDecoder {
            let decoder = JSONDecoder()
            if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
                decoder.dateDecodingStrategy = .iso8601
            }
            return decoder
        }
        
        func newJSONEncoder() -> JSONEncoder {
            let encoder = JSONEncoder()
            if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
                encoder.dateEncodingStrategy = .iso8601
            }
            return encoder
        }
     }

}




