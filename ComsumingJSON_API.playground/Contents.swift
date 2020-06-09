import UIKit
import PlaygroundSupport


struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let latitude: String
    let longitude: String
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}


let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    
    if let httpResponse = response as? HTTPURLResponse {
        print("statusCode: \(httpResponse.statusCode) \n")
    }
    
    guard let data = data else { return }
    let users = try! JSONDecoder().decode([User].self, from: data)
    users.forEach { (user) in
        print(user.id)
        print(user.username)
        print(user.website)
        print(user.address.geo.latitude)
        print(user.company.catchPhrase)
        print("")
    }
    
}.resume()





PlaygroundPage.current.needsIndefiniteExecution = true

