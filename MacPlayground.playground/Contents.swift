import Cocoa

struct Input {
    let text: String
}

extension Input: Decodable {
    enum CodingKeys: String, CodingKey {
        case text
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
    }
}

struct Intent {
    let input: Input
    let output: String
}

extension Intent: Decodable {
    enum CodingKeys: String, CodingKey {
        case input
        case output
    }
       
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        input = try container.decode(Input.self, forKey: .input)
        output = try container.decode(String.self, forKey: .output)
    }
}

struct Bot: Decodable {
    let name: String
    let intents: Array<Intent>
}

let decoder = JSONDecoder()
let fileURL = Bundle.main.url(forResource: "data", withExtension: "json")
let bot: Bot = try! decoder.decode(Bot.self, from: Data(contentsOf: fileURL!))
print(bot)
