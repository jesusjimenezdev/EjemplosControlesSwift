import UIKit

class FontDetalleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var pickerFonts: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    var familyName: String = ""
    var fonts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerFonts.delegate = self
        pickerFonts.dataSource = self
        
        if fonts.count == 0 {
            self.pickerFonts.isHidden = true
        }
        self.labelTitulo.text = familyName
        self.labelTitulo.font = UIFont(name: familyName, size: 16.0)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = fonts[row]
        self.textView.font = UIFont(name: font, size: 16.0)
    }
    
}
