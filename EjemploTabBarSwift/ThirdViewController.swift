import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var families : [String]  = []
    var fonts : [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        families = UIFont.familyNames.sorted(by: { return $0 < $1 })
        for fam in families{
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let fontFamily = families[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = families[row]
        let familyFonts = fonts[fontFamily]!
        print(familyFonts)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFonts" {
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontDetalleViewController
            let index = self.tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = self.families[index]
            destinationVC.fonts = self.fonts[self.families[index]]!
        }
    }
}
