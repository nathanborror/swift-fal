import Foundation

public struct ImageToImageRequest: Codable {
    public var imageURL: String
    public var prompt: String
    public var scale: Float?
    public var creativity: Float?
    public var detail: Float?
    public var shapePreservation: Float?
    public var negativePrompt: String?
    public var seed: UInt64?
    public var numInferenceSteps: Int?
    public var guidanceScale: Float?
    public var enableSafetyChecks: Bool?
    public var skipCCSR: Bool?
    public var overrideSizeLimits: Bool?
    
    public var controlnetConditioningScale: Float?
    public var controlGuidanceStart: Float?
    public var controlGuidanceEnd: Float?
    public var scheduler: Scheduler?
    public var imageSize: ImageSize?
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case prompt
        case scale
        case creativity
        case detail
        case shapePreservation = "shape_preservation"
        case negativePrompt = "negative_prompt"
        case seed
        case numInferenceSteps = "num_inference_steps"
        case guidanceScale = "guidance_scale"
        case enableSafetyChecks = "enable_safety_checks"
        case skipCCSR = "skip_ccsr"
        case overrideSizeLimits = "override_size_limits"
        case controlnetConditioningScale = "controlnet_conditioning_scale"
        case controlGuidanceStart = "control_guidance_start"
        case controlGuidanceEnd = "control_guidance_end"
        case scheduler
        case imageSize = "image_size"
    }
    
    public enum Scheduler: String, Codable {
        case dpm_karras_sde = "DPM++ Karras SDE"
        case euler = "Euler"
    }
    
    public enum ImageSize: String, Codable {
        case square_hd, square
        case portrait_4_3, portrait_16_9
        case landscape_4_3, landscape_16_9
    }
    
    public init(imageURL: String, prompt: String, scale: Float? = nil, creativity: Float? = nil, detail: Float? = nil, 
                shapePreservation: Float? = nil, negativePrompt: String? = nil, seed: UInt64? = nil,
                numInferenceSteps: Int? = nil, guidanceScale: Float? = nil, enableSafetyChecks: Bool? = nil,
                skipCCSR: Bool? = nil, overrideSizeLimits: Bool? = nil, controlnetConditioningScale: Float? = nil,
                controlGuidanceStart: Float? = nil, controlGuidanceEnd: Float? = nil, scheduler: Scheduler? = nil,
                imageSize: ImageSize? = nil) {
        self.imageURL = imageURL
        self.prompt = prompt
        self.scale = scale
        self.creativity = creativity
        self.detail = detail
        self.shapePreservation = shapePreservation
        self.negativePrompt = negativePrompt
        self.seed = seed
        self.numInferenceSteps = numInferenceSteps
        self.guidanceScale = guidanceScale
        self.enableSafetyChecks = enableSafetyChecks
        self.skipCCSR = skipCCSR
        self.overrideSizeLimits = overrideSizeLimits
        self.controlnetConditioningScale = controlnetConditioningScale
        self.controlGuidanceStart = controlGuidanceStart
        self.controlGuidanceEnd = controlGuidanceEnd
        self.scheduler = scheduler
        self.imageSize = imageSize
    }
}

public struct ImageToImageResponse: Codable {
    public let image: Image
    public let seed: UInt64
}
