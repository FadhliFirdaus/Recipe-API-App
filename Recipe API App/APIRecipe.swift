//
//  APIRecipe.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation

    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let mainResponse = try MainResponse(json)

import Foundation
import OptionallyDecodable

struct MainResponse: Codable {
    var count: Int?
    var results: [Result]?
}

extension MainResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MainResponse.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        count: Int?? = nil,
        results: [Result]?? = nil
    ) -> MainResponse {
        return MainResponse(
            count: count ?? self.count,
            results: results ?? self.results
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

struct Result: Codable {
    var approvedAt: Int?
    var aspectRatio: String?
    var beautyURL, brand, brandID: String?
    var buzzID:Int?
    var canonicalID: String?
    var compilations: [Compilation]?
    var cookTimeMinutes: Int?
    @OptionallyDecodable var country: Country?
    var createdAt: Int?
    var credits: [Credit]?
    var description: String?
    @OptionallyDecodable var draftStatus: DraftStatus?
    var facebookPosts: [JSONAny]?
    var id: Int?
    var inspiredByURL: String?
    var instructions: [Instruction]?
    var isAppOnly, isOneTop, isShoppable, isSubscriberContent: Bool?
    var keywords: String?
    @OptionallyDecodable var language: Language?
    var name: String?
    var numServings: Int?
    var nutrition: Nutrition?
    var nutritionVisibility: String?
    var originalVideoURL: String?
    var prepTimeMinutes: Int?
    var price: Price?
    @OptionallyDecodable var promotion: Promotion?
    var renditions: [Rendition]?
    var sections: [Sectiong]?
    var seoPath, seoTitle, servingsNounPlural, servingsNounSingular: String?
    var show: Show?
    var showID: Int?
    var slug: String?
    var tags: [Tag]?
    var thumbnailAltText: String?
    var thumbnailURL: String?
    var tipsAndRatingsEnabled: Bool?
    var topics: [Topic]?
    var totalTimeMinutes: Int?
    var totalTimeTier: TotalTimeTier?
    var updatedAt: Int?
    var userRatings: UserRatings?
    @OptionallyDecodable var videoAdContent: VideoAdContent?
    var videoID: Int?
    var videoURL: String?
    var yields: String?
    
    enum CodingKeys: String, CodingKey {
        case approvedAt = "approved_at"
        case aspectRatio = "aspect_ratio"
        case beautyURL = "beauty_url"
        case brand
        case brandID = "brand_id"
        case buzzID = "buzz_id"
        case canonicalID = "canonical_id"
        case compilations
        case cookTimeMinutes = "cook_time_minutes"
        case country
        case createdAt = "created_at"
        case credits, description
        case draftStatus = "draft_status"
        case facebookPosts = "facebook_posts"
        case id
        case inspiredByURL = "inspired_by_url"
        case instructions
        case isAppOnly = "is_app_only"
        case isOneTop = "is_one_top"
        case isShoppable = "is_shoppable"
        case isSubscriberContent = "is_subscriber_content"
        case keywords, language, name
        case numServings = "num_servings"
        case nutrition
        case nutritionVisibility = "nutrition_visibility"
        case originalVideoURL = "original_video_url"
        case prepTimeMinutes = "prep_time_minutes"
        case price, promotion, renditions, sections = "sections"
        case seoPath = "seo_path"
        case seoTitle = "seo_title"
        case servingsNounPlural = "servings_noun_plural"
        case servingsNounSingular = "servings_noun_singular"
        case show
        case showID = "show_id"
        case slug, tags
        case thumbnailAltText = "thumbnail_alt_text"
        case thumbnailURL = "thumbnail_url"
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        case topics
        case totalTimeMinutes = "total_time_minutes"
        case totalTimeTier = "total_time_tier"
        case updatedAt = "updated_at"
        case userRatings = "user_ratings"
        case videoAdContent = "video_ad_content"
        case videoID = "video_id"
        case videoURL = "video_url"
        case yields
    }
}

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        approvedAt: Int?? = nil,
        aspectRatio: String?? = nil,
        beautyURL: String?? = nil,
        brand: String?? = nil,
        brandID: String?? = nil,
        buzzID: Int?? = nil,
        canonicalID: String?? = nil,
        compilations: [Compilation]?? = nil,
        cookTimeMinutes: Int?? = nil,
        country: Country?? = nil,
        createdAt: Int?? = nil,
        credits: [Credit]?? = nil,
        description: String?? = nil,
        draftStatus: DraftStatus?? = nil,
        facebookPosts: [JSONAny]?? = nil,
        id: Int?? = nil,
        inspiredByURL: String?? = nil,
        instructions: [Instruction]?? = nil,
        isAppOnly: Bool?? = nil,
        isOneTop: Bool?? = nil,
        isShoppable: Bool?? = nil,
        isSubscriberContent: Bool?? = nil,
        keywords: String?? = nil,
        language: Language?? = nil,
        name: String?? = nil,
        numServings: Int?? = nil,
        nutrition: Nutrition?? = nil,
        nutritionVisibility: String?? = nil,
        originalVideoURL: String?? = nil,
        prepTimeMinutes: Int?? = nil,
        price: Price?? = nil,
        promotion: Promotion?? = nil,
        renditions: [Rendition]?? = nil,
        sections: [Sectiong]?? = nil,
        seoPath: String?? = nil,
        seoTitle: String?? = nil,
        servingsNounPlural: String?? = nil,
        servingsNounSingular: String?? = nil,
        show: Show?? = nil,
        showID: Int?? = nil,
        slug: String?? = nil,
        tags: [Tag]?? = nil,
        thumbnailAltText: String?? = nil,
        thumbnailURL: String?? = nil,
        tipsAndRatingsEnabled: Bool?? = nil,
        topics: [Topic]?? = nil,
        totalTimeMinutes: Int?? = nil,
        totalTimeTier: TotalTimeTier?? = nil,
        updatedAt: Int?? = nil,
        userRatings: UserRatings?? = nil,
        videoAdContent: VideoAdContent?? = nil,
        videoID: Int?? = nil,
        videoURL: String?? = nil,
        yields: String?? = nil
    ) -> Result {
        return Result(
            approvedAt: approvedAt ?? self.approvedAt,
            aspectRatio: aspectRatio ?? self.aspectRatio,
            beautyURL: beautyURL ?? self.beautyURL,
            brand: brand ?? self.brand,
            brandID: brandID ?? self.brandID,
            buzzID: buzzID ?? self.buzzID,
            canonicalID: canonicalID ?? self.canonicalID,
            compilations: compilations ?? self.compilations,
            cookTimeMinutes: cookTimeMinutes ?? self.cookTimeMinutes,
            country: country ?? self.country,
            createdAt: createdAt ?? self.createdAt,
            credits: credits ?? self.credits,
            description: description ?? self.description,
            draftStatus: draftStatus ?? self.draftStatus,
            facebookPosts: facebookPosts ?? self.facebookPosts,
            id: id ?? self.id,
            inspiredByURL: inspiredByURL ?? self.inspiredByURL,
            instructions: instructions ?? self.instructions,
            isAppOnly: isAppOnly ?? self.isAppOnly,
            isOneTop: isOneTop ?? self.isOneTop,
            isShoppable: isShoppable ?? self.isShoppable,
            isSubscriberContent: isSubscriberContent ?? self.isSubscriberContent,
            keywords: keywords ?? self.keywords,
            language: language ?? self.language,
            name: name ?? self.name,
            numServings: numServings ?? self.numServings,
            nutrition: nutrition ?? self.nutrition,
            nutritionVisibility: nutritionVisibility ?? self.nutritionVisibility,
            originalVideoURL: originalVideoURL ?? self.originalVideoURL,
            prepTimeMinutes: prepTimeMinutes ?? self.prepTimeMinutes,
            price: price ?? self.price,
            promotion: promotion ?? self.promotion,
            renditions: renditions ?? self.renditions,
            sections: sections ?? self.sections,
            seoPath: seoPath ?? self.seoPath,
            seoTitle: seoTitle ?? self.seoTitle,
            servingsNounPlural: servingsNounPlural ?? self.servingsNounPlural,
            servingsNounSingular: servingsNounSingular ?? self.servingsNounSingular,
            show: show ?? self.show,
            showID: showID ?? self.showID,
            slug: slug ?? self.slug,
            tags: tags ?? self.tags,
            thumbnailAltText: thumbnailAltText ?? self.thumbnailAltText,
            thumbnailURL: thumbnailURL ?? self.thumbnailURL,
            tipsAndRatingsEnabled: tipsAndRatingsEnabled ?? self.tipsAndRatingsEnabled,
            topics: topics ?? self.topics,
            totalTimeMinutes: totalTimeMinutes ?? self.totalTimeMinutes,
            totalTimeTier: totalTimeTier ?? self.totalTimeTier,
            updatedAt: updatedAt ?? self.updatedAt,
            userRatings: userRatings ?? self.userRatings,
            videoAdContent: videoAdContent ?? self.videoAdContent,
            videoID: videoID ?? self.videoID,
            videoURL: videoURL ?? self.videoURL,
            yields: yields ?? self.yields
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

struct Compilation: Codable {
    var approvedAt: Int?
    var aspectRatio: String?
    var beautyURL:String?
    var buzzID: Int?
    var canonicalID: String?
    @OptionallyDecodable var country: Country?
    var createdAt: Int?
    var description: String?
    @OptionallyDecodable var draftStatus: DraftStatus?
    var facebookPosts: [JSONAny]?
    var id: Int?
    var isShoppable: Bool?
    var keywords: JSONNull?
    @OptionallyDecodable var language: Language?
    var name: String?
    @OptionallyDecodable var promotion: Promotion?
    var show: [Show]?
    var slug, thumbnailAltText: String?
    var thumbnailURL: String?
    var videoID: Int?
    var videoURL: String?
    
    enum CodingKeys: String, CodingKey {
        case approvedAt = "approved_at"
        case aspectRatio = "aspect_ratio"
        case beautyURL = "beauty_url"
        case buzzID = "buzz_id"
        case canonicalID = "canonical_id"
        case country
        case createdAt = "created_at"
        case description
        case draftStatus = "draft_status"
        case facebookPosts = "facebook_posts"
        case id
        case isShoppable = "is_shoppable"
        case keywords, language, name, promotion, show, slug
        case thumbnailAltText = "thumbnail_alt_text"
        case thumbnailURL = "thumbnail_url"
        case videoID = "video_id"
        case videoURL = "video_url"
    }
}

    // MARK: Compilation convenience initializers and mutators

extension Compilation {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Compilation.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        approvedAt: Int?? = nil,
        aspectRatio: String?? = nil,
        beautyURL: String?? = nil,
        buzzID: Int?? = nil,
        canonicalID: String?? = nil,
        country: Country?? = nil,
        createdAt: Int?? = nil,
        description: String?? = nil,
        draftStatus: DraftStatus?? = nil,
        facebookPosts: [JSONAny]?? = nil,
        id: Int?? = nil,
        isShoppable: Bool?? = nil,
        keywords: JSONNull?? = nil,
        language: Language?? = nil,
        name: String?? = nil,
        promotion: Promotion?? = nil,
        show: [Show]?? = nil,
        slug: String?? = nil,
        thumbnailAltText: String?? = nil,
        thumbnailURL: String?? = nil,
        videoID: Int?? = nil,
        videoURL: String?? = nil
    ) -> Compilation {
        return Compilation(
            approvedAt: approvedAt ?? self.approvedAt,
            aspectRatio: aspectRatio ?? self.aspectRatio,
            beautyURL: beautyURL ?? self.beautyURL,
            buzzID: buzzID ?? self.buzzID,
            canonicalID: canonicalID ?? self.canonicalID,
            country: country ?? self.country,
            createdAt: createdAt ?? self.createdAt,
            description: description ?? self.description,
            draftStatus: draftStatus ?? self.draftStatus,
            facebookPosts: facebookPosts ?? self.facebookPosts,
            id: id ?? self.id,
            isShoppable: isShoppable ?? self.isShoppable,
            keywords: keywords ?? self.keywords,
            language: language ?? self.language,
            name: name ?? self.name,
            promotion: promotion ?? self.promotion,
            show: show ?? self.show,
            slug: slug ?? self.slug,
            thumbnailAltText: thumbnailAltText ?? self.thumbnailAltText,
            thumbnailURL: thumbnailURL ?? self.thumbnailURL,
            videoID: videoID ?? self.videoID,
            videoURL: videoURL ?? self.videoURL
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Country: String, Codable {
    case us = "US"
}

enum DraftStatus: String, Codable {
    case published = "published"
}

enum Language: String, Codable {
    case eng = "eng"
}

enum Promotion: String, Codable {
    case full = "full"
    case partial = "partial"
}

struct Show: Codable {
    var id: Int?
    @OptionallyDecodable var name: Name?
}

extension Show {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Show.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int?? = nil,
        name: Name?? = nil
    ) -> Show {
        return Show(
            id: id ?? self.id,
            name: name ?? self.name
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Name: String, Codable {
    case goodful = "Goodful"
    case tasty = "Tasty"
}

struct Credit: Codable {
    var name, type: String?
}

extension Credit {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Credit.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        name: String?? = nil,
        type: String?? = nil
    ) -> Credit {
        return Credit(
            name: name ?? self.name,
            type: type ?? self.type
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

struct Instruction: Codable {
    var appliance: String?
    var displayText: String?
    var endTime, id, position, startTime: Int?
    var temperature: Int?
    
    enum CodingKeys: String, CodingKey {
        case appliance
        case displayText = "display_text"
        case endTime = "end_time"
        case id, position
        case startTime = "start_time"
        case temperature
    }
}

extension Instruction {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Instruction.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        appliance: String?? = nil,
        displayText: String?? = nil,
        endTime: Int?? = nil,
        id: Int?? = nil,
        position: Int?? = nil,
        startTime: Int?? = nil,
        temperature: Int?? = nil
    ) -> Instruction {
        return Instruction(
            appliance: appliance ?? self.appliance,
            displayText: displayText ?? self.displayText,
            endTime: endTime ?? self.endTime,
            id: id ?? self.id,
            position: position ?? self.position,
            startTime: startTime ?? self.startTime,
            temperature: temperature ?? self.temperature
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Nutrition
struct Nutrition: Codable {
    var calories, carbohydrates, fat, fiber: Int?
    var protein, sugar: Int?
    var updatedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case calories, carbohydrates, fat, fiber, protein, sugar
        case updatedAt = "updated_at"
    }
}

extension Nutrition {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Nutrition.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        calories: Int?? = nil,
        carbohydrates: Int?? = nil,
        fat: Int?? = nil,
        fiber: Int?? = nil,
        protein: Int?? = nil,
        sugar: Int?? = nil,
        updatedAt: Date?? = nil
    ) -> Nutrition {
        return Nutrition(
            calories: calories ?? self.calories,
            carbohydrates: carbohydrates ?? self.carbohydrates,
            fat: fat ?? self.fat,
            fiber: fiber ?? self.fiber,
            protein: protein ?? self.protein,
            sugar: sugar ?? self.sugar,
            updatedAt: updatedAt ?? self.updatedAt
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

struct Price: Codable {
    var consumptionPortion, consumptionTotal, portion, total: Int?
    var updatedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case consumptionPortion = "consumption_portion"
        case consumptionTotal = "consumption_total"
        case portion, total
        case updatedAt = "updated_at"
    }
}

extension Price {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Price.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        consumptionPortion: Int?? = nil,
        consumptionTotal: Int?? = nil,
        portion: Int?? = nil,
        total: Int?? = nil,
        updatedAt: Date?? = nil
    ) -> Price {
        return Price(
            consumptionPortion: consumptionPortion ?? self.consumptionPortion,
            consumptionTotal: consumptionTotal ?? self.consumptionTotal,
            portion: portion ?? self.portion,
            total: total ?? self.total,
            updatedAt: updatedAt ?? self.updatedAt
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Rendition
struct Rendition: Codable {
    var aspect: String?
    var bitRate: Int?
    var container, contentType: String?
    var duration: Int?
    var fileSize: Int?
    var height: Int?
    var maximumBitRate, minimumBitRate: Int?
    var name: String?
    var posterURL: String?
    var url: String?
    var width: Int?
    
    enum CodingKeys: String, CodingKey {
        case aspect
        case bitRate = "bit_rate"
        case container
        case contentType = "content_type"
        case duration
        case fileSize = "file_size"
        case height
        case maximumBitRate = "maximum_bit_rate"
        case minimumBitRate = "minimum_bit_rate"
        case name
        case posterURL = "poster_url"
        case url, width
    }
}
extension Rendition {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Rendition.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        aspect: String?? = nil,
        bitRate: Int?? = nil,
        container: String?? = nil,
        contentType: String?? = nil,
        duration: Int?? = nil,
        fileSize: Int?? = nil,
        height: Int?? = nil,
        maximumBitRate: Int?? = nil,
        minimumBitRate: Int?? = nil,
        name: String?? = nil,
        posterURL: String?? = nil,
        url: String?? = nil,
        width: Int?? = nil
    ) -> Rendition {
        return Rendition(
            aspect: aspect ?? self.aspect,
            bitRate: bitRate ?? self.bitRate,
            container: container ?? self.container,
            contentType: contentType ?? self.contentType,
            duration: duration ?? self.duration,
            fileSize: fileSize ?? self.fileSize,
            height: height ?? self.height,
            maximumBitRate: maximumBitRate ?? self.maximumBitRate,
            minimumBitRate: minimumBitRate ?? self.minimumBitRate,
            name: name ?? self.name,
            posterURL: posterURL ?? self.posterURL,
            url: url ?? self.url,
            width: width ?? self.width
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Section
struct Sectiong: Codable {
    var components: [Component]?
    var name: String?
    var position: Int?
    
}

    // MARK: Section convenience initializers and mutators

extension Sectiong {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Sectiong.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        components: [Component]?? = nil,
        name: String?? = nil,
        position: Int?? = nil
    ) -> Sectiong {
        return Sectiong(
            components: components ?? self.components,
            name: name ?? self.name,
            position: position ?? self.position
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Component
struct Component: Codable {
    var extraComment: String?
    var id: Int?
    var ingredient: Ingredient?
    var measurements: [Measurement]?
    var position: Int?
    var rawText: String?
    
    enum CodingKeys: String, CodingKey {
        case extraComment = "extra_comment"
        case id, ingredient, measurements, position
        case rawText = "raw_text"
    }
}

    // MARK: Component convenience initializers and mutators

extension Component {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Component.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        extraComment: String?? = nil,
        id: Int?? = nil,
        ingredient: Ingredient?? = nil,
        measurements: [Measurement]?? = nil,
        position: Int?? = nil,
        rawText: String?? = nil
    ) -> Component {
        return Component(
            extraComment: extraComment ?? self.extraComment,
            id: id ?? self.id,
            ingredient: ingredient ?? self.ingredient,
            measurements: measurements ?? self.measurements,
            position: position ?? self.position,
            rawText: rawText ?? self.rawText
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Ingredient
struct Ingredient: Codable {
    var createdAt: Int?
    var displayPlural, displaySingular: String?
    var id: Int?
    var name: String?
    var updatedAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case displayPlural = "display_plural"
        case displaySingular = "display_singular"
        case id, name
        case updatedAt = "updated_at"
    }
}

    // MARK: Ingredient convenience initializers and mutators

extension Ingredient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ingredient.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        createdAt: Int?? = nil,
        displayPlural: String?? = nil,
        displaySingular: String?? = nil,
        id: Int?? = nil,
        name: String?? = nil,
        updatedAt: Int?? = nil
    ) -> Ingredient {
        return Ingredient(
            createdAt: createdAt ?? self.createdAt,
            displayPlural: displayPlural ?? self.displayPlural,
            displaySingular: displaySingular ?? self.displaySingular,
            id: id ?? self.id,
            name: name ?? self.name,
            updatedAt: updatedAt ?? self.updatedAt
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Measurement
struct Measurement: Codable {
    var id: Int?
    var quantity: String?
    var unit: Unit?
}

    // MARK: Measurement convenience initializers and mutators

extension Measurement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Measurement.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int?? = nil,
        quantity: String?? = nil,
        unit: Unit?? = nil
    ) -> Measurement {
        return Measurement(
            id: id ?? self.id,
            quantity: quantity ?? self.quantity,
            unit: unit ?? self.unit
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Unit
struct Unit: Codable {
    var abbreviation, displayPlural, displaySingular, name: String?
    @OptionallyDecodable var system: VideoAdContent?
    
    enum CodingKeys: String, CodingKey {
        case abbreviation
        case displayPlural = "display_plural"
        case displaySingular = "display_singular"
        case name, system
    }
}

    // MARK: Unit convenience initializers and mutators

extension Unit {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Unit.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        abbreviation: String?? = nil,
        displayPlural: String?? = nil,
        displaySingular: String?? = nil,
        name: String?? = nil,
        system: VideoAdContent?? = nil
    ) -> Unit {
        return Unit(
            abbreviation: abbreviation ?? self.abbreviation,
            displayPlural: displayPlural ?? self.displayPlural,
            displaySingular: displaySingular ?? self.displaySingular,
            name: name ?? self.name,
            system: system ?? self.system
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum VideoAdContent: String, Codable {
    case imperial = "imperial"
    case metric = "metric"
    case none = "none"
}

    // MARK: - Tag
struct Tag: Codable {
    var displayName: String?
    var id: Int?
    var name, rootTagType, type: String?
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case id, name
        case rootTagType = "root_tag_type"
        case type
    }
}

    // MARK: Tag convenience initializers and mutators

extension Tag {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Tag.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        displayName: String?? = nil,
        id: Int?? = nil,
        name: String?? = nil,
        rootTagType: String?? = nil,
        type: String?? = nil
    ) -> Tag {
        return Tag(
            displayName: displayName ?? self.displayName,
            id: id ?? self.id,
            name: name ?? self.name,
            rootTagType: rootTagType ?? self.rootTagType,
            type: type ?? self.type
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Topic
struct Topic: Codable {
    var name, slug: String?
}

    // MARK: Topic convenience initializers and mutators

extension Topic {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Topic.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        name: String?? = nil,
        slug: String?? = nil
    ) -> Topic {
        return Topic(
            name: name ?? self.name,
            slug: slug ?? self.slug
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - TotalTimeTier
struct TotalTimeTier: Codable {
    var displayTier, tier: String?
    
    enum CodingKeys: String, CodingKey {
        case displayTier = "display_tier"
        case tier
    }
}

    // MARK: TotalTimeTier convenience initializers and mutators

extension TotalTimeTier {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TotalTimeTier.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        displayTier: String?? = nil,
        tier: String?? = nil
    ) -> TotalTimeTier {
        return TotalTimeTier(
            displayTier: displayTier ?? self.displayTier,
            tier: tier ?? self.tier
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - UserRatings
struct UserRatings: Codable {
    var countNegative, countPositive: Int?
    var score: Double?
    
    enum CodingKeys: String, CodingKey {
        case countNegative = "count_negative"
        case countPositive = "count_positive"
        case score
    }
}

    // MARK: UserRatings convenience initializers and mutators

extension UserRatings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserRatings.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        countNegative: Int?? = nil,
        countPositive: Int?? = nil,
        score: Double?? = nil
    ) -> UserRatings {
        return UserRatings(
            countNegative: countNegative ?? self.countNegative,
            countPositive: countPositive ?? self.countPositive,
            score: score ?? self.score
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

    // MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

    // MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
