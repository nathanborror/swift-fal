import Foundation

public struct ImageToImageRequest: Codable {
    public var image_url: String
    public var prompt: String
    public var scale: Float?
    public var creativity: Float?
    public var detail: Float?
    public var shape_preservation: Float?
    public var negative_prompt: String?
    public var seed: UInt64?
    public var num_inference_steps: Int?
    public var guidance_scale: Float?
    public var enable_safety_checks: Bool?
    public var skip_ccsr: Bool?
    public var override_size_limits: Bool?

    public var controlnet_conditioning_scale: Float?
    public var control_guidance_start: Float?
    public var control_guidance_end: Float?
    public var scheduler: Scheduler?
    public var image_size: ImageSize?

    public enum Scheduler: String, Codable {
        case dpm_karras_sde = "DPM++ Karras SDE"
        case euler = "Euler"
    }
    
    public enum ImageSize: String, Codable {
        case square_hd, square
        case portrait_4_3, portrait_16_9
        case landscape_4_3, landscape_16_9
    }
    
    public init(image_url: String, prompt: String, scale: Float? = nil, creativity: Float? = nil, detail: Float? = nil,
                shape_preservation: Float? = nil, negative_prompt: String? = nil, seed: UInt64? = nil,
                num_inference_steps: Int? = nil, guidance_scale: Float? = nil, enable_safety_checks: Bool? = nil,
                skip_ccsr: Bool? = nil, override_size_limits: Bool? = nil, controlnet_conditioning_scale: Float? = nil,
                control_guidance_start: Float? = nil, control_guidance_end: Float? = nil, scheduler: Scheduler? = nil,
                image_size: ImageSize? = nil) {
        self.image_url = image_url
        self.prompt = prompt
        self.scale = scale
        self.creativity = creativity
        self.detail = detail
        self.shape_preservation = shape_preservation
        self.negative_prompt = negative_prompt
        self.seed = seed
        self.num_inference_steps = num_inference_steps
        self.guidance_scale = guidance_scale
        self.enable_safety_checks = enable_safety_checks
        self.skip_ccsr = skip_ccsr
        self.override_size_limits = override_size_limits
        self.controlnet_conditioning_scale = controlnet_conditioning_scale
        self.control_guidance_start = control_guidance_start
        self.control_guidance_end = control_guidance_end
        self.scheduler = scheduler
        self.image_size = image_size
    }
}

public struct ImageToImageResponse: Codable {
    public let image: Image
    public let seed: UInt64
}
