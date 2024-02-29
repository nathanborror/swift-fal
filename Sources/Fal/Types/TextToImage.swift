import Foundation

public struct TextToImageRequest: Codable {
    public var prompt: String
    public var negativePrompt: String?
    public var imageSize: ImageSize?
    public var numInferenceSteps: Int?
    public var seed: UInt64?
    public var enableDeepCache: Bool?
    public var guidanceScale: Float?
    public var syncMode: Bool?
    public var numImages: Int?
    public var loras: LoraWeight?
    public var enableSafetyChecker: Bool?
    public var expandPrompt: Bool?
    public var modelName: String?
    public var modelArchitecture: ModelArchitecture?
    public var scheduler: Scheduler?
    public var clipSkip: Int?
    
    public enum ImageSize: String, Codable {
        case square_hd, square
        case portrait_4_3, portrait_16_9
        case landscape_4_3, landscape_16_9
    }
    
    public struct LoraWeight: Codable {
        public var path: String
        public var scale: Float
        
        public init(path: String, scale: Float) {
            self.path = path
            self.scale = scale
        }
    }
    
    public enum ModelArchitecture: String, Codable {
        case sd, sdxl
    }
    
    public enum Scheduler: String, Codable {
        case dpm_2m = "DPM++ 2M"
        case dpm_2m_karras = "DPM++ 2M Karras"
        case dpm_2m_sde = "DPM++ 2M SDE"
        case dpm_2m_sde_karras = "DPM++ 2M SDE Karras"
        case euler = "Euler"
        case euler_a = "Euler A"
        case lcm = "LCM"
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
        case modelName = "model_name"
        case modelArchitecture = "model_architecture"
        case scheduler = "scheduler"
        case clipSkip = "clip_skip"
    }
    
    public init(prompt: String, negativePrompt: String? = nil, imageSize: ImageSize? = nil,
                numInferenceSteps: Int? = nil, seed: UInt64? = nil, enableDeepCache: Bool? = nil,
                guidanceScale: Float? = nil, syncMode: Bool? = nil, numImages: Int? = nil, loras: LoraWeight? = nil,
                enableSafetyChecker: Bool? = nil, expandPrompt: Bool? = nil, modelName: String? = nil,
                modelArchitecture: ModelArchitecture? = nil, scheduler: Scheduler? = nil, clipSkip: Int? = nil) {
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
        self.modelName = modelName
        self.modelArchitecture = modelArchitecture
        self.scheduler = scheduler
        self.clipSkip = clipSkip
    }
}

public struct TextToImageResponse: Codable {
    public let images: [Image]
    public let seed: UInt64?
    public let hasNSFWConcepts: [Bool]?
    
    enum CodingKeys: String, CodingKey {
        case images
        case seed
        case hasNSFWConcepts = "has_nsfw_concepts"
    }
}
