
import UIKit
import PlaygroundSupport

struct Post: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

enum AuthError: Error {
    case unknownError
}


let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"

func fetchData(url: URL, completion: @escaping ((Result<Data, Error>) ->Void )) {
    let task = URLSession.shared.dataTask(with: url) { (data, url, error) in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            completion(.success(data))
        } else {
            completion(.failure(AuthError.unknownError))
        }
    }
    
    task.resume()
}



let url = URL(string: urlString)!

fetchData(url: url) { (result) in
    switch result {
        
    case .success(let data):
        print(data)
        
        do {
            let results = try JSONDecoder().decode([Post].self, from: data)
            results.forEach { (post) in
                print(post.name)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        
    case .failure(let error):
        print(error)
    }
}






PlaygroundPage.current.needsIndefiniteExecution = true
