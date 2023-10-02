//
//  TopBrandsTableViewCell.swift
//  House
//
//  Created by Shahroze Zaheer on 11/3/22.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

import UIKit

public class TopBrandsTableViewCell: UITableViewCell {
    
    public enum TopBrandsType {
        case foodOrder
        case dashboard
    }
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var collectionsDataTopBrand: [BrandDO]?{
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    public var callBack: ((BrandDO) -> ())?
    public var topBrandsType: TopBrandsType = .foodOrder
    public static let module = Bundle.module
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: String(describing: TopBrandsCollectionViewCell.self), bundle: .module), forCellWithReuseIdentifier: String(describing: TopBrandsCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = setupCollectionViewLayout()
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupCollectionViewLayout() ->  UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if self.topBrandsType != .dashboard {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(104), heightDimension: .fractionalHeight(1)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                
                return section
            } else {
                var item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(104), heightDimension: .fractionalHeight(0.5)))
                if let topBrands = self.collectionsDataTopBrand, topBrands.count == 1 {
                    item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(104), heightDimension: .fractionalHeight(1)))
                }
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitems: [item])
                
                let outerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(104), heightDimension: .fractionalHeight(0.88)), subitems: [group])
                
                let section = NSCollectionLayoutSection(group: outerGroup)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                
                return section
            }
        }
    }
    
    public func setBackGroundColor(color: UIColor) {
        mainView.backgroundColor = color
    }
}

extension TopBrandsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionsDataTopBrand?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let data = collectionsDataTopBrand?[indexPath.row] {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopBrandsCollectionViewCell", for: indexPath) as? TopBrandsCollectionViewCell else {return UICollectionViewCell()}
            
            cell.configureCell(with: data)
            return cell
        }
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = collectionsDataTopBrand?[indexPath.row] {
            callBack?(data)
        }
    }
}
