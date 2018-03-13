import UIKit


class avatarPicerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    // Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // Variables
    var avaterType = AvaterType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    //CollectionView Delegate && Datasource Func
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
            cell.configerCell(index: indexPath.item, type: avaterType)
            return cell
        }
        
        return AvatarCell()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 28
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numOfColumns : CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 4
            
        }
        let spaceBetweenCells : CGFloat = 10
        let padding : CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avaterType == .dark {
            UserDataService.instance.setAvaterName(avaterName: "dark\(indexPath.item)")
        }else {
            
            UserDataService.instance.setAvaterName(avaterName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //Actions
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        
        if segmentControl.selectedSegmentIndex == 0 {
            avaterType = .dark
            
        }else{
            avaterType = .light
        }
        collectionView.reloadData()
    }

    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
}
