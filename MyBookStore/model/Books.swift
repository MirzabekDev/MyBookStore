//
//  Books.swift
//  MyBookStore
//
//  Created by Mirzabek on 16/01/23.
//

import Foundation

/// Struct of books itemsk
struct Book: Identifiable,Hashable{
    var id: Int
    var image: String
    var title: String
    var information: String
    
}

/// Items
var books = [
    
    [
        Book(id: 0, image: "image", title: "Atomic habit", information: "read more..."),
    ],
    [
        Book(id: 2, image: "zero", title: "Rich dad poor dad", information: "read more..."),
         Book(id: 3, image: "zero", title: "Elon Musk", information: "read more...")
    ],
    [
        Book(id: 4, image: "rich", title: "", information: "read more..."),
        Book(id: 5, image: "rich", title: "", information: "read more...")
    ],
    
    [
        Book(id: 6, image: "main", title: "", information: "read more..."),
        Book(id: 7, image: "main", title: "", information: "read more...")
    ]

    
]
