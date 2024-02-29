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
        ]
    )
}

struct Options: ParsableArguments {
    @Option(help: "Your API token.")
    var token = ""
    
    @Option(help: "Model to use.")
    var model = ""
    
    @Argument(help: "Your messages.")
    var prompt = ""
}

struct TextToImage: AsyncParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Completes a chat request.")
    
    @OptionGroup var options: Options
    
    func run() async throws {
        let client = FalClient(token: options.token)
        let payload = TextToImageRequest(prompt: options.prompt)
        let resp = try await client.textToImage(payload)
        print(resp)
    }
}
