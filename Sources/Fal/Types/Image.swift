import Foundation

public struct Image: Codable {
    public let url: String
    public let width: Int?
    public let height: Int?
    public let contentType: String?
    public let fileName: String?
    public let fileSize: Int?
    
    enum CodingKeys: String, CodingKey {
        case url
        case width
        case height
        case contentType = "content_type"
        case fileName = "file_name"
        case fileSize = "file_size"
    }
}
