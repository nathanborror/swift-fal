import Foundation

public struct TextToSpeechRequest: Codable, Sendable {
    public var text: String
    public var ref_audio_url: URL?
    public var ref_text: String?
    public var voice_setting: VoiceSetting?

    public struct VoiceSetting: Codable, Sendable {
        public var voice_id: String?
        public var custom_voice_id: String?
        public var speed: Double?
        public var vol: Double?
        public var pitch: Int?

        public init(voice_id: String? = nil, custom_voice_id: String? = nil, speed: Double? = nil, vol: Double? = nil, pitch: Int? = nil) {
            self.voice_id = voice_id
            self.custom_voice_id = custom_voice_id
            self.speed = speed
            self.vol = vol
            self.pitch = pitch
        }
    }

    public init(text: String, ref_audio_url: URL? = nil, ref_text: String? = nil, voice_setting: VoiceSetting? = nil) {
        self.text = text
        self.ref_audio_url = ref_audio_url
        self.ref_text = ref_text
        self.voice_setting = voice_setting
    }
}

public struct TextToSpeechResponse: Codable, Sendable {
    public var audio: Audio

    public struct Audio: Codable, Sendable {
        public let url: URL
    }
}

// MARK: - Voice Cloning

public struct VoiceCloneRequest: Codable, Sendable {
    public var audio_url: String

    public init(audio_url: String) {
        self.audio_url = audio_url
    }
}

public struct VoiceCloneResponse: Codable, Sendable {
    public var custom_voice_id: String
}
