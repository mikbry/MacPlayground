import Cocoa

struct Intent: Decodable {
    let input: String
    let output: String
}

struct Bot: Decodable {
    let name: String
    let intents: Array<Intent>
}

let decoder = JSONDecoder()
let fileURL = Bundle.main.url(forResource: "data", withExtension: "json")
let bot: Bot = try! decoder.decode(Bot.self, from: Data(contentsOf: fileURL!))
print(bot)
