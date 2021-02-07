import Foundation

final public class Api {
    private let urlSession: NetworkSession
    private var sessionTask: URLSessionTask?

    public init(urlSession: NetworkSession) {
        self.urlSession = urlSession
    }
}

extension Api {
    public func get<Model: Codable>(endpoint: Endpoint, completion: @escaping (Result<Model, Error>) -> Void) {
        sessionTask = get(endpoint) { (result) in
            do {

                let data = try result.get()
                let decoder = JSONDecoder(dateDecodingStrategy: .secondsSince1970)
                let model = try decoder.decoded(Model.self, from: data)

                completion(.success(model))

            } catch {
                completion(.failure(error))

            }
        }
    }

    func cancelCurrentSession() {
        sessionTask?.cancel()
    }
}

private extension Api {
    private func get(_ endpoint: Endpoint,
                     options: Options? = nil,
                     completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask {

        let url = buildURL(for: endpoint, using: options)

        let sessionTask = urlSession.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                completion(Result.failure(error))
                return
            }

            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                completion(Result.failure(SpaceXAPIError.unknownResponse))
                return
            }

            guard (200 ..< 300).contains(httpResponse.statusCode) else {
                completion(Result.failure(SpaceXAPIError.serverReturnedCode(httpResponse.statusCode)))
                return
            }

            guard let data = data else {
                completion(Result.failure(SpaceXAPIError.emptyResponse))
                return
            }

            completion(Result.success(data))
        }
        
        return sessionTask
    }

    private func buildURL(for endpoint: Endpoint, using options: Options?) -> URL {
        let url = endpoint.url.appendingPathComponent(endpoint.path)

        guard let options = options else { return url }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = options.queryItems

        return components?.url ?? url
    }
}

fileprivate struct Options {
    public var queryItems: [URLQueryItem] {
        var parameters: [String: String] = [:]

        if let options = filterOptions {
            parameters["filter"] = options.joined(separator: ",")
        }

        parameters["limit"] = String(limit)
        parameters["offset"] = String(offset)

        return parameters.map { URLQueryItem(name: $0, value: $1) }
    }

    private let filterOptions: [String]?
    private let limit: Int
    private let offset: Int

    /// Create result query options
    ///
    /// - Parameters:
    ///   - filterOptions: An optional array of query fields. If this is set then only these values will be returned
    ///   by the API. For example, specifying `flight_number` will only return `flight_number` values from the API.
    ///   - limit: Page limit to be returned, defaults to `25`
    ///   - offset: Page offset, defaults to `0`
    public init(filterOptions: [String]? = nil, limit: Int = 25, offset: Int = 0) {
        self.filterOptions = filterOptions
        self.limit = limit
        self.offset = offset
    }
}
