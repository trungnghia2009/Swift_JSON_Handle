import UIKit

struct Customer: Decodable {
    var firstName: String
    var lastName: String
    var age: Int
}

let json = """

{
    "first_name" : "John",
    "last_name" : "Doe",
    "age" : 34
}

""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

let customer = try! decoder.decode(Customer.self, from: json)
print(customer.firstName)
print(customer.lastName)
print(customer.age)
