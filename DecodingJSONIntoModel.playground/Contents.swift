import UIKit

// Define model
struct Customer: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
}

let data = """

{
    "firstName" : "John",
    "lastName" : "Doe",
    "age" : 34
}

""".data(using: .utf8)!

// Using
let customer = try! JSONDecoder().decode(Customer.self, from: data)
print(customer.firstName)
print(customer.lastName)
print(customer.age)
