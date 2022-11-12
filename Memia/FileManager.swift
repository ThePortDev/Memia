//
//  FileManager.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import Foundation

class FilesManager {
    
    enum Error: Swift.Error {
        case readingFailed
        case fileDoesntExist
        case fileAlreadyExists
        case invalidDirectory
        case writingFailed
    }
    
    let fileManager: FileManager
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    func save(fileNamed: String, data: Data) throws {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            throw Error.invalidDirectory
        }
        if fileManager.fileExists(atPath: url.absoluteString) {
            throw Error.fileAlreadyExists
        }
        do {
            try data.write(to: url)
        } catch {
            debugPrint(error)
            throw Error.writingFailed
        }
    }
    private func makeURL(forFileNamed fileName: String) -> URL? {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(fileName)
    }
    
    func read(fileNamed: String) throws -> Data {
           guard let url = makeURL(forFileNamed: fileNamed) else {
               throw Error.invalidDirectory
           }
           guard fileManager.fileExists(atPath: url.absoluteString) else {
               throw Error.fileDoesntExist
           }
           do {
               return try Data(contentsOf: url)
           } catch {
               debugPrint(error)
               throw Error.readingFailed
           }
       }

}

