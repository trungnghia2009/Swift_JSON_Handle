import UIKit


struct Place: Decodable {
    var name: String
    var latitude: Double
    var longitude: Double
    var visited: Bool
}

struct PlacesRespond: Decodable {
    var places: [Place]
}

struct Main: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
}

struct MainRespond: Decodable {
    var main: Main
}

let json = """

{

    "places" : [

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
        }

    ],

    "main" : {
        "temp" : 281.52,
        "feels_like" : 278.99,
        "temp_min" : 280.15
    }

}

""".data(using: .utf8)!

//let placesDictionary = try! JSONDecoder().decode([String: [Place]].self, from: json)
//if let places = placesDictionary["places"] {
//    print(places)
//}

let placesRespond = try! JSONDecoder().decode(PlacesRespond.self, from: json)
print(placesRespond.places[0].latitude)

let mainRespond = try! JSONDecoder().decode(MainRespond.self, from: json)
let main = mainRespond.main
print(main.temp)
