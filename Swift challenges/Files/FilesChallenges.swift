//
//  FilesChallenges.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 03.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

public final class FilesChallenges {

    // Method accepts a filename on disk then prints last N lines  in reverse order
    public static func challenge1(filename: String, lineCount: Int) {
        guard let input = try? String(contentsOfFile: filename) else { return }
        
        var lines = input.components(separatedBy: "\n")
        guard lines.count > 0 else { return }
        
        lines.reverse()
        
        var output = [String]()
        for i in 0 ..< min(lines.count, lineCount) {
            output.append(lines[i])
        }
        
        print(output.joined(separator: ", "))
    }
    
    // Method to write a logging function that accepts accepts a path to a log file on disk as well as a new log message. Your function should open the log file (or create it if it does not already exist), then append the new message to the log along with the current time and date
    public static func challenge2(log message: String, to logFile: String)  {
        var existingLog = (try? String(contentsOfFile: logFile)) ?? ""
        
        existingLog.append("\(Date()): \(message)\n")
        
        do {
            try existingLog.write(toFile: logFile, atomically: true, encoding: .utf8)
        } catch {
            print("Failed to write to log: \(error.localizedDescription)")
        }
    }
    
    // Method to get a URL to the user's documents directory
    public static func challenge3() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Method that accepts a path to a directory and returns an array of all JPEGs that have been created in the last 48 hours
    public static func challenge4(in directory: String) -> [String] {
        let fm = FileManager.default
        let directoryURL = URL(fileURLWithPath: directory)
        guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
        
        var jpegs = [String]()
        
        for file in files {
            if file.pathExtension == "jpg" || file.pathExtension == "jpeg" {
                guard let attributes = try? fm.attributesOfItem(atPath: file.path) else { continue }
                guard let creationDate = attributes[.creationDate] as? Date else { continue }
                
                if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                    jpegs.append(file.lastPathComponent)
                }
            }
        }
        
        return jpegs
    }
    
    // Method that accepts two paths: the first should point to a directory to copy, and te second should be where the directory should be copied to. Return true if the directory and all its contents were copied successfully; false if the copy failed, or the user specified something other than a directory
    public static func challenge5(source: String, destination: String) -> Bool {
        let fm = FileManager.default
        var isDirectory: ObjCBool = false
        
        guard fm.fileExists(atPath: source, isDirectory: &isDirectory) || isDirectory.boolValue == false else { return false }
        
        let sourceURL = URL(fileURLWithPath: source)
        let destinationURL = URL(fileURLWithPath: destination)
        
        do {
            try fm.copyItem(at: sourceURL, to: destinationURL)
        } catch {
            print("Copy failed: \(error.localizedDescription)")
            return false
        }
        
        return true
    }
    
    // Method that accepts a filename on disk, loads it into string, then returns the frequency of a word in that string, taking letter case into account
    public static func challenge6(filename: String, count: String) -> Int {
        guard let inputString = try? String(contentsOfFile: filename) else { return 0 }
        var nonletters = CharacterSet.letters.inverted
        nonletters.remove("'")
        
        let allWords = inputString.components(separatedBy: nonletters)
        let wordsSet = NSCountedSet(array: allWords)
        
        return wordsSet.count(for: count)
    }
    
    // Method that accepts the name of a directory to scan, and returns an array of filenames that appear more than once in that directory or any of its subdirectories. Your function should scan all subdirectories, including subdirectories of subdirectories
    public static func challenge7(in directory: String) -> [String] {
        let fm = FileManager.default
        let directoryURL = URL(fileURLWithPath: directory)
        
        guard let files = fm.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
        var duplicates = Set<String>()
        var seen = Set<String>()
        
        for case let file as URL in files {
            guard file.hasDirectoryPath == false else { continue }
            
            let filename = file.lastPathComponent
            
            if seen.contains(filename) {
                duplicates.insert(filename)
            }
            
            seen.insert(filename)
        }
        
        return Array(duplicates)
    }
    
    // Method that accepts the name of a directory to scan, and returns an array containing the name of any executable files in there
    public static func challenge8(in directory: String) -> [String] {
        let fm = FileManager.default
        let directoryURL = URL(fileURLWithPath: directory)
        
        guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
        
        var returnValue = [String]()
        
        for file in files {
            guard file.hasDirectoryPath == false else { continue }
            
            if fm.isExecutableFile(atPath: file.path) {
                returnValue.append(file.lastPathComponent)
            }
        }
        
        return returnValue
    }
    
    // Method that accepts a path to a directory, then converts to PNGs any JPEGs it finds in there, leaving the originals intact. If any JPEG can’t be converted the function should just quietly continue
    public static func challenge9(in directory: String) {
        let fm = FileManager.default
        let directoryURL = URL(fileURLWithPath: directory)
        guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return }
        
        for file in files {
            guard file.pathExtension == "jpeg" || file.pathExtension == "jpg" else { continue }
            guard let image = UIImage(contentsOfFile: file.path) else { continue }
            guard let png = image.pngData() else { continue }
            
            let newFilename = file.deletingPathExtension().appendingPathExtension("png")
            _ = try? png.write(to: newFilename)
        }
    }
    
    // Method that accepts a path to a log file on disk, and returns how many lines start with “[ERROR]”. The log file could be as large as 10GB, but may also not exist
    public static func challenge10(filename: String) -> Int {
        var totalErrors = 0
        
        let reader = ChunkedFileReader(path: filename)
        
        while let line = reader.readLine() {
            if line.hasPrefix("[ERROR]") {
                totalErrors += 1
            }
        }
        
        return totalErrors
    }
}
