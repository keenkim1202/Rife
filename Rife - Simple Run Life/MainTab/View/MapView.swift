//
//  MapView.swift
//  Rife - Simple Run Life
//
//  Created by 배경원 on 2022/06/11.
//

import UIKit
import MapKit
import SnapKit

class MapView: UIView {
    
    let mapView = MKMapView()
    let topDivider = UIView()
    let bottomDivider = UIView()
    let playButton = UIButton()
    let pauseButton = UIButton()
    let stopButton = UIButton()
    let timeLabel = UILabel()
    let runButtonStack: UIStackView = { () -> UIStackView in
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        makeConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func configuration() {
        self.backgroundColor = UIColor(named: "background_green")
        
        [playButton, pauseButton, stopButton].forEach {
            runButtonStack.addArrangedSubview($0)
        }
        
        [mapView, topDivider, bottomDivider, runButtonStack, timeLabel].forEach {
            self.addSubview($0)
        }
        
        [topDivider, bottomDivider].forEach { divider in
            divider.backgroundColor = UIColor(named: "default_black")
        }
        
        timeLabel.text = "00:00:00"
        timeLabel.font.withSize(70)
        
        playButton.setImage(UIImage(named: "play_btn"), for: .normal)
        pauseButton.setImage(UIImage(named: "pause_btn"), for: .normal)
        stopButton.setImage(UIImage(named: "stop_btn"), for: .normal)
        
        mapView.layer.cornerRadius = 11
        mapView.layer.borderColor = UIColor(named: "default_black")?.cgColor
        mapView.layer.borderWidth = 1
    }
    
    func makeConstraints() {
        topDivider.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(topDivider.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(bottomDivider.snp.top).offset(-15)
        }
        
        bottomDivider.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom).inset(15)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        runButtonStack.snp.makeConstraints { make in
            make.bottom.equalTo(mapView).offset(-150)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
        }
        
        playButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
        }
        
        stopButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
        }
        
        pauseButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(runButtonStack.snp.bottom).offset(30)
        }
    }
}
