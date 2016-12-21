//
//  PhotoDetailCell.swift
//  仿微信照片弹出动画
//
//  Created by zhangxu on 2016/12/21.
//  Copyright © 2016年 zhangxu. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoDetailCell: UICollectionViewCell {
    
    lazy var icon: UIImageView = {
        let icon = UIImageView();
        icon.contentMode = .scaleAspectFit;
        return icon;
    }();
    
    var photoModel: PhotoModel? {
        didSet {
            // 获取可选类型中的数据
            guard let photoModel = photoModel else {
                return;
            }
            
            if let img_url = photoModel.img_url {
                let url = URL(string: img_url)!;
                icon.sd_setImage(with: url);
            }
        }
    }
    
    // 初始化
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        // 添加icon
        contentView.addSubview(icon);
        
    }
    
    // 设置子控件的frame
    override func layoutSubviews() {
        super.layoutSubviews();
        
        icon.frame = bounds;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
