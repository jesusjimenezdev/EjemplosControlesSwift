import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelEdad: UILabel!
    @IBOutlet weak var txtNombreUsuario: UITextField!
    var edadUsuario = -1
    var nombreUsuario = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edadUsuario = Int(self.slider.value)
        self.labelEdad.text = "\(edadUsuario)"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text ?? "")
        return true
    }
    
    @IBAction func sliderEdad(_ sender: UISlider) {
        edadUsuario = Int(sender.value)
        self.labelEdad.text = "\(edadUsuario)"
    }
    
    @IBAction func btnValidarDatos(_ sender: UIButton) {
        nombreUsuario = txtNombreUsuario.text ?? ""
        if nombreUsuario == "jesus" {
            self.view.backgroundColor = UIColor.blue
        } else {
            if edadUsuario >= 18 {
            self.view.backgroundColor = UIColor.green
            } else {
            self.view.backgroundColor = UIColor.red
            }
        }
    }
    
    
}

