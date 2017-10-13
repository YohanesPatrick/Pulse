
import UIKit
import Charts


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIViewX!
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var nameDateView: UIView!
    @IBOutlet weak var profilePicView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    var tableData: [Model] = []
    var identities = ["BGView","HBView","WView","BlankView","BlankView"]
    var ProfileData: ProfileModel?
    var myIndex = 0
    
    @IBAction func questionViewButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "QuestionViewSegue", sender: self)
    }
    @IBAction func profileViewButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "ProfileViewSegue", sender: self)
    }
    @IBAction func settingViewButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SettingViewSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Data.getProfile { (data) in
            if let data = data{
                self.nameLabel.text = data.Name
                self.dayLabel.text = data.day
                self.dateLabel.text = data.date
                self.profileImageView.image = data.ProfilePicture
                
            }
        }
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
            self.animateTableCells()
        }
        closeMenu()
        setupAnimatedControls()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
  
        UIView.animate(withDuration: 0.3, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.profilePicView.transform = .identity
            self.nameDateView.transform = .identity
        }) { (success) in
        
        }
    }

    
    @IBAction func menuTapped(_ sender: FloatingActionButton) {
        UIView.animate(withDuration: 0.3, animations: {
            if self.menuView.transform == .identity {
                self.closeMenu()
            } else {
                self.menuView.transform = .identity
            }
        })
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [],  animations: {
            if self.menuView.transform == .identity{
                self.pencilButton.transform = .identity
                self.profileButton.transform = .identity
                self.settingButton.transform = .identity
            }
        })
    }
    
func animateTableCells() {
        let cells = tableView.visibleCells
    
        for cell in cells{
            cell.transform = CGAffineTransform(translationX: view.frame.width, y:0)
        }
        var delay = 0.5
        for cell in cells{
            UIView.animate(withDuration: 0.2, delay: delay,usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            cell.transform = .identity
            })
            
            delay += 0.1
        }
    }
    
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        pencilButton.transform = CGAffineTransform(translationX: 0, y: 15)
        profileButton.transform = CGAffineTransform(translationX: 11, y: 11)
        settingButton.transform = CGAffineTransform(translationX: 15, y: 0)
    }
    
    func setupAnimatedControls() {
        profilePicView.transform = CGAffineTransform(translationX: -profilePicView.frame.width, y: 0)
        nameDateView.transform = CGAffineTransform(translationX: nameDateView.frame.width, y: 0)
    }

    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        cell.setup(model: tableData[indexPath.row])
        
        return cell 
    }

}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        let vcName = identities[myIndex]
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
}


