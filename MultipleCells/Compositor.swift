//
//  Compositor.swift
//  MultipleCells
//
//  Created by Akhilesh Gandotra on 23/05/21.
//

import UIKit

// MARK: Abstractions

protocol ICell {
    func config(vm: IViewModel)
}

protocol IViewModel {
    var id: String {get set}
    var select : ()-> Void {get set}
}


// MARK: Concretions

// View Models
struct VM1: IViewModel {
    var id = "Cell1"
    var title = "Title"
    
    var select : ()-> Void
}

struct VM2: IViewModel {
    var id = "Cell2"
    var title = "Title"
    var subtitle = "Subtitle"
    
    var select : ()-> Void
}

// Cell classes
class Cell1:  UITableViewCell,ICell {
    var cellClass: UITableViewCell.Type = Cell1.self
    var vm: VM1!
    
    @IBOutlet weak var label: UILabel!
    
    func config(vm: IViewModel) {
        if let vm = vm as? VM1 {
            self.vm = vm
            label.text = vm.title
        }
    }
}

class Cell2: UITableViewCell, ICell {
    var cellClass: UITableViewCell.Type = Cell2.self
    var vm: VM2!
   
    @IBOutlet weak var sublabel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    func config(vm: IViewModel) {
        if let vm = vm as? VM2 {
            self.vm = vm
            label.text = vm.title
            sublabel.text = vm.subtitle
        }
    }
}
