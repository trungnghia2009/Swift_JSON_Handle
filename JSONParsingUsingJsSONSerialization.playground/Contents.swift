import UIKit

let data = """

{
    "firstName" : "John",
    "lastName" : "Doe",
    "age" : 34
}

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

if let dictionary = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
    let customer = Customer(dictionary: dictionary)
    print(customer.firstName)
    print(customer.lastName)
    print(customer.age)
}
