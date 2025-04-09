#!/bin/bash

# 创建iPhone样式模板头部
cat > iphone_style_header.html << 'EOL'
<!-- iPhone 15 Pro Max 样机 -->
<div class="iphone-frame">
    <!-- 物理按键 -->
    <div class="btn-physical btn-power"></div>
    <div class="btn-physical btn-volume-up"></div>
    <div class="btn-physical btn-volume-down"></div>
    
    <!-- 动态岛 -->
    <div class="dynamic-island">
        <div class="island-camera"></div>
    </div>
    
    <!-- 屏幕容器 -->
    <div class="screen-container">
        <!-- 屏幕内容 -->
        <div class="screen-content scrollbar-hide">
EOL

# 创建底部导航模板
cat > iphone_style_footer.html << 'EOL'
        </div>
        
        <!-- 底部导航栏 -->
        <div class="absolute bottom-0 left-0 right-0 h-[70px] bg-white border-t border-gray-100 flex items-center justify-around px-6 shadow-lg z-40">
            <a href="dashboard.html" class="flex flex-col items-center justify-center w-16">
                <i class="fas fa-home text-gray-400 mb-1"></i>
                <span class="text-xs text-gray-400">首页</span>
            </a>
            <a href="shoe_selection.html" class="flex flex-col items-center justify-center w-16">
                <i class="fas fa-shopping-bag text-gray-400 mb-1"></i>
                <span class="text-xs text-gray-400">选购</span>
            </a>
            <a href="foot_scan.html" class="flex flex-col items-center justify-center w-16 relative">
                <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center text-white shadow-lg absolute -top-5">
                    <i class="fas fa-shoe-prints"></i>
                </div>
                <span class="text-xs text-primary mt-6">足部扫描</span>
            </a>
            <a href="my_designs.html" class="flex flex-col items-center justify-center w-16">
                <i class="fas fa-tshirt text-gray-400 mb-1"></i>
                <span class="text-xs text-gray-400">我的设计</span>
            </a>
            <a href="family_center.html" class="flex flex-col items-center justify-center w-16">
                <i class="fas fa-users text-gray-400 mb-1"></i>
                <span class="text-xs text-gray-400">家庭中心</span>
            </a>
        </div>
        
        <!-- 底部指示条 -->
        <div class="home-indicator"></div>
    </div>
</div>
EOL

# 创建iPhone样式CSS
cat > iphone_style_css.html << 'EOL'
/* iPhone 15 Pro Max 样机 */
.iphone-frame {
    position: relative;
    width: 380px;
    height: 820px;
    margin: 40px auto;
    background-color: #111;
    border-radius: 55px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
    border: 8px solid #222;
    padding: 10px;
    overflow: hidden;
}

.iphone-frame:before {
    content: '';
    position: absolute;
    top: 0;
    width: 50%;
    height: 30px;
    background-color: #111;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 100;
}

.dynamic-island {
    position: absolute;
    top: 12px;
    left: 50%;
    transform: translateX(-50%);
    width: 125px;
    height: 35px;
    background-color: #000;
    border-radius: 20px;
    z-index: 50;
    display: flex;
    align-items: center;
    justify-content: center;
}

.island-camera {
    width: 10px;
    height: 10px;
    background-color: #222;
    border-radius: 50%;
    margin-right: 5px;
}

.screen-container {
    position: relative;
    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom, #f5f7fa, #c3cfe2);
    border-radius: 45px;
    overflow: hidden;
}

.screen-content {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    overflow-y: auto;
    border-radius: 45px;
    padding-top: 60px;
    padding-bottom: 80px;
}

.btn-physical {
    position: absolute;
    width: 3px;
    height: 60px;
    background-color: #333;
    right: -11px;
    border-radius: 3px;
}

.btn-power {
    top: 180px;
}

.btn-volume-up {
    top: 120px;
    left: -11px;
}

.btn-volume-down {
    top: 200px;
    left: -11px;
}

.home-indicator {
    position: absolute;
    bottom: 8px;
    left: 50%;
    transform: translateX(-50%);
    width: 120px;
    height: 5px;
    background-color: rgba(0, 0, 0, 0.3);
    border-radius: 2.5px;
    z-index: 50;
}

/* 固定底部导航栏 */
.bottom-nav {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 70px;
    background-color: rgba(255, 255, 255, 0.95);
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: space-around;
    align-items: center;
    z-index: 40;
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
}
EOL

echo "更新所有页面中..."

# 需要更新的页面列表
pages=(
    "foot_scan.html"
    "scan_result.html"
    "shoe_selection.html"
    "my_designs.html"
    "growth_record.html"
    "user_account.html"
    "logistics_tracking.html"
    "shoe_status.html"
    "order_details.html"
    "customer_service.html"
    "3d_preview.html"
    "shoe_customize.html"
    "payment.html"
    "order_confirm.html"
    "child_profiles.html"
)

# 已经更新的页面
updated_pages=(
    "welcome.html"
    "dashboard.html"
)

# 添加样式到每个页面
for page in "${pages[@]}"; do
    echo "更新页面: $page"
    
    # 检查页面是否存在
    if [ ! -f "$page" ]; then
        echo "错误: 找不到页面 $page"
        continue
    fi
    
    # 备份原始文件
    cp "$page" "${page}.bak"
    
    # 注入iPhone样式到CSS
    sed -i '' '/body {/,/}/c\
        body {\
            font-family: '"'"'Noto Sans SC'"'"', sans-serif;\
            background-color: #111;\
            overscroll-behavior: none;\
            -webkit-tap-highlight-color: transparent;\
        }\
        \
        /* iPhone 15 Pro Max 样机样式 */\
        '"$(cat iphone_style_css.html)" "$page"
    
    # 替换<body>标签内容
    awk '
    /<body/ {
        print $0;
        getline;
        print "    '"$(cat iphone_style_header.html | sed 's/\//\\\//g')"'";
        inContent = 1;
        next;
    }
    /<\/body>/ {
        print "    '"$(cat iphone_style_footer.html | sed 's/\//\\\//g')"'";
        print "";
        print "    <!-- Toast 通知 -->";
        print "    <div id=\"toast\" class=\"toast\">提示信息</div>";
        print "";
        inContent = 0;
        print $0;
        next;
    }
    inContent {
        # 不做任何输出，跳过<body>和</body>之间的内容
        next;
    }
    { print $0 }
    ' "${page}.bak" > "$page"
    
    echo "$page 更新完成"
done

# 清理临时文件
rm iphone_style_header.html
rm iphone_style_footer.html
rm iphone_style_css.html

echo "所有页面更新完成！请检查并根据每个页面的特定需求手动调整内容。"

echo "现在更新preview.html显示所有更新后的页面..."

# 更新preview.html以展示所有更新后的页面
# 实际实现需要手动编辑，因为这涉及到更复杂的HTML结构 