//
//  FMS.swift
//  NotesApp
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
class FMS{
    static func getDocDir() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("Doc Dir: \(paths[0])")
        return paths[0]
    }
    static func getfile() -> [String]{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        var f = [String]()
        do {
            f = try FileManager.default.contentsOfDirectory(atPath: paths)
            return f
        }
        catch {
            print(error)
        }
        return f
    }
    
}
