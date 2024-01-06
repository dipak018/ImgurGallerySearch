/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AlbumEntity : Codable {
	let layout : String?
	let comment_count : Int?
	let score : Int?
	let include_album_ads : Bool?
	let id : String?
	let downs : Int?
	let images_count : Int?
	let ad_type : Int?
	let description : String?
	let cover_height : Int?
	let is_album : Bool?
	let topic : String?
	let cover_width : Int?
	let images : [ImageEntity]?
	let in_gallery : Bool?
	let tags : [TagsEntity]?
	let nsfw : Bool?
	let account_id : Int?
	let cover : String?
	let ad_url : String?
	let privacy : String?
	let favorite : Bool?
	let favorite_count : Int?
	let points : Int?
	let datetime : Int?
	let in_most_viral : Bool?
	let views : Int?
	let is_ad : Bool?
	let title : String?
	let vote : String?
	let topic_id : String?
	let section : String?
	let ups : Int?
	let account_url : String?
	let link : String?

	enum CodingKeys: String, CodingKey {

		case layout = "layout"
		case comment_count = "comment_count"
		case score = "score"
		case include_album_ads = "include_album_ads"
		case id = "id"
		case downs = "downs"
		case images_count = "images_count"
		case ad_type = "ad_type"
		case description = "description"
		case cover_height = "cover_height"
		case is_album = "is_album"
		case topic = "topic"
		case cover_width = "cover_width"
		case images = "images"
		case in_gallery = "in_gallery"
		case tags = "tags"
		case nsfw = "nsfw"
		case account_id = "account_id"
		case cover = "cover"
		case ad_url = "ad_url"
		case privacy = "privacy"
		case favorite = "favorite"
		case favorite_count = "favorite_count"
		case points = "points"
		case datetime = "datetime"
		case in_most_viral = "in_most_viral"
		case views = "views"
		case is_ad = "is_ad"
		case title = "title"
		case vote = "vote"
		case topic_id = "topic_id"
		case section = "section"
		case ups = "ups"
		case account_url = "account_url"
		case link = "link"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		layout = try values.decodeIfPresent(String.self, forKey: .layout)
		comment_count = try values.decodeIfPresent(Int.self, forKey: .comment_count)
		score = try values.decodeIfPresent(Int.self, forKey: .score)
		include_album_ads = try values.decodeIfPresent(Bool.self, forKey: .include_album_ads)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		downs = try values.decodeIfPresent(Int.self, forKey: .downs)
		images_count = try values.decodeIfPresent(Int.self, forKey: .images_count)
		ad_type = try values.decodeIfPresent(Int.self, forKey: .ad_type)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		cover_height = try values.decodeIfPresent(Int.self, forKey: .cover_height)
		is_album = try values.decodeIfPresent(Bool.self, forKey: .is_album)
		topic = try values.decodeIfPresent(String.self, forKey: .topic)
		cover_width = try values.decodeIfPresent(Int.self, forKey: .cover_width)
		images = try values.decodeIfPresent([ImageEntity].self, forKey: .images)
		in_gallery = try values.decodeIfPresent(Bool.self, forKey: .in_gallery)
		tags = try values.decodeIfPresent([TagsEntity].self, forKey: .tags)
		nsfw = try values.decodeIfPresent(Bool.self, forKey: .nsfw)
		account_id = try values.decodeIfPresent(Int.self, forKey: .account_id)
		cover = try values.decodeIfPresent(String.self, forKey: .cover)
		ad_url = try values.decodeIfPresent(String.self, forKey: .ad_url)
		privacy = try values.decodeIfPresent(String.self, forKey: .privacy)
		favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite)
		favorite_count = try values.decodeIfPresent(Int.self, forKey: .favorite_count)
		points = try values.decodeIfPresent(Int.self, forKey: .points)
		datetime = try values.decodeIfPresent(Int.self, forKey: .datetime)
		in_most_viral = try values.decodeIfPresent(Bool.self, forKey: .in_most_viral)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
		is_ad = try values.decodeIfPresent(Bool.self, forKey: .is_ad)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		vote = try values.decodeIfPresent(String.self, forKey: .vote)
		topic_id = try values.decodeIfPresent(String.self, forKey: .topic_id)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		ups = try values.decodeIfPresent(Int.self, forKey: .ups)
		account_url = try values.decodeIfPresent(String.self, forKey: .account_url)
		link = try values.decodeIfPresent(String.self, forKey: .link)
	}

}
