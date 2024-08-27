import Foundation
import ArgumentParser
import Fal

@main
struct Cmd: AsyncParsableCommand {
    
    static var configuration = CommandConfiguration(
        abstract: "A utility for interacting with the Fal API.",
        version: "0.0.1",
        subcommands: [
            TextToImage.self,
            ImageToImage.self,
            FaceToImage.self,
            FaceSwapToImage.self,
        ]
    )
}

struct Options: ParsableArguments {
    @Option(help: "Your Fal API key.")
    var token = ""
    
    @Option(help: "Model to use.")
    var model = ""
    
    @Option(help: "URL or HuggingFace ID of the base model to generate the image.")
    var modelName = ""
    
    @Option(help: "The image to use.")
    var imageURL = ""
    
    @Option(help: "The image to swap.")
    var swapImageURL = ""
    
    @Argument(help: "You prompt")
    var prompt = ""
}

struct TextToImage: AsyncParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Returns an image based on a given text prompt.")
    
    @OptionGroup var options: Options
    
    func run() async throws {
        let client = FalClient(configuration: .init(token: options.token))
        let modelName = options.modelName.isEmpty ? nil : options.modelName
        let payload = TextToImageRequest(prompt: options.prompt, modelName: modelName)
        let resp = try await client.textToImage(payload, model: options.model)
        print(resp)
    }
}

struct ImageToImage: AsyncParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Returns an image based on a given image")
    
    @OptionGroup var options: Options
    
    func run() async throws {
        let client = FalClient(configuration: .init(token: options.token))
        let payload = ImageToImageRequest(imageURL: options.imageURL, prompt: options.prompt)
        let resp = try await client.imageToImage(payload, model: options.model)
        print(resp)
    }
}

struct FaceToImage: AsyncParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Returns an image based on a given image of a face")
    
    @OptionGroup var options: Options
    
    func run() async throws {
        let client = FalClient(configuration: .init(token: options.token))
        let payload = FaceToImageRequest(faceImageURL: options.imageURL, prompt: options.prompt)
        let resp = try await client.faceToImage(payload, model: options.model)
        print(resp)
    }
}

struct FaceSwapToImage: AsyncParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Returns face swapped image")
    
    @OptionGroup var options: Options
    
    func run() async throws {
        let client = FalClient(configuration: .init(token: options.token))
        let payload = FaceSwapToImageRequest(baseImageURL: options.imageURL, swapImageURL: options.swapImageURL)
        let resp = try await client.faceSwapToImage(payload, model: options.model)
        print(resp)
    }
}
