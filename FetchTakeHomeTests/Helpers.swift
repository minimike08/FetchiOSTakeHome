//
//  Helpers.swift
//  FetchTakeHomeTests
//
//  Created by Mike on 9/2/24.
//

import Foundation

extension Data {
    static func fromFile(named fileName: String, withExtension fileExtension: String, inBundle bundle: Bundle) -> Data {
        let fileURL = bundle.url(forResource: fileName, withExtension: fileExtension)!
        return try! Data(contentsOf: fileURL, options: .uncached)
    }
    
    static func fromJsonFile(named fileName: String, inBundle bundle: Bundle) -> Data {
        return self.fromFile(named: fileName, withExtension: "json", inBundle: bundle)
    }
}

extension Decodable {
    static func instanceDecodedFromJSONFile(_ fileName: String, inBundle bundle: Bundle, jsonDecoder: JSONDecoder = .init()) throws -> Self {
        let data = Data.fromJsonFile(named: fileName, inBundle: bundle)
        return try jsonDecoder.decode(Self.self, from: data)
    }
}
