--工具包引入
--require "lv_kit"
require "mytest"


local scrW, scrH= System:screenSize()



scrollView = HScrollView ();
buttons = {};

scrollView:frame(0, 0, scrW, scrH-64 )
scrollView:contentSize( scrW*2, scrH-64 );
for i=1,2 do
	--[[
    local button = Button();
    button:frame( (i-1)*scrW, 0, scrW,scrH/5);
    button:title("hhaha" .. i);
    scrollView:addView(button);
    buttons[i] = button;
    --]]

    buttons = {};
	contentTitles = {"除了存款、国债外，我几乎不投资其他金融产品","大部分投资于存款、国债等，较少投资于股票、基金等风险产品","资产均衡地存款、国债、银行理财产品、信托产品、股票、基金等","大部分投资于股票、基金、外汇、金融衍生品、海外投资产品等高风险产品，较少投资于存款、国债"};
	chooseViews = {};

	chooseContentView = initChooseContentView(10+(i-1)*scrW,contentTitles,chooseViews);
	scrollView:addView(chooseContentView);
end
scrollView:backgroundColor(0xff0000);

scrollView:callback{
			Scrolling = function()
				print("scrolling");
			end,
			ScrollBegin = function()
				print("scrolling begin");
			end,
			ScrollEnd = function()
				print("scrolling end");
			end
		};


