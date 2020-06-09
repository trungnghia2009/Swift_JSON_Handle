import UIKit

struct Customer: Decodable {
    var firstName: String
    var lastName: String
    var age: Int
    
    private enum CodingKeys: String, CodingKey {
        case firstName = "FIRSTNAME"
        case lastName = "LASTNAME"
        case age = "AGE"
    }
}

let json = """

{
    "FIRSTNAME" : "John",
    "LASTNAME" : "Doe",
    "AGE" : 34
}

""".data(using: .utf8)!

let decoder = JSONDecoder()


let customer = try! decoder.decode(Customer.self, from: json)
print(customer.firstName)
print(customer.lastName)
print(customer.age)
