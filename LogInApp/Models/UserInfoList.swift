//
//  UserInfoList.swift
//  LogInApp
//
//  Created by Denis on 2022/10/04.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getInformation() -> User {
        User(
            login: "1",
            password: "1",
            person:
                Person(
                    name: "Denis",
                    secondName: "Balandin",
                    age: "26",
                    country: "Russia",
                    bio: "Привет! Меня зовут Денис. Мне очень нравится мобильная разработка, поэтому я здесь. В свободное время люблю плавать в бассейне и играть на гитаре. Когда на улице идёт дождь, я не расстраиваюсь, а просто наливаю себе горячего чая."
                )
        )
    }
}

struct Person {
    let name: String
    let secondName: String
    let age: String
    let country: String
    let bio: String
}
