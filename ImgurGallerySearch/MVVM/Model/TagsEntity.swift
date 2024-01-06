/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TagsEntity : Codable {
	let accent : String?
	let followers : Int?
	let description : String?
	let total_items : Int?
	let is_whitelisted : Bool?
	let thumbnail_hash : String?
	let logo_destination_url : String?
	let is_promoted : Bool?
	let background_hash : String?
	let background_is_animated : Bool?
	let display_name : String?
	let logo_hash : String?
	let name : String?
	let following : Bool?
	let thumbnail_is_animated : Bool?

	enum CodingKeys: String, CodingKey {

		case accent = "accent"
		case followers = "followers"
		case description = "description"
		case total_items = "total_items"
		case is_whitelisted = "is_whitelisted"
		case thumbnail_hash = "thumbnail_hash"
		case logo_destination_url = "logo_destination_url"
		case is_promoted = "is_promoted"
		case background_hash = "background_hash"
		case background_is_animated = "background_is_animated"
		case display_name = "display_name"
		case logo_hash = "logo_hash"
		case name = "name"
		case following = "following"
		case thumbnail_is_animated = "thumbnail_is_animated"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accent = try values.decodeIfPresent(String.self, forKey: .accent)
		followers = try values.decodeIfPresent(Int.self, forKey: .followers)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		total_items = try values.decodeIfPresent(Int.self, forKey: .total_items)
		is_whitelisted = try values.decodeIfPresent(Bool.self, forKey: .is_whitelisted)
		thumbnail_hash = try values.decodeIfPresent(String.self, forKey: .thumbnail_hash)
		logo_destination_url = try values.decodeIfPresent(String.self, forKey: .logo_destination_url)
		is_promoted = try values.decodeIfPresent(Bool.self, forKey: .is_promoted)
		background_hash = try values.decodeIfPresent(String.self, forKey: .background_hash)
		background_is_animated = try values.decodeIfPresent(Bool.self, forKey: .background_is_animated)
		display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
		logo_hash = try values.decodeIfPresent(String.self, forKey: .logo_hash)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		following = try values.decodeIfPresent(Bool.self, forKey: .following)
		thumbnail_is_animated = try values.decodeIfPresent(Bool.self, forKey: .thumbnail_is_animated)
	}

}
