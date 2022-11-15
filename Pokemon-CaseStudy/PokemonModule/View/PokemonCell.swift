//
//  PokemonCell.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 15.11.2022.
//

import SDWebImage
import UIKit

final class PokemonCell: UICollectionViewCell {
    static let cellId:String = "PokemonCell"
    // MARK: - UIElements
    
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textColor")
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 20
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "cellBgColor")?.withAlphaComponent(0.25)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(imgView)
        addSubview(titleLabel)
        
        imgView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(16)
            maker.top.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalToSuperview().multipliedBy(0.6)
        }
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().offset(16)
            maker.top.equalTo(imgView.snp.bottom)
            maker.centerX.equalToSuperview()
        }
        
      
        
    }
    
    func configureCell(_ model: Result){
        imgView.sd_setImage(with: model.imageUrl)
        titleLabel.text = model.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        clipsToBounds = true
        makeShadow(color: UIColor(named: "strokeColor")!, offSet: CGSize(width: 6, height: -6), radius: 10, opacity: 0.5)
        makeShadow(color: UIColor(named: "strokeColor")!, offSet: CGSize(width: -6, height: 6), radius: 10, opacity: 0.5)

    }
}
