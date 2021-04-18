//
//  ViewController.swift
//  LazyDemo
//
//  Created by Harsh on 04/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCount: UILabel!
    
    var number = ViewController.getNumber()
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loaded")
        
    }
    @IBAction func btnCountAction(_ sender: Any) {
    
        
        print(number)
        number = 2
        lblCount.text = "COUNT IS \(number)"
        count += 1
        if count == 3 {
            
            lblCount.text = "\(number)"
        }
    }
    static func getNumber() -> Int{
        
        var number = 0
        
        for i in 0...150000 {
            
            number = i
            print(i)
        }
        return number
    }
}

struct Person {
    let name: String
    let age: Int
}

struct PeopleViewModel {
    let people: [Person]
    
    lazy var oldest: Person? = {
        print("Lazy var oldest initialized")
        return people.max(by: { $0.age < $1.age })
    }()
    
    init(people: [Person]) {
        self.people = people
        print("View model initialized")
    }
}
