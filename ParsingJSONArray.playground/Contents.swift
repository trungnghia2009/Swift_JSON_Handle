import UIKit

let data = """

[
    {
        "firstName" : "John",
        "lastName" : "Doe",
        "age" : 23
    },
    {
        "firstName" : "Mary",
        "lastName" : "Katy",
        "age" : 35
    },
    {
        "firstName" : "Alex",
        "lastName" : "Lowe",
        "age" : 47
    }
]

""".data(using: .utf8)!

//Define model
struct Customer {
    let firstName: String
    let lastName: String
    let age: Int
    
    init(dictionary: [String: Any]) {
        firstName = dictionary["firstName"] as? String ?? ""
        lastName = dictionary["lastName"] as? String ?? ""
        age = dictionary["age"] as? Int ?? 0
    }
}

if let customerDictionaries = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] {
    let customers = customerDictionaries.compactMap { dictionary in
        return Customer(dictionary: dictionary)
    }
    
    print(customers)
}
