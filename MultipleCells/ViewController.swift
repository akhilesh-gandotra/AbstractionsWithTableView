//
//  ViewController.swift
//  MultipleCells
//
//  Created by Akhilesh Gandotra on 23/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    var vms = [IViewModel]()
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.tableVIew.dataSource = self
        self.tableVIew.delegate = self
    }
    
    private func getData() {
       vms = [VM1(select: {
           print("VM1 selected")
        }), VM2(select: {
          print("VM2 selected")
       })]
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = vms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: vm.id, for: indexPath)
        if let cell = cell as? ICell {
            cell.config(vm: vm)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return vms[indexPath.row].select()
    }
    
}
