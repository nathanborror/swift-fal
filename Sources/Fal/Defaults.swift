import Foundation

public struct Defaults {
    
    public static let models: [Model] = [

        // Text to image
        
        .init(id: "fast-sdxl", name: "Stable Diffusion XL", owner: "fal"),
        .init(id: "stable-cascade", name: "Stable Cascade", owner: "fal"),
        .init(id: "stable-diffusion-v35-large", name: "Stable Diffusion 3.5 (large)", owner: "fal"),
        .init(id: "stable-diffusion-v35-medium", name: "Stable Diffusion 3.5 (medium)", owner: "fal"),
        .init(id: "flux-general", name: "Flux (general)", owner: "fal"),
        .init(id: "flux/dev", name: "Flux (dev)", owner: "fal"),
        .init(id: "flux-pro", name: "Flux (pro)", owner: "fal"),
        .init(id: "flux-pro/v1.1-ultra", name: "Flux (pro ultra)", owner: "fal"),
        .init(id: "ideogram/v2", name: "Ideogram (v2)", owner: "fal"),
        .init(id: "stable-cascade", name: "Stable Cascade", owner: "fal"),

        // Text-to-speech

        .init(id: "dia-tts", name: "Dia TTS", owner: "fal"),
        .init(id: "dia-tts/voice-clone", name: "Dia TTS (Voice Clone)", owner: "fal"),
        .init(id: "minimax-tts/text-to-speech", name: "MiniMax TTS", owner: "fal"),
        .init(id: "minimax-tts/voice-clone", name: "MiniMax TTS (Voice Clone)", owner: "fal"),
    ]
}
