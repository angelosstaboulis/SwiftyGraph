//
//  main.swift
//  SwiftyGraph
//
//  Created by Angelos Staboulis on 18/7/23.
//

import Foundation
import SwiftGraph
struct Person:Codable,Equatable{
    let id:String
    let lastname:String
    let firstname:String
    let address:String
    let phone:String
  
}

let personAngelos = Person(id: "1", lastname: "Staboulis", firstname: "Angelos", address: "Gorgopotamou 1", phone: "2531017354")
let personTheodoros = Person(id: "2", lastname: "Staboulis", firstname: "Theodoros", address: "Gorgopotamou 1", phone: "2531017354")
let personAngeliki = Person(id: "3", lastname: "Stabouli", firstname: "Angeliki", address: "Gorgopotamou 1", phone: "2531017354")
let personJohn = Person(id: "4", lastname: "Staboulis", firstname: "John", address: "Gorgopotamou 1", phone: "2531017354")
let graphDB = WeightedGraph<Person,Int>(vertices: [personJohn,personAngelos,personAngeliki,personTheodoros])
graphDB.addEdge(from: personJohn, to: personAngelos,weight: 1)
graphDB.addEdge(from: personJohn, to: personTheodoros,weight: 2)
graphDB.addEdge(from: personJohn, to: personAngeliki,weight: 3)
var persons = graphDB.sorted { personA, personB in
    personA.firstname < personB.firstname
}
for item in graphDB.vertices{
    debugPrint("item=",item.id,item.lastname,item.firstname,item.address,item.phone)
}
var result = graphDB.findAllDfs(from: personTheodoros) { person in
    person.firstname == "John"
}
for item in result{
    let subArray = item
    for subitem in subArray{
        debugPrint("path=",subitem)
    }
    
}

for item in persons{
    if item.firstname == "Angeliki"{
        debugPrint("record=",item.id,item.lastname,item.firstname,item.address,item.phone)
        break
    }
}

for item in persons{
    debugPrint("record=",item.id,item.lastname,item.firstname,item.address,item.phone)
}

