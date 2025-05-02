import Foundation

public final class Client {

    public static let defaultHost = URL(string: "https://fal.run/fal-ai")!

    public let host: URL
    public let apiKey: String

    internal(set) public var session: URLSession

    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    public init(session: URLSession? = nil, host: URL? = nil, apiKey: String) {
        self.session = session ?? URLSession(configuration: .default)
        self.host = host ?? Self.defaultHost
        self.apiKey = apiKey
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
    }

    public enum Error: Swift.Error, CustomStringConvertible {
        case requestError(String)
        case responseError(response: HTTPURLResponse, detail: String)
        case decodingError(response: HTTPURLResponse, detail: String)
        case unexpectedError(String)

        public var description: String {
            switch self {
            case .requestError(let detail):
                return "Request error: \(detail)"
            case .responseError(let response, let detail):
                return "Response error (Status \(response.statusCode)): \(detail)"
            case .decodingError(let response, let detail):
                return "Decoding error (Status \(response.statusCode)): \(detail)"
            case .unexpectedError(let detail):
                return "Unexpected error: \(detail)"
            }
        }
    }

    private enum Method: String {
        case post = "POST"
        case get = "GET"
        case delete = "DELETE"
    }
}

// MARK: - Models

extension Client {

    public func models() async throws -> ModelListResponse {
        try checkAuthentication()
        return .init(models: Defaults.models)
    }
}

// MARK: - Text to Image

extension Client {

    public func textToImage(_ payload: TextToImageRequest, model: String) async throws -> TextToImageResponse {
        try checkAuthentication()

        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try encoder.encode(payload)

        let (data, resp) = try await session.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(TextToImageResponse.self, from: data)
    }
}

// MARK: - Image to Image

extension Client {

    public func imageToImage(_ payload: ImageToImageRequest, model: String) async throws -> ImageToImageResponse {
        try checkAuthentication()

        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try encoder.encode(payload)

        let (data, resp) = try await session.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(ImageToImageResponse.self, from: data)
    }

    public func faceToImage(_ payload: FaceToImageRequest, model: String) async throws -> FaceToImageResponse {
        try checkAuthentication()

        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try encoder.encode(payload)

        let (data, resp) = try await session.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(FaceToImageResponse.self, from: data)
    }

    public func faceSwapToImage(_ payload: FaceSwapToImageRequest, model: String) async throws -> FaceSwapToImageResponse {
        try checkAuthentication()

        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try encoder.encode(payload)

        let (data, resp) = try await session.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(FaceSwapToImageResponse.self, from: data)
    }
}

// MARK: - Text to Speech

extension Client {

    public func textToSpeech(_ payload: TextToSpeechRequest, model: String) async throws -> TextToSpeechResponse {
        try checkAuthentication()

        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try encoder.encode(payload)

        let (data, resp) = try await session.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(TextToSpeechResponse.self, from: data)
    }
}

// MARK: - Private

extension Client {
    
    private func checkAuthentication() throws {
        if apiKey.isEmpty {
            throw Error.requestError("Missing API key")
        }
    }

    private func makeRequest(path: String, method: String) -> URLRequest {
        var req = URLRequest(url: host.appending(path: path))
        req.httpMethod = method
        req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        req.setValue("Key \(apiKey)", forHTTPHeaderField: "Authorization")
        return req
    }
}
