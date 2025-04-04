import Foundation

public struct FaceToImageRequest: Codable {
    public var face_image_url: String
    public var prompt: String
    public var style: Style?
    public var negative_prompt: String?
    public var num_inference_steps: Int?
    public var guidance_scale: Float?
    public var enable_lcm: Bool?
    public var controlnet_selection: ControlnetSelection?
    public var controlnet_selection_scale: Float?
    public var ip_adapter_scale: Float?
    public var identity_controlnet_conditioning_scale: Float?
    public var enhance_face_region: Bool?
    public var seed: UInt64?
    
    public enum Style: String, Codable {
        case none = "(No style)"
        case headshot = "Headshot"
        case watercolor = "Watercolor"
        case filmNoir = "Film Noir"
        case neon = "Neon"
        case jungle = "Jungle"
        case mars = "Mars"
        case vibrantColor = "Vibrant Color"
        case snow = "Snow"
        case lineArt = "Line art"
    }
    
    public enum ControlnetSelection: String, Codable {
        case pose, canny, depth
    }
    
    public init(face_image_url: String, prompt: String, style: Style? = nil, negative_prompt: String? = nil,
                num_inference_steps: Int? = nil, guidance_scale: Float? = nil, enable_lcm: Bool? = nil,
                controlnet_selection: ControlnetSelection? = nil, controlnet_selection_scale: Float? = nil,
                ip_adapter_scale: Float? = nil, identity_controlnet_conditioning_scale: Float? = nil,
                enhance_face_region: Bool? = nil, seed: UInt64? = nil) {
        self.face_image_url = face_image_url
        self.prompt = prompt
        self.style = style
        self.negative_prompt = negative_prompt
        self.num_inference_steps = num_inference_steps
        self.guidance_scale = guidance_scale
        self.enable_lcm = enable_lcm
        self.controlnet_selection = controlnet_selection
        self.controlnet_selection_scale = controlnet_selection_scale
        self.ip_adapter_scale = ip_adapter_scale
        self.identity_controlnet_conditioning_scale = identity_controlnet_conditioning_scale
        self.enhance_face_region = enhance_face_region
        self.seed = seed
    }
}

public struct FaceToImageResponse: Codable {
    public let image: Image
    public let seed: UInt64
}
