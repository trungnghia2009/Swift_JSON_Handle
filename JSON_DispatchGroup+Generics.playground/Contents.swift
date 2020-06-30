import UIKit
import PlaygroundSupport


struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

struct Album: Decodable {
    let userId: Int
    let id: Int
    let title: String
}


enum AuthError: Error {
    case unknownError
}

class APICaller {
    
    static let shared = APICaller()

    private init() {}
    
    func performAPICall<T: Decodable>(url: String, expectingReturnType: T.Type, completion: @escaping ((Result<[T], Error>) -> Void)) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data, error == nil else { return }
            var decodedResult = [T]()
            
            do {
                decodedResult = try JSONDecoder().decode([T].self, from: data)
                completion(.success(decodedResult))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

//Using

let postsUrlString = "https://jsonplaceholder.typicode.com/posts"
let commentsUrlString = "https://jsonplaceholder.typicode.com/comments"
let albumsUrlString = "https://jsonplaceholder.typicode.com/albums"

var posts = [Post]()
var comments = [Comment]()
var albums = [Album]()


func fetchPosts(completion: (() -> ())?) {
    APICaller.shared.performAPICall(url: postsUrlString, expectingReturnType: Post.self) { (result) in
        switch result {
            
        case .success(let p):
            print("Fetched Posts")
            posts = p
            completion!()
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

func fetchComments(completion: (() -> ())?) {
    APICaller.shared.performAPICall(url: commentsUrlString, expectingReturnType: Comment.self) { (result) in
        switch result {
            
        case .success(let c):
            print("Fetched Comments")
            comments = c
            completion!()
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

func fetchAlbums(completion: (() -> ())?) {
    APICaller.shared.performAPICall(url: albumsUrlString, expectingReturnType: Album.self) { (result) in
        switch result {
            
        case .success(let a):
            print("Fetched Albums")
            albums = a
            completion!()
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}


// Await to fetch all data, then count data
let dispatchGroup = DispatchGroup()

dispatchGroup.enter()
fetchPosts {
    dispatchGroup.leave()
}

dispatchGroup.enter()
fetchComments {
    dispatchGroup.leave()
}

dispatchGroup.enter()
fetchAlbums {
    dispatchGroup.leave()
}

dispatchGroup.notify(queue: .main) {
    print("All finished")
    print(posts.count)
    print(comments.count)
    print(albums.count)
}

PlaygroundPage.current.needsIndefiniteExecution = true
