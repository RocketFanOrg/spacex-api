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

//MARK: - Launches
extension Endpoint {
    /// Returns an array of All Launches
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launches/all.md
    static var allLaunches: Self {
        Endpoint(path: "launches")
    }

    /// Returns an array of Past Launches
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launches/past.md
    static var pastLaunches: Self {
        Endpoint(path: "launches/past")
    }

    /// Returns an array of Upcoming Launches
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launches/upcoming.md
    static var upcomingLaunches: Self {
        Endpoint(path: "launches/upcoming")
    }

    /// Returns an array of Latest Launches
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launches/latest.md
    static var latestLaunches: Self {
        Endpoint(path: "launches/latest")
    }

    /// Returns an array of Next Launches
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launches/next.md
    static var nextLaunches: Self {
        Endpoint(path: "launches/next")
    }

    /// Returns a single Launch
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launches/one.md
    /// - Parameter id: ID of the Launch  to get
    static func launch(withId id: String) -> Self {
        Endpoint(path: "launches/\(id)")
    }
}

//MARK: - Capsules
extension Endpoint {
    /// Returns an array of Capsules
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/capsules/all.md
    static var allCapsules: Self {
        Endpoint(path: "capsules")
    }

    /// Returns a single Capsule
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/capsules/one.md
    /// - Parameter id: ID of the Capsule  to get
    static func capsule(withId id: String) -> Self {
        Endpoint(path: "capsules/\(id)")
    }
}

//MARK: - Company info
extension Endpoint {

    /// Returns the company info in a single object
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/company/all.md
    static var companyInfo: Self {
        Endpoint(path: "company")
    }
}

//MARK: - Cores
extension Endpoint {
    /// Returns an array of Cores
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/cores/all.md
    static var allCores: Self {
        Endpoint(path: "cores")
    }

    /// Returns a single Core
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/cores/one.md
    /// - Parameter id: ID of the core to get
    static func core(withId id: String) -> Self {
        Endpoint(path: "cores/\(id)")
    }
}

//MARK: - Crew
extension Endpoint {
    /// Returns an array of Crew members
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/crew/all.md
    static var allCrewMembers: Self {
        Endpoint(path: "crew")
    }

    /// Returns a single Crew members
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/crew/one.md
    /// - Parameter id: ID of the crew member to get
    static func crewMember(withId id: String) -> Self {
        Endpoint(path: "crew/\(id)")
    }
}

//MARK: - Dragons
extension Endpoint {
    /// Returns an array of Dragons
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/dragons/all.md
    static var allDragons: Self {
        Endpoint(path: "dragons")
    }

    /// Returns a single Dragon
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/dragons/one.md
    /// - Parameter id: ID of the Dragon to get
    static func dragon(withId id: String) -> Self {
        Endpoint(path: "dragons/\(id)")
    }
}

//MARK: - Landpads
extension Endpoint {
    /// Returns an array of Landpads
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/landpads/all.md
    static var allLandpads: Self {
        Endpoint(path: "landpads")
    }

    /// Returns a single Landpad
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/landpads/one.md
    /// - Parameter id: ID of the Landpad to get
    static func landpad(withId id: String) -> Self {
        Endpoint(path: "landpads/\(id)")
    }
}

//MARK: - Launchpads
extension Endpoint {
    /// Returns an array of Launchpads
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launchpads/all.md
    static var allLaunchpads: Self {
        Endpoint(path: "launchpads")
    }

    /// Returns a single Launchpads
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/launchpads/one.md
    /// - Parameter id: ID of the Launchpad to get
    static func launchpad(withId id: String) -> Self {
        Endpoint(path: "launchpads/\(id)")
    }
}

//MARK: - Payloads
extension Endpoint {
    /// Returns an array of Payloads
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/payloads/all.md
    static var allPayloads: Self {
        Endpoint(path: "payloads")
    }

    /// Returns a single Payload
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/payloads/one.md
    /// - Parameter id: ID of the Payload to get
    static func payload(withId id: String) -> Self {
        Endpoint(path: "payloads/\(id)")
    }
}

//MARK: - Roadster
extension Endpoint {
    /// Returns the Roadster info in a single object
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/roadster/get.md
    static var roadsterInfo: Self {
        Endpoint(path: "roadster")
    }
}

//MARK: - Rockets
extension Endpoint {
    /// Returns an array of Rockets
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/rockets/all.md
    static var allRockets: Self {
        Endpoint(path: "rockets")
    }

    /// Returns a single Rocket
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/rockets/one.md
    /// - Parameter id: ID of the Rocket to get
    static func rocket(withId id: String) -> Self {
        Endpoint(path: "rockets/\(id)")
    }
}

//MARK: - Starlink
extension Endpoint {
    /// Returns an array of Starlink stats
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/starlink/all.md
    static var allStarlinkStats: Self {
        Endpoint(path: "starlink")
    }

    /// Returns a single Starlink
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/rockets/one.md
    /// - Parameter id: ID of the Starlink to get
    static func starlink(withId id: String) -> Self {
        Endpoint(path: "starlink/\(id)")
    }
}

//MARK: - History
extension Endpoint {
    static var allHistoricalEvents: Self {
        Endpoint(path: "history")
    }

    static func historicalEvent(withId id: String) -> Self {
        Endpoint(path: "history/\(id)")
    }
}

//MARK: - Ships
extension Endpoint {
    /// Returns an array of Ships
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/ships/all.md
    static var allShips: Self {
        Endpoint(path: "ships")
    }

    /// Returns a single Ship
    /// - Note: https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/rockets/one.md
    /// - Parameter id: ID of the Ship to get
    static func ship(withId id: String) -> Self {
        Endpoint(path: "ships/\(id)")
    }
}
