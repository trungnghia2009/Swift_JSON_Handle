import UIKit

// useyourloaf.com
extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

enum AddressType: String, Decodable {
    case apartment = "apartment"
    case house = "house"
    case condo = "condo"
    case townHouse = "townHouse"
}

struct CustomerRespond: Decodable {
    var customers: [Customer]
}

struct Customer: Decodable {
    var firstName: String
    var lastName: String
    var dateCreated: Date
    var address: Address
}

struct Address: Decodable {
    var street: String
    var city: String
    var state: String
    var geo: Geo
    var addressType: AddressType
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
            "dateCreated" : "06/09/2020",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                },
                "addressType" : "house"
            }
        }
    
    ]

}

""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

let customerRespoond = try! decoder.decode(CustomerRespond.self, from: json)
let customer = customerRespoond.customers[0]
print(customer.firstName)
print(customer.dateCreated)
