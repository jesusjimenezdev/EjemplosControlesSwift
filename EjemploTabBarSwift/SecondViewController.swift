import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lbNumeros: UILabel!
    @IBOutlet weak var textViewResultado: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var lbNumeroOro: UILabel!
    
    var fibonacci: [Int] = [0,1]
    var fibId = 1
    var calculateGoldNum = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fibId = Int(self.stepper.value)
        generarFibonacci()
    }

    func generarFibonacci() {
        if (fibId <= 1 || fibId > 100) {
            return
        }
        
        fibonacci = [0,1]
        for i in 2...fibId {
            fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
        }
        
        let fibStr: [String] = fibonacci.compactMap { String($0) }
        let resultado: String = fibStr.joined(separator: ", ")
        self.textViewResultado.text = resultado
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        self.fibId = Int(sender.value)
        self.lbNumeros.text = "\(self.fibId)"
        generarFibonacci()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        calculateGoldNum = sender.isOn
        if sender.isOn {
            let last = Double(fibonacci[fibonacci.count - 1])
            let previus = Double(fibonacci[fibonacci.count - 2])
            let goldNum = last / previus
            self.lbNumeroOro.text = "\(goldNum)"
        } else {
            self.lbNumeroOro.text = "Ver el numero de oro"
        }
    }
    
}

