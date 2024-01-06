/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ImageEntity : Codable {
	let comment_count : String?
	let favorite : Bool?
	let width : Int?
	let ups : String?
	let datetime : Int?
	let score : String?
	let in_gallery : Bool?
	let tags : [String]?
	let is_ad : Bool?
	let account_id : String?
	let has_sound : Bool?
	let description : String?
	let edited : String?
	let id : String?
	let views : Int?
	let bandwidth : Int?
	let nsfw : String?
	let size : Int?
	let points : String?
	let downs : String?
	let animated : Bool?
	let in_most_viral : Bool?
	let type : String?
	let section : String?
	let account_url : String?
	let vote : String?
	let link : String?
	let ad_url : String?
	let title : String?
	let ad_type : Int?
	let favorite_count : String?
	let height : Int?

	enum CodingKeys: String, CodingKey {

		case comment_count = "comment_count"
		case favorite = "favorite"
		case width = "width"
		case ups = "ups"
		case datetime = "datetime"
		case score = "score"
		case in_gallery = "in_gallery"
		case tags = "tags"
		case is_ad = "is_ad"
		case account_id = "account_id"
		case has_sound = "has_sound"
		case description = "description"
		case edited = "edited"
		case id = "id"
		case views = "views"
		case bandwidth = "bandwidth"
		case nsfw = "nsfw"
		case size = "size"
		case points = "points"
		case downs = "downs"
		case animated = "animated"
		case in_most_viral = "in_most_viral"
		case type = "type"
		case section = "section"
		case account_url = "account_url"
		case vote = "vote"
		case link = "link"
		case ad_url = "ad_url"
		case title = "title"
		case ad_type = "ad_type"
		case favorite_count = "favorite_count"
		case height = "height"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		comment_count = try values.decodeIfPresent(String.self, forKey: .comment_count)
		favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		ups = try values.decodeIfPresent(String.self, forKey: .ups)
		datetime = try values.decodeIfPresent(Int.self, forKey: .datetime)
		score = try values.decodeIfPresent(String.self, forKey: .score)
		in_gallery = try values.decodeIfPresent(Bool.self, forKey: .in_gallery)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		is_ad = try values.decodeIfPresent(Bool.self, forKey: .is_ad)
		account_id = try values.decodeIfPresent(String.self, forKey: .account_id)
		has_sound = try values.decodeIfPresent(Bool.self, forKey: .has_sound)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		edited = try values.decodeIfPresent(String.self, forKey: .edited)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
		bandwidth = try values.decodeIfPresent(Int.self, forKey: .bandwidth)
		nsfw = try values.decodeIfPresent(String.self, forKey: .nsfw)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		points = try values.decodeIfPresent(String.self, forKey: .points)
		downs = try values.decodeIfPresent(String.self, forKey: .downs)
		animated = try values.decodeIfPresent(Bool.self, forKey: .animated)
		in_most_viral = try values.decodeIfPresent(Bool.self, forKey: .in_most_viral)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		account_url = try values.decodeIfPresent(String.self, forKey: .account_url)
		vote = try values.decodeIfPresent(String.self, forKey: .vote)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		ad_url = try values.decodeIfPresent(String.self, forKey: .ad_url)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		ad_type = try values.decodeIfPresent(Int.self, forKey: .ad_type)
		favorite_count = try values.decodeIfPresent(String.self, forKey: .favorite_count)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
	}

}
