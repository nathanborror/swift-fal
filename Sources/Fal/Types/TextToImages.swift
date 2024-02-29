import Foundation

public struct TextToImageRequest: Codable {
    public var prompt: String
    public var negativePrompt: String?
    public var imageSize: ImageSize?
    public var numInferenceSteps: Int?
    public var seed: Int?
    public var enableDeepCache: Bool?
    public var guidanceScale: Double?
    public var syncMode: Bool?
    public var numImages: Int?
    public var loras: LoraWeight?
    public var enableSafetyChecker: Bool?
    public var expandPrompt: Bool?
    
    public enum ImageSize: String, Codable {
        case square_hd
        case square
        case portrait_4_3
        case portrait_16_9
        case landscape_4_3
        case landscape_16_9
    }
    
    public struct LoraWeight: Codable {
        public var path: String
        public var scale: Double
        
        public init(path: String, scale: Double) {
            self.path = path
            self.scale = scale
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case prompt
        case negativePrompt = "negative_prompt"
        case imageSize = "image_size"
        case numInferenceSteps = "num_inference_steps"
        case seed
        case enableDeepCache = "enable_deep_cache"
        case guidanceScale = "guidance_scale"
        case syncMode = "sync_mode"
        case numImages = "num_images"
        case loras
        case enableSafetyChecker = "enable_safety_checker"
        case expandPrompt = "expand_prompt"
    }
    
    public init(prompt: String, negativePrompt: String? = nil, imageSize: ImageSize? = nil, numInferenceSteps: Int? = nil, 
         seed: Int? = nil, enableDeepCache: Bool? = nil, guidanceScale: Double? = nil, syncMode: Bool? = nil,
         numImages: Int? = nil, loras: LoraWeight? = nil, enableSafetyChecker: Bool? = nil, expandPrompt: Bool? = nil) {
        self.prompt = prompt
        self.negativePrompt = negativePrompt
        self.imageSize = imageSize
        self.numInferenceSteps = numInferenceSteps
        self.seed = seed
        self.enableDeepCache = enableDeepCache
        self.guidanceScale = guidanceScale
        self.syncMode = syncMode
        self.numImages = numImages
        self.loras = loras
        self.enableSafetyChecker = enableSafetyChecker
        self.expandPrompt = expandPrompt
    }
}

public struct TextToImageResponse: Codable {
    public let images: [Image]
    public let seed: Int?
    public let hasNSFWConcepts: [Bool]?
    
    public struct Image: Codable {
        public let url: String
        public let width: Int
        public let height: Int
        public let contentType: String
        
        enum CodingKeys: String, CodingKey {
            case url
            case width
            case height
            case contentType = "content_type"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case images
        case seed
        case hasNSFWConcepts = "has_nsfw_concepts"
    }
}
