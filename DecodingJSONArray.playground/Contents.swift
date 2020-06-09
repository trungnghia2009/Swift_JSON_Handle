import UIKit


struct Place: Decodable {
    var name: String
    var latitude: Double
    var longitude: Double
    var visited: Bool
}


//List of data
let json = """

[
    {
        "name" : "Costa Rica",
        "latitude" : 23.45,
        "longitude" : 45.23,
        "visited" : true
    },
    {
        "name" : "Puerto Rico",
        "latitude" : 23,
        "longitude" : 45,
        "visited" : true
    },
    {
        "name" : "Mexico City",
        "latitude" : 23,
        "longitude" : 45,
        "visited" : true
    },
    {
        "name" : "Iceland",
        "latitude" : 23,
        "longitude" : 45,
        "visited" : false
    }
]

""".data(using: .utf8)!

let places = try! JSONDecoder().decode([Place].self, from: json)
places.forEach { (place) in
    print(place.name)
    print(place.latitude)
    print(place.longitude)
    print(place.visited)
    print("")
}
