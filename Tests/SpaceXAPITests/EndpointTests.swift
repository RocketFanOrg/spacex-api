import XCTest
@testable import SpaceXAPI

final class EndpointTests: XCTestCase {

    func testThatAllEndPointPathsAreCorrect() {

        // Launches
        XCTAssertEqual(Endpoint.allLaunches.path, "launches")
        XCTAssertEqual(Endpoint.pastLaunches.path, "launches/past")
        XCTAssertEqual(Endpoint.upcomingLaunches.path, "launches/upcoming")
        XCTAssertEqual(Endpoint.nextLaunches.path, "launches/next")
        XCTAssertEqual(Endpoint.latestLaunches.path, "launches/latest")
        XCTAssertEqual(Endpoint.launch(withId: "{launchId}").path, "launches/{launchId}")

        // Capsules
        XCTAssertEqual(Endpoint.allCapsules.path, "capsules")
        XCTAssertEqual(Endpoint.capsule(withId: "{capsuleId}").path, "capsules/{capsuleId}")

        // Company
        XCTAssertEqual(Endpoint.companyInfo.path, "company")

        // Roadster Info
        XCTAssertEqual(Endpoint.roadsterInfo.path, "roadster")

        // Cores
        XCTAssertEqual(Endpoint.allCores.path, "cores")
        XCTAssertEqual(Endpoint.core(withId: "{coreID}").path, "cores/{coreID}")

        // Crew members
        XCTAssertEqual(Endpoint.allCrewMembers.path, "crew")
        XCTAssertEqual(Endpoint.crewMember(withId: "{crewId}").path, "crew/{crewId}")

        // Dragons
        XCTAssertEqual(Endpoint.allDragons.path, "dragons")
        XCTAssertEqual(Endpoint.dragon(withId: "{dragonsId}").path, "dragons/{dragonsId}")

        // Landpads
        XCTAssertEqual(Endpoint.allLandpads.path, "landpads")
        XCTAssertEqual(Endpoint.landpad(withId: "{landPadID}").path, "landpads/{landPadID}")

        // Landpads
        XCTAssertEqual(Endpoint.allLandpads.path, "landpads")
        XCTAssertEqual(Endpoint.landpad(withId: "{landPadID}").path, "landpads/{landPadID}")

        // Launchpads
        XCTAssertEqual(Endpoint.allLaunchpads.path, "launchpads")
        XCTAssertEqual(Endpoint.launchpad(withId: "{launchpadId}").path, "launchpads/{launchpadId}")

        // Payloads
        XCTAssertEqual(Endpoint.allPayloads.path, "payloads")
        XCTAssertEqual(Endpoint.payload(withId: "{payloadId}").path, "payloads/{payloadId}")

        // Rockets
        XCTAssertEqual(Endpoint.allRockets.path, "rockets")
        XCTAssertEqual(Endpoint.rocket(withId: "{rocketId}").path, "rockets/{rocketId}")

        // Starlink stats
        XCTAssertEqual(Endpoint.allStarlinkStats.path, "starlink")
        XCTAssertEqual(Endpoint.starlink(withId: "{starlinkId}").path, "starlink/{starlinkId}")

        // History
        XCTAssertEqual(Endpoint.allHistoricalEvents.path, "history")
        XCTAssertEqual(Endpoint.historicalEvent(withId: "{historyId}").path, "history/{historyId}")

        // Ships
        XCTAssertEqual(Endpoint.allShips.path, "ships")
        XCTAssertEqual(Endpoint.ship(withId: "{shipId}").path, "ships/{shipId}")
    }

    func testThatAllEndPointUrlsAreCorrect() {
        let baseUrl = "https://api.spacexdata.com/v4"

        // Launches
        XCTAssertEqual(Endpoint.allLaunches.url.absoluteString, "\(baseUrl)/launches")
        XCTAssertEqual(Endpoint.pastLaunches.url.absoluteString, "\(baseUrl)/launches/past")
        XCTAssertEqual(Endpoint.upcomingLaunches.url.absoluteString, "\(baseUrl)/launches/upcoming")
        XCTAssertEqual(Endpoint.nextLaunches.url.absoluteString, "\(baseUrl)/launches/next")
        XCTAssertEqual(Endpoint.latestLaunches.url.absoluteString, "\(baseUrl)/launches/latest")
        XCTAssertEqual(Endpoint.launch(withId: "launchId").url.absoluteString, "\(baseUrl)/launches/launchId")

        // Capsules
        XCTAssertEqual(Endpoint.allCores.url.absoluteString, "\(baseUrl)/cores")
        XCTAssertEqual(Endpoint.core(withId: "coreId").url.absoluteString, "\(baseUrl)/cores/coreId")

        // Cores
        XCTAssertEqual(Endpoint.allCapsules.url.absoluteString, "\(baseUrl)/capsules")
        XCTAssertEqual(Endpoint.capsule(withId: "capsuleId").url.absoluteString, "\(baseUrl)/capsules/capsuleId")

        // Crew members
        XCTAssertEqual(Endpoint.allCrewMembers.url.absoluteString, "\(baseUrl)/crew")
        XCTAssertEqual(Endpoint.crewMember(withId: "crewId").url.absoluteString, "\(baseUrl)/crew/crewId")

        // Dragons
        XCTAssertEqual(Endpoint.allDragons.url.absoluteString, "\(baseUrl)/dragons")
        XCTAssertEqual(Endpoint.dragon(withId: "dragonsId").url.absoluteString, "\(baseUrl)/dragons/dragonsId")

        // Landpads
        XCTAssertEqual(Endpoint.allLandpads.url.absoluteString, "\(baseUrl)/landpads")
        XCTAssertEqual(Endpoint.landpad(withId: "landpadsId").url.absoluteString, "\(baseUrl)/landpads/landpadsId")

        // Payloads
        XCTAssertEqual(Endpoint.allPayloads.url.absoluteString, "\(baseUrl)/payloads")
        XCTAssertEqual(Endpoint.payload(withId: "payloadId").url.absoluteString, "\(baseUrl)/payloads/payloadId")

        // Launchpads
        XCTAssertEqual(Endpoint.allLaunchpads.url.absoluteString, "\(baseUrl)/launchpads")
        XCTAssertEqual(Endpoint.launchpad(withId: "launchpadId").url.absoluteString, "\(baseUrl)/launchpads/launchpadId")

        // Rockets
        XCTAssertEqual(Endpoint.allRockets.url.absoluteString, "\(baseUrl)/rockets")
        XCTAssertEqual(Endpoint.rocket(withId: "rocketId").url.absoluteString, "\(baseUrl)/rockets/rocketId")

        // Starlink
        XCTAssertEqual(Endpoint.allStarlinkStats.url.absoluteString, "\(baseUrl)/starlink")
        XCTAssertEqual(Endpoint.starlink(withId: "starlinkId").url.absoluteString, "\(baseUrl)/starlink/starlinkId")

        // History
        XCTAssertEqual(Endpoint.allHistoricalEvents.url.absoluteString, "\(baseUrl)/history")
        XCTAssertEqual(Endpoint.historicalEvent(withId: "historyId").url.absoluteString, "\(baseUrl)/history/historyId")

        // Ships
        XCTAssertEqual(Endpoint.allShips.url.absoluteString, "\(baseUrl)/ships")
        XCTAssertEqual(Endpoint.ship(withId: "shipId").url.absoluteString, "\(baseUrl)/ships/shipId")

        // Company info
        XCTAssertEqual(Endpoint.companyInfo.url.absoluteString, "\(baseUrl)/company")

        // Roadster info
        XCTAssertEqual(Endpoint.roadsterInfo.url.absoluteString, "\(baseUrl)/roadster")

    }
}
