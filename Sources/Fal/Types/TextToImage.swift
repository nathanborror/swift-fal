import Foundation

public struct TextToImageRequest: Codable {
    public var prompt: String
    public var negative_prompt: String?
    public var image_size: ImageSize?
    public var num_inference_steps: Int?
    public var seed: UInt64?
    public var enable_deep_cache: Bool?
    public var guidance_scale: Float?
    public var sync_mode: Bool?
    public var num_images: Int?
    public var loras: LoraWeight?
    public var enable_safety_checker: Bool?
    public var expand_prompt: Bool?
    public var model_name: String?
    public var model_architecture: ModelArchitecture?
    public var scheduler: Scheduler?
    public var clip_skip: Int?
    public var output_format: OutputFormat?

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

    public enum OutputFormat: String, Codable {
        case png
        case jpeg
    }

    public init(prompt: String, negative_prompt: String? = nil, image_size: ImageSize? = nil,
                num_inference_steps: Int? = nil, seed: UInt64? = nil, enable_deep_cache: Bool? = nil,
                guidance_scale: Float? = nil, sync_mode: Bool? = nil, num_images: Int? = nil,
                loras: LoraWeight? = nil, enable_safety_checker: Bool? = nil, expand_prompt: Bool? = nil,
                model_name: String? = nil, model_architecture: ModelArchitecture? = nil, scheduler: Scheduler? = nil,
                clip_skip: Int? = nil, output_format: OutputFormat? = nil) {
        self.prompt = prompt
        self.negative_prompt = negative_prompt
        self.image_size = image_size
        self.num_inference_steps = num_inference_steps
        self.seed = seed
        self.enable_deep_cache = enable_deep_cache
        self.guidance_scale = guidance_scale
        self.sync_mode = sync_mode
        self.num_images = num_images
        self.loras = loras
        self.enable_safety_checker = enable_safety_checker
        self.expand_prompt = expand_prompt
        self.model_name = model_name
        self.model_architecture = model_architecture
        self.scheduler = scheduler
        self.clip_skip = clip_skip
        self.output_format = output_format
    }
}

public struct TextToImageResponse: Codable {
    public let images: [Image]
    public let seed: UInt64?
    public let has_nsfw_concepts: [Bool]?
}
