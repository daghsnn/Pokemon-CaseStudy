//
//  PokemonDetailView.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 15.11.2022.
//

import UIKit

final class PokemonDetailView : UIView {
    var didTappedBackButton : (()->())?
    private var imageUrlList : [String] = []
    private var counter = 0
    
    private lazy var backButton : UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        backButton.contentMode = .scaleAspectFill
        backButton.tintColor = UIColor(named: "redTint")!.withAlphaComponent(0.7)
        return backButton
    }()
    
    private lazy var imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textColor")
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.makeShadow(color: UIColor(named: "blueTint") ?? .systemBlue, offSet: CGSize(width: 0, height: 0), radius: 5, opacity: 0.7)
        return label
    }()
    
    private lazy var attackIcon : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "attackIcon"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var attackLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(named: "redTint")
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .label
        label.layer.cornerRadius = 20
        return label
    }()
    
    private lazy var defenceIcon : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "defenceIcon"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var defenceLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .label
        label.layer.cornerRadius = 20
        return label
    }()
    
    private lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineColor")
        return view
    }()
    
    private lazy var speedIcon : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "speedIcon"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var speedLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemYellow
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .label
        label.layer.cornerRadius = 20
        return label
    }()
    
    private lazy var hpIcon : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "hpIcon"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var hpLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemOrange
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .label
        label.layer.cornerRadius = 20
        return label
    }()
    
    
    private lazy var lineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineColor")
        return view
    }()
    
    private lazy var lineView3 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineColor")
        return view
    }()
    
    private lazy var characterInfoLbl : UILabel = {
        let text = UILabel()
        text.textColor = UIColor(named: "textColor")
        text.font = .systemFont(ofSize: 16, weight: .bold)
        text.textAlignment = .center
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        backgroundColor = UIColor(named: "backgroundColor")
        addSubview(imgView)
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(lineView3)
        addSubview(attackIcon)
        addSubview(attackLabel)
        addSubview(defenceIcon)
        addSubview(defenceLabel)
        addSubview(lineView)
        addSubview(speedIcon)
        addSubview(speedLabel)
        addSubview(hpIcon)
        addSubview(hpLabel)
        addSubview(lineView2)
        addSubview(characterInfoLbl)
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        backButton.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().inset(UIView.WIDTH * 0.08)
            maker.top.equalToSuperview().inset(UIView.HEIGHT * 0.09)
            maker.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(imgView.snp.bottom).offset(24)
            maker.centerX.equalToSuperview()
        }
        
        lineView3.snp.makeConstraints { (maker) in
            maker.height.equalTo(1)
            maker.top.equalTo(titleLabel.snp.bottom).offset(16)
            maker.leading.equalTo(defenceIcon.snp.leading)
            maker.trailing.equalToSuperview().inset(UIView.WIDTH * 0.08)
        }
        
        attackIcon.snp.makeConstraints { (maker) in
            maker.leading.equalTo(backButton.snp.leading)
            maker.top.equalTo(lineView3.snp.bottom).offset(16)
            maker.size.equalTo(32)
        }
        
        attackLabel.snp.makeConstraints { (maker) in
            maker.leading.equalTo(attackIcon.snp.trailing).offset(16)
            maker.trailing.equalToSuperview().inset(UIView.WIDTH * 0.08)
            maker.centerY.equalTo(attackIcon.snp.centerY)
        }
        
        defenceIcon.snp.makeConstraints { (maker) in
            maker.leading.equalTo(backButton.snp.leading)
            maker.top.equalTo(attackIcon.snp.bottom).offset(8)
            maker.size.equalTo(32)
        }
        
        defenceLabel.snp.makeConstraints { (maker) in
            maker.leading.equalTo(defenceIcon.snp.trailing).offset(16)
            maker.trailing.equalToSuperview().inset(UIView.WIDTH * 0.08)
            maker.centerY.equalTo(defenceIcon.snp.centerY)
        }
        
        lineView.snp.makeConstraints { (maker) in
            maker.height.equalTo(1)
            maker.top.equalTo(defenceIcon.snp.bottom).offset(16)
            maker.leading.equalTo(defenceIcon.snp.leading)
            maker.trailing.equalToSuperview().inset(UIView.WIDTH * 0.08)
        }
        
        speedIcon.snp.makeConstraints { (maker) in
            maker.leading.equalTo(backButton.snp.leading)
            maker.top.equalTo(lineView.snp.bottom).offset(8)
            maker.size.equalTo(32)
        }
        
        speedLabel.snp.makeConstraints { (maker) in
            maker.leading.equalTo(speedIcon.snp.trailing).offset(16)
            maker.trailing.equalToSuperview().inset(UIView.WIDTH * 0.08)
            maker.centerY.equalTo(speedIcon.snp.centerY)
        }
        
        hpIcon.snp.makeConstraints { (maker) in
            maker.leading.equalTo(backButton.snp.leading)
            maker.top.equalTo(speedLabel.snp.bottom).offset(8)
            maker.size.equalTo(32)
        }
        
        hpLabel.snp.makeConstraints { (maker) in
            maker.leading.equalTo(hpIcon.snp.trailing).offset(16)
            maker.trailing.equalToSuperview().inset(UIView.WIDTH * 0.08)
            maker.centerY.equalTo(hpIcon.snp.centerY)
        }
        
        lineView2.snp.makeConstraints { (maker) in
            maker.height.equalTo(1)
            maker.top.equalTo(hpLabel.snp.bottom).offset(16)
            maker.leading.equalTo(lineView.snp.leading)
            maker.trailing.equalTo(lineView.snp.trailing)
        }
        
        characterInfoLbl.snp.makeConstraints { (maker) in
            maker.leading.equalTo(lineView2.snp.leading)
            maker.trailing.equalTo(lineView2.snp.trailing)
            maker.top.equalTo(lineView2.snp.bottom).offset(16)
        }
    }
    
    func displayUI(_ model : PokemonDetailResponseModel) {
        self.imageUrlList = model.sprites?.imageUrlList ?? []
        imgView.sd_setImage(with: URL(string: model.sprites?.frontDefault ?? ""))
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(configureImageView), userInfo: nil, repeats: true)
        titleLabel.text = model.name?.capitalized
        characterInfoLbl.text = "Height \(String(model.height ?? 0)) - Weight \(String(model.weight ?? 0))"
        configureStats(model.stats)
        
    }
    
    private func configureStats(_ stats:[Stats]?) {
        var statDict : [String : String] = [:]
        guard let stats = stats else {return}
        for stat in stats {
            statDict[stat.stat?.name ?? ""] = String(stat.baseStat ?? 0)
        }
        attackLabel.text = statDict["attack"]
        defenceLabel.text = statDict["defense"]
        speedLabel.text = statDict["speed"]
        hpLabel.text = statDict["hp"]
    }
    
    @objc func configureImageView(){
        let count = imageUrlList.count
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.isOpaque))
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.5
        animation.autoreverses = false
        
        counter += 1
        if counter == count - 1 {
            counter = 0
        }
        imgView.layer.add(animation, forKey: #keyPath(CALayer.isOpaque))
        imgView.sd_setImage(with: URL(string: imageUrlList[counter]), placeholderImage: imgView.image, options: .fromCacheOnly, context: nil)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        blurView.alpha = 0.25
        blurView.layer.cornerRadius = 10.0
        blurView.clipsToBounds = true
        blurView.layer.borderWidth = 0.5
        blurView.layer.borderColor = UIColor(named: "redTint")?.cgColor.copy(alpha: 0.3)
        blurView.isUserInteractionEnabled = false
        backButton.insertSubview(blurView, at: 0)
        blurView.snp.makeConstraints { make in
            make.width.equalTo(backButton.bounds.width + 8)
            make.height.equalTo(backButton.bounds.height + 4)
            make.center.equalTo(backButton.snp.center)
        }
        
        
    }
    @objc private func backButtonClicked(){
        didTappedBackButton?()
    }
}
