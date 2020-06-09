import UIKit

// Define model
struct Customer: Codable {
    
    var firstName: String
    var lastName: String
    var age: Int
}


let jsonData = """

{
    "firstName" : "Nghia",
    "lastName" : "Tran",
    "age" : 30
}

""".data(using: .utf8)!



// Encoding
let customer = Customer(firstName: "John", lastName: "Doe", age: 45)

let encodedCustomerJSON = try! JSONEncoder().encode(customer)
let data = String(data: encodedCustomerJSON, encoding: .utf8)!
print(data)

// Decoding
let customer1 = try! JSONDecoder().decode(Customer.self, from: jsonData)
print(customer1.firstName)
print(customer1.lastName)
print(customer1.age)
