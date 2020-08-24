import Cocoa

struct Input: Decodable {
    let text: String
    enum CodingKeys: String, CodingKey {
        case text
    }
}

extension Input {
    init(from decoder: Decoder) throws {
        /* let singleValue = try! decoder.singleValueContainer()
        print(singleValue) */
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decode(String.self, forKey: .text)
    }
}

struct Intent: Decodable {
    let input: Input
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
