import Foundation

public struct TextToSpeechRequest: Codable, Sendable {
    public var text: String
    public var ref_audio_url: URL?
    public var ref_text: String?

    public init(text: String, ref_audio_url: URL? = nil, ref_text: String? = nil) {
        self.text = text
        self.ref_audio_url = ref_audio_url
        self.ref_text = ref_text
    }
}

public struct TextToSpeechResponse: Codable, Sendable {
    public var audio: Audio

    public struct Audio: Codable, Sendable {
        public let url: URL
    }
}
