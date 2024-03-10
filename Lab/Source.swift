//
//  Source.swift
//  Lab
//
//  Created by Dmitrii Shelema on 07.03.2024.
//


struct Source {
    static func allHeroes() -> [Photo]{
            [
                .init(id: 1, imageName: "deadpool", name: "Deadpool"),
                .init(id: 2, imageName: "ironman", name: "Ironman"),
                .init(id: 3, imageName: "spider-man", name: "Spider-man")

            ]
        }
    }


struct Photo {
    let id: Int
    let imageName: String
    let name: String
   
}

struct SectionPhoto {
    let sectionName: Int
    var photos: [Photo]
}
