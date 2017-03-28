
local scrW, scrH= System:screenSize();
window:backgroundColor(0xDCDCDC);

local  function createChooseLitteView(title)
	chooseView = View();
	chooseView:frame(0,0,contentView:width(),0);
	chooseView:backgroundColor(0xFFFFFF);

	chooseBtn = Button();
	chooseBtn:frame (20,0,15,15);
	chooseBtn:backgroundColor(0xFF0000);
	chooseBtn:callback(function ()
		-- body  点击按钮的事件
	end)
	chooseView:addView(chooseBtn);

	chooseTitle = Label();
	local chooseTitle_x = chooseBtn:x()+chooseBtn:width()+5
	chooseTitle:frame (chooseTitle_x,0,contentView:width() - chooseTitle_x - 10);
	chooseTitle:text(title);
	chooseTitle:fontSize (15);
	chooseTitle:lineCount (10);
	chooseTitle:adjustSize();
	chooseView:addView(chooseTitle);
	chooseView:frame(0,0,contentView:width(),chooseTitle:height());
	return chooseView;

end



local function createChooseContent(contentTitles,contentView,chooseViews)
	for k,v in pairs(contentTitles) do
		chooseViews[k]=createChooseLitteView(v);
	end 
	newOrginY = 80;
	for k,litterView in pairs(chooseViews) do
		local litterView_x,litterView_y,litterView_w,litterView_h = litterView:frame();
		litterView:frame(litterView_x,newOrginY,litterView_w,litterView_h);
		newOrginY = newOrginY+litterView_h + 20;
		contentView:addView(litterView);
	end

	contentView:height(newOrginY);
end

function initChooseContentView(frame_x,titles,chooseViews)

	contentView = View();
	contentView:backgroundColor(0xFFFFFF);
	contentView:frame(frame_x,10,scrW-20,scrH - 64 - 50);
	contentView:cornerRadius (5.0);
	contentView:masksToBounds (true);

	titleLab = Label();
	titleLab:frame(15,0,contentView:width()-20,50);
	titleLab:backgroundColor(0xFFFFFF);
	titleLab:fontSize (17);
	titleLab:text("1、以下哪项最能说明您的投资经验？");
	titleLab:textColor (0x000000, 1.0);
	contentView:addView(titleLab);

	lineView = View();
	lineView:backgroundColor(0x666666);
	lineView:frame(0,50,contentView:width(),0.5);
	contentView:addView(lineView);

	createChooseContent(titles,contentView,chooseViews);

	return contentView;

end
--[[
window:onLayout( function() 

	buttons = {};
	contentTitles = {"除了存款、国债外，我几乎不投资其他金融产品","大部分投资于存款、国债等，较少投资于股票、基金等风险产品","资产均衡地存款、国债、银行理财产品、信托产品、股票、基金等","大部分投资于股票、基金、外汇、金融衍生品、海外投资产品等高风险产品，较少投资于存款、国债"};
	chooseViews = {};

	initChooseContentView(10,contentTitles,chooseViews;
	

end)
--]]


