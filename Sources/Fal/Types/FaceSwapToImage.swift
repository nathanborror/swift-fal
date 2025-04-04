import Foundation

public struct FaceSwapToImageRequest: Codable {
    public var base_image_url: String
    public var swap_image_url: String
    
    public init(base_image_url: String, swap_image_url: String) {
        self.base_image_url = base_image_url
        self.swap_image_url = swap_image_url
    }
}

public struct FaceSwapToImageResponse: Codable {
    public var image: Image
}
