import UIKit

struct CustomerRespond: Decodable {
    var customers: [Customer]
}

struct Customer: Decodable {
    var firstName: String
    var lastName: String
    var address: Address
}

struct Address: Decodable {
    var street: String
    var city: String
    var state: String
    var geo: Geo
}

struct Geo: Decodable {
    var latitude: Double
    var longitude: Double
}


let json = """

{
    "customers":[
        {
            "firstName" : "John",
            "lastName" : "Doe",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                }
            }
        }
    
    ]

}

""".data(using: .utf8)!

let customerRespond = try! JSONDecoder().decode(CustomerRespond.self, from: json)
let customers = customerRespond.customers
print(customers[0].address.geo.longitude)
