//
//  PhotoCell.swift
//  仿微信照片弹出动画
//
//  Created by zhangxu on 2016/12/20.
//  Copyright © 2016年 zhangxu. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
    
    private lazy var icon: UIImageView = {
        let icon = UIImageView();
        return icon;
    }();
    
    var model: PhotoModel? {
        didSet {
            // 获取可选类型中的数据
            guard let model = model else {
                return;
            }
            
            if let img_url = model.img_url {
                let url = URL(string: img_url)!;
                icon.sd_setImage(with: url);
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        // 添加icon
        contentView.addSubview(icon);
    }
    
    // 设置子控件的frame
    override func layoutSubviews() {
        super.layoutSubviews();
        
        // 设置icon的frame
        icon.frame = bounds;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
