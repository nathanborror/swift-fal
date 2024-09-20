import Foundation

public struct Defaults {
    
    public static let apiHost = URL(string: "https://fal.run/fal-ai")!
    
    public static let models: [Model] = [
        .init(id: "fast-sdxl", name: "Stable Diffusion XL", owner: "fal"),
        .init(id: "flux/dev", name: "Flux (dev)", owner: "fal"),
        .init(id: "flux-pro", name: "Flux (pro)", owner: "fal"),
        .init(id: "stable-cascade", name: "Stable Cascade", owner: "fal"),
    ]
}
