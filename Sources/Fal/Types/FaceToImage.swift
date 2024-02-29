import Foundation

public struct FaceToImageRequest: Codable {
    public var faceImageURL: String
    public var prompt: String
    public var style: Style?
    public var negativePrompt: String?
    public var numInferenceSteps: Int?
    public var guidanceScale: Float?
    public var enableLcm: Bool?
    public var controlnetSelection: ControlnetSelection?
    public var controlnetSelectionScale: Float?
    public var ipAdapterScale: Float?
    public var identityControlnetConditioningScale: Float?
    public var enhanceFaceRegion: Bool?
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
    
    enum CodingKeys: String, CodingKey {
        case faceImageURL = "face_image_url"
        case prompt
        case style
        case negativePrompt = "negative_prompt"
        case numInferenceSteps = "num_inference_steps"
        case guidanceScale = "guidance_scale"
        case enableLcm = "enable_lcm"
        case controlnetSelection = "controlnet_selection"
        case controlnetSelectionScale = "controlnet_selection_scale"
        case ipAdapterScale = "ip_adapter_scale"
        case identityControlnetConditioningScale = "identity_controlnet_conditioning_scale"
        case enhanceFaceRegion = "enhance_face_region"
        case seed
    }
    
    public init(faceImageURL: String, prompt: String, style: Style? = nil, negativePrompt: String? = nil,
                numInferenceSteps: Int? = nil, guidanceScale: Float? = nil, enableLcm: Bool? = nil,
                controlnetSelection: ControlnetSelection? = nil, controlnetSelectionScale: Float? = nil,
                ipAdapterScale: Float? = nil, identityControlnetConditioningScale: Float? = nil,
                enhanceFaceRegion: Bool? = nil, seed: UInt64? = nil) {
        self.faceImageURL = faceImageURL
        self.prompt = prompt
        self.style = style
        self.negativePrompt = negativePrompt
        self.numInferenceSteps = numInferenceSteps
        self.guidanceScale = guidanceScale
        self.enableLcm = enableLcm
        self.controlnetSelection = controlnetSelection
        self.controlnetSelectionScale = controlnetSelectionScale
        self.ipAdapterScale = ipAdapterScale
        self.identityControlnetConditioningScale = identityControlnetConditioningScale
        self.enhanceFaceRegion = enhanceFaceRegion
        self.seed = seed
    }
}

public struct FaceToImageResponse: Codable {
    public let image: Image
    public let seed: UInt64
}
