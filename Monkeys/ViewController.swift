//
//  ViewController.swift
//  Monkeys
//
//  Created by Sergey Shinkarenko on 22.06.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickedMonkeyLabel: UILabel!
    @IBOutlet weak var selectedMonkeyTextField: UITextField!
    let picker = UIPickerView()
    //var monkeysList:[(monkey: [String],location: [String])] = []
    let monkeysList = (Parser.singletone.parseNamesFromJSON()?.list ?? [],Parser.singletone.parseNamesFromJSON()?.location ?? [])
    
   /* func toolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(title: "Done",
                                   style: .done,
                                   target: self,
                                   action: #selector(selectItem))
        toolbar.setItems([done],
                         animated: false)
        return toolbar
    }*/


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // monkeysList.append((monkey: Parser.singletone.parseNamesFromJSON()?.list ?? [], location: Parser.singletone.parseNamesFromJSON()?.location ?? []))
        
        picker.delegate = self
        picker.dataSource = self

        selectedMonkeyTextField.inputView = picker
        //selectedMonkeyTextField.inputAccessoryView = toolbar()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 10
        case 1:
            return monkeysList.0.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row + 1)"
        case 1:
            return monkeysList.0.first
        default:
            return ""
        }
    }
}

extension ViewController: UITextViewDelegate, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentName = monkeysList.self
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell
  
        cell?.MonkeyNames.text = currentName.0[indexPath.row]
        cell?.MonkeyLocation.text = currentName.1[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monkeysList.0.count
    }
    
}
