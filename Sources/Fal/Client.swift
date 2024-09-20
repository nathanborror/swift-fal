import Foundation

public final class FalClient {
    
    public struct Configuration {
        public let host: URL
        public let token: String
        
        public init(host: URL? = nil, token: String) {
            self.host = host ?? Defaults.apiHost
            self.token = token
        }
    }
    
    public let configuration: Configuration
    
    public init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    // Models
    
    public func models() async throws -> ModelListResponse {
        try checkAuthentication()
        return .init(models: Defaults.models)
    }
    
    // Text to Image
    
    public func textToImage(_ payload: TextToImageRequest, model: String) async throws -> TextToImageResponse {
        try checkAuthentication()
        
        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try JSONEncoder().encode(payload)
        
        let (data, resp) = try await URLSession.shared.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(TextToImageResponse.self, from: data)
    }
    
    // Image to Image
    
    public func imageToImage(_ payload: ImageToImageRequest, model: String) async throws -> ImageToImageResponse {
        try checkAuthentication()
        
        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try JSONEncoder().encode(payload)
        
        let (data, resp) = try await URLSession.shared.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(ImageToImageResponse.self, from: data)
    }
    
    public func faceToImage(_ payload: FaceToImageRequest, model: String) async throws -> FaceToImageResponse {
        try checkAuthentication()
        
        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try JSONEncoder().encode(payload)
        
        let (data, resp) = try await URLSession.shared.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(FaceToImageResponse.self, from: data)
    }
    
    public func faceSwapToImage(_ payload: FaceSwapToImageRequest, model: String) async throws -> FaceSwapToImageResponse {
        try checkAuthentication()
        
        var req = makeRequest(path: model, method: "POST")
        req.httpBody = try JSONEncoder().encode(payload)
        
        let (data, resp) = try await URLSession.shared.data(for: req)
        if let httpResponse = resp as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(FaceSwapToImageResponse.self, from: data)
    }
    
    // Private
    
    private func checkAuthentication() throws {
        if configuration.token.isEmpty {
            throw URLError(.userAuthenticationRequired)
        }
    }
    
    private func makeRequest(path: String, method: String) -> URLRequest {
        var req = URLRequest(url: configuration.host.appending(path: path))
        req.httpMethod = method
        req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        req.setValue("Key \(configuration.token)", forHTTPHeaderField: "Authorization")
        return req
    }
    
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}
