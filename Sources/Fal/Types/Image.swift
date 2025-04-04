import Foundation

public struct Image: Codable {
    public let url: String
    public let width: Int?
    public let height: Int?
    public let content_type: String?
    public let file_name: String?
    public let file_size: Int?
}
