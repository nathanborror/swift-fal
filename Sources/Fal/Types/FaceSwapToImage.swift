import Foundation

public struct FaceSwapToImageRequest: Codable {
    public var baseImageURL: String
    public var swapImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case baseImageURL = "base_image_url"
        case swapImageURL = "swap_image_url"
    }
    
    public init(baseImageURL: String, swapImageURL: String) {
        self.baseImageURL = baseImageURL
        self.swapImageURL = swapImageURL
    }
}

public struct FaceSwapToImageResponse: Codable {
    public var image: Image
}
