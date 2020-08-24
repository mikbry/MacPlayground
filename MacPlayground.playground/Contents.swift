import Cocoa

struct Input: Decodable {
    let text: String
    enum CodingKeys: String, CodingKey {
        case text
    }
    init(from decoder: Decoder) throws {
        let singleValue = try! decoder.singleValueContainer()
        print(singleValue)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try values.decode(String.self, forKey: .text)
    }
}

struct Intent: Decodable {
    let input: Array<Input>
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
