//
//  ModelData.swift
//  Landmarks
//
//  Created by Jenny Shalai on 2022-11-22.
//

import Foundation
import Combine

// SwiftUI subscribes to your observable object, and
// updates any views that need refreshing when the data changes
final class ModelData: ObservableObject {
    // An observable object needs to publish any changes to its data, so
    // that its subscribers can pick up the change
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
