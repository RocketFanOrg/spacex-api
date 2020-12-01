import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spacexdata.com"
        components.path = "/v4/" + path

        if queryItems.isEmpty == false {
            components.queryItems = queryItems
        }

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }
}

extension Endpoint {
    static var allLaunches: Self {
        Endpoint(path: "launches")
    }

    static var pastLaunches: Self {
        Endpoint(path: "launches/past")
    }

    static var upcomingLaunches: Self {
        Endpoint(path: "launches/upcoming")
    }

    static var latestLaunches: Self {
        Endpoint(path: "launches/latest")
    }

    static var nextLaunches: Self {
        Endpoint(path: "launches/next")
    }

    static func launch(withId id: String) -> Self {
        Endpoint(path: "launches/\(id)")
    }
}
