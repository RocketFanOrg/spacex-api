import XCTest
@testable import SpaceXAPI

final class EndpointTests: XCTestCase {

    func testThatAllEndPointPathsAreCorrect() {
        XCTAssertEqual(Endpoint.allLaunches.path, "launches")
        XCTAssertEqual(Endpoint.pastLaunches.path, "launches/past")
        XCTAssertEqual(Endpoint.upcomingLaunches.path, "launches/upcoming")
        XCTAssertEqual(Endpoint.nextLaunches.path, "launches/next")
        XCTAssertEqual(Endpoint.latestLaunches.path, "launches/latest")
        XCTAssertEqual(Endpoint.launch(withId: "{launchId}").path, "launches/{launchId}")
    }

    func testThatAllEndPointUrlsAreCorrect() {
        let baseUrl = "https://api.spacexdata.com/v4"

        XCTAssertEqual(Endpoint.allLaunches.url.absoluteString, "\(baseUrl)/launches")
        XCTAssertEqual(Endpoint.pastLaunches.url.absoluteString, "\(baseUrl)/launches/past")
        XCTAssertEqual(Endpoint.upcomingLaunches.url.absoluteString, "\(baseUrl)/launches/upcoming")
        XCTAssertEqual(Endpoint.nextLaunches.url.absoluteString, "\(baseUrl)/launches/next")
        XCTAssertEqual(Endpoint.latestLaunches.url.absoluteString, "\(baseUrl)/launches/latest")
        XCTAssertEqual(Endpoint.launch(withId: "launchId").url.absoluteString, "\(baseUrl)/launches/launchId")
    }
}
