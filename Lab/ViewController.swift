import UIKit

class ViewController: UIViewController {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let photos = Source.allHeroes()
    let titleName = UILabel()
    var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Добавляем бэкграунд
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.backgroundColor = UIColor.black
        view.addSubview(backgroundView)
        
        // Создаем вертикальный стек представлений для надписи, иконки и коллекции
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10.0
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Добавляем иконку в стек
        icon = UIImageView(image: UIImage(named: "ic"))
        icon.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 128),
            icon.heightAnchor.constraint(equalToConstant: 27)
        ])
        
        // Добавляем надпись "Choose your hero" в стек
        stackView.addArrangedSubview(titleName)
        titleName.text = "Choose your hero"
        titleName.textColor = UIColor.white
        titleName.textAlignment = .center
        titleName.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        // Добавляем коллекцию в стек
        setupCollectionView(in: stackView)
    }
    
    private func setupCollectionView(in stackView: UIStackView) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.backgroundColor = UIColor.black
        // Назначаем размеры для коллекции
        collectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        
        stackView.addArrangedSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.item]
        cell.imageView.image = UIImage(named: photo.imageName)
        cell.nameLabel.text = photo.name // Установка имени персонажа
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 583)
    }
}
