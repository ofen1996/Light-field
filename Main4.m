function Main
%% 清除变量，命令窗口
clear all;
clc;

%% 新建图形并设置相关属性
LightField = figure('NumberTitle', 'off',...
    'Resize','off',...
    'Color',[0.753,0.753,0.753],...
    'ToolBar','none',...
    'MenuBar','none',...
    'NumberTitle','off',...
    'Name', 'Light Field',...
    'Units','pixels',...
    'Position',[0 0 1280 720]);

global handles;

%% 图像显示界面
handles.uipanel_LF = uipanel('Title','Light Field Rendering',...
	'BorderType','etchedin',...
    'BorderWidth',1.0,...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'Units','pixels',...
    'Position',[0 0 1280 720]);

handles.axes_ImageOut = axes('NextPlot','replace',...
    'Color',[1,1,1],...
	'visible','off',...
    'parent',handles.uipanel_LF,...
    'Units','pixels',...
    'Position',[50,80,800,600],...
    'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);

handles.text_Status = uicontrol('Style','text',...
    'FontName','MS SansSerif',...
    'FontSize',12,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
	'parent',handles.uipanel_LF,...
    'String','',...
    'Units','pixels',...
    'Position',[50 10 800 50]);

handles.text_dirPath = uicontrol('Style','text',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','left',...
	'parent',handles.uipanel_LF,...
    'String','文件存储路径：',...
    'Units','pixels',...
    'Position',[870 650 150 30]);

handles.edit_dirPath = uicontrol('Style','edit',...
    'FontName','MS SansSerif',...
    'FontSize',12,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','left',...
	'parent',handles.uipanel_LF,...
    'String','C:\Users\ofen\Desktop\20180330结果\result2snap',...
    'Units','pixels',...
    'Position',[870 600 350 30]);

handles.text_M = uicontrol('Style','text',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','left',...
	'parent',handles.uipanel_LF,...
    'String','相机阵列行数：',...
    'Units','pixels',...
    'Position',[870 500 150 30]);

handles.edit_M = uicontrol('Style','edit',...
    'FontName','MS SansSerif',...
    'FontSize',12,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
	'parent',handles.uipanel_LF,...
    'String','3',...
    'Units','pixels',...
    'Position',[1020 500 50 30]);

handles.text_N = uicontrol('Style','text',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','left',...
	'parent',handles.uipanel_LF,...
    'String','相机阵列列数：',...
    'Units','pixels',...
    'Position',[870 450 150 30]);

handles.edit_N = uicontrol('Style','edit',...
    'FontName','MS SansSerif',...
    'FontSize',12,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
	'parent',handles.uipanel_LF,...
    'String','3',...
    'Units','pixels',...
    'Position',[1020 450 50 30]);

handles.text_L = uicontrol('Style','text',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','left',...
	'parent',handles.uipanel_LF,...
    'String','重聚焦参数：',...
    'Units','pixels',...
    'Position',[870 400 150 30]);

handles.edit_L = uicontrol('Style','edit',...
    'FontName','MS SansSerif',...
    'FontSize',12,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
	'parent',handles.uipanel_LF,...
    'String','-5',...
    'Units','pixels',...
    'Position',[1020 400 50 30]);

handles.pushbutton_Star = uicontrol('Style','pushbutton',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
    'Parent',handles.uipanel_LF,...
    'String','运行',...
    'Units','pixels',...
    'Position',[920 300 80 50],...
    'CallBack',@pushbutton_Star_Callback);

%% Testing
handles.pushbutton_Test = uicontrol('Style','pushbutton',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
    'Parent',handles.uipanel_LF,...
    'String','Test',...
    'Units','pixels',...
    'Position',[1020 300 80 50],...
    'CallBack',@pushbutton_Test_Callback);

handles.pushbutton_Setting = uicontrol('Style','pushbutton',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
    'Parent',handles.uipanel_LF,...
    'String','Setting',...
    'Units','pixels',...
    'Position',[1120 300 80 50],...
    'CallBack','Setting');

handles.slider_LF_L = uicontrol('Style','slider',...
    'FontName','MS SansSerif',...
    'FontSize',10,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
    'Parent',handles.uipanel_LF,...
    'ListboxTop',1.0,...
    'Max',-5,...
    'Min',-15,...
    'Value',-10,...
    'String','滑动条',...
    'Units','pixels',...
    'Position',[870 250 300 30],...
    'CallBack',@slider_LF_L_Callback);

handles.edit_LF_L = uicontrol('Style','edit',...
    'FontName','MS SansSerif',...
    'FontSize',10,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','center',...
    'Parent',handles.uipanel_LF,...
    'String','0',...
    'Units','pixels',...
    'Position',[1200 250 50 30],...
    'CallBack',@edit_LF_L_Callback);
function axes_ImageOut_ButtonDownFcn(~,~,~)
global handles;

Point = get(handles.axes_ImageOut,'CurrentPoint');  %获取点击处的坐标
Point = Point(1,1:2);
x = ceil(Point(1));   %横坐标
y = ceil(Point(2));   %纵坐标
X = (x-40:x+40);
Y = (y-40:y+40);

ImageSize = size(handles.ImageOut);
for N = 1:ImageSize(4)
    Sobel(N) = Edge_Sobel(handles.ImageOut(Y,X,:,N));   %注意XY和行列的对应关系！
end
[ ~ , N ] = find(Sobel == max(Sobel));    %N为边缘检测后值最大值的编号
proSlope = N2Slope(N); %proSlope为正确的Slope参数

A = -1;  %A大于0选择非平滑处理过程，A小于0选择平滑处理过程
if A>0
    %非平滑处理过程
    set(handles.slider_LF_L,'Value',proSlope);
    set(handles.edit_LF_L,'String',num2str(proSlope));
    set(handles.text_Status,'String',['重聚焦参数： L = ',num2str(proSlope)]);
    axes(handles.axes_ImageOut);
    handles.ImageH = imshow(handles.ImageOut(:,:,:,N));%放置图像并取得图像句柄
    set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%将Button函数重新赋给新句柄
else
    %平滑过渡处理过程
    currSlope = get(handles.slider_LF_L,'Value');   %获取当前图像的Slope
    currN = Slope2N(currSlope);
    set(handles.slider_LF_L,'Value',proSlope);
    set(handles.edit_LF_L,'String',num2str(proSlope));
    set(handles.text_Status,'String',['重聚焦参数： L = ',num2str(proSlope)]);
    for n = round(linspace(currN,N,8))
        axes(handles.axes_ImageOut);
        handles.ImageH = imshow(handles.ImageOut(:,:,:,n));%放置图像并取得图像句柄
        pause(0.001);
    end
    set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%将Button函数重新赋给新句柄
end

a = 1;

function pushbutton_Star_Callback(~,~,~)
global handles;

set(handles.text_Status,'String','开始运行重聚焦程序');
InputPath = get(handles.edit_dirPath,'String');
mm = str2double(get(handles.edit_M,'String'));
nn = str2double(get(handles.edit_N,'String'));
L = str2double(get(handles.edit_L,'String'));

Image = LFShift( InputPath , mm , nn , L );
axes(handles.axes_ImageOut);
imshow(Image);
imwrite(Image,'D:\Desktop\LFImage.jpg');
set(handles.text_Status,'String',['重聚焦参数： L = ',num2str(L)]);

function ImageOut = LFShift( InputPath , mm , nn , Slope)
%InputPaht为光场文件存储路径
%mm为相机阵列行数
%nn为相机阵列列数
%Slope为重聚焦距离

%% 创建光场文件----------------------------------------------------
global handles;

Num = mm*nn;%照片总数
num = 1;%计数器
InputPath_Dir = InputPath;	%文件存储路径
InputPath_LF = fullfile( InputPath_Dir , 'LF.mat'); %光场文件路径
File_LF = dir( InputPath_LF );  

if( ~isempty(File_LF) )
    set(handles.text_Status,'String','正在载入光场数据');
    pause(0.001);
    load (InputPath_LF);    %载入光场文件
else
    for ii=1:mm
        for jj=1:nn
            set(handles.text_Status,'String',['正在生成光场数据：',num2str(num),'/',num2str(Num)]);
            pause(0.001);
            FnamePattern = [ num2str(ii) , '-' , num2str(jj) , '.bmp' ];	%文件名
            InputPath_Image = fullfile( InputPath_Dir , FnamePattern );   %文件读取路径
            Image = imread( InputPath_Image );
            LF(ii,jj,:,:,:) = Image;
            num = num + 1;
        end
    end
    num = 1;
    set(handles.text_Status,'String','正在保存光场文件');
    pause(0.001);
    save ( InputPath_LF , 'LF' );%保存光场文件
end

%% 光场再现--------------------------------------------------------
set(handles.text_Status,'String','正在进行重聚焦算法');
pause(0.001);
LFSize = size( LF );
NColChans = size( LF , 5 );
% LF = LFConvertToFloat( LF , 'single' );
Class_Orig = class(LF);
LF = cast(LF, 'single');
LF = LF ./ cast(intmax(Class_Orig), 'single');
LF(:,:,:,:,end+1) = ones(size(LF(:,:,:,:,1)), 'single');

TVSlope = Slope;
SUSlope = Slope;
[vv, uu] = ndgrid(1:LFSize(3), 1:LFSize(4));

VVec = linspace(-0.5,0.5, LFSize(1)) * TVSlope*LFSize(1);
UVec = linspace(-0.5,0.5, LFSize(2)) * SUSlope*LFSize(2);

for( TIdx = 1:LFSize(1) )
	VOffset = VVec(TIdx);
    for( SIdx = 1:LFSize(2) )
		UOffset = UVec(SIdx);
        
        set(handles.text_Status,'String',['正在进行重聚焦算法：',num2str(num),'/',num2str(Num)]);
        pause(0.001);
        num = num + 1;
		
        for( iChan=1:size(LF,5) )
            CurSlice = squeeze( LF( TIdx , SIdx , : , : , iChan ) );
            CurSlice = interpn( CurSlice , vv+VOffset , uu+UOffset , 'linear' , 0);
%             CurSlice = interpn( CurSlice , vv+VOffset , uu+UOffset , 'nearest' , 0);
            LF(TIdx,SIdx, :,:, iChan) = CurSlice;
        end
    end
end

ImageOut = squeeze(sum(sum(LF,1),2));
WeightChan = ImageOut(:,:,end);
ChanSize = numel(ImageOut(:,:,1));
for( iColChan = 1:NColChans )
	ImageOut(:,:,iColChan) = ImageOut(:,:,iColChan) ./ WeightChan;
end
ImageOut = ImageOut(:,:,1:iColChan);

function pushbutton_Test_Callback(~,~,~)
%InputPaht为光场文件存储路径
%mm为相机阵列行数
%nn为相机阵列列数
%Slope为重聚焦距离
%N为重聚焦图片编号，与重聚焦参数Slope一一对应

%% 创建光场文件----------------------------------------------------
global handles;

InputPath = get(handles.edit_dirPath,'String');
mm = str2double(get(handles.edit_M,'String'));
nn = str2double(get(handles.edit_N,'String'));

Num = mm*nn;%照片总数
num = 1;%计数器
InputPath_Dir = InputPath;	%文件存储路径
InputPath_LF = fullfile( InputPath_Dir , 'LF.mat'); %光场文件路径
File_LF = dir( InputPath_LF );  

if( ~isempty(File_LF) )
    set(handles.text_Status,'String','正在载入光场数据');
    pause(0.001);
    load (InputPath_LF);    %载入光场文件
else
    for ii=1:mm
        for jj=1:nn
            set(handles.text_Status,'String',['正在生成光场数据：',num2str(num),'/',num2str(Num)]);
            pause(0.001);
            FnamePattern = [ num2str(ii) , '-' , num2str(jj) , '.bmp' ];	%文件名
            InputPath_Image = fullfile( InputPath_Dir , FnamePattern );   %文件读取路径
            Image = imread( InputPath_Image );
            LF(ii,jj,:,:,:) = Image;
            num = num + 1;
        end
    end
    num = 1;
    set(handles.text_Status,'String','正在保存光场文件');
    pause(0.001);
    save ( InputPath_LF , 'LF' );%保存光场文件
end

%% 光场再现--------------------------------------------------------
set(handles.text_Status,'String','正在进行重聚焦算法');
pause(0.001);

LFSize = size( LF );
NColChans = size( LF , 5 );
Class_Orig = class(LF);
LF = cast(LF, 'single');
LF = LF ./ cast(intmax(Class_Orig), 'single');
LF(:,:,:,:,end+1) = ones(size(LF(:,:,:,:,1)), 'single');
Num = ((get(handles.slider_LF_L,'Max')-get(handles.slider_LF_L,'Min'))*100)+1;

isDirPath = dir( [get(handles.edit_dirPath,'String'),'\重聚焦序列'] );
if isempty(isDirPath)
    mkdir([get(handles.edit_dirPath,'String'),'\重聚焦序列']);   %新建重聚焦序列文件夹
end

Min = get(handles.slider_LF_L,'Min');
Max = get(handles.slider_LF_L,'Max');
for Slope = Min:0.1:Max
	set(handles.text_Status,'String',['正在进行重聚焦算法：',num2str(num),'/',num2str(Num)]);
    pause(0.001);
    num = num + 1;
    
    OutPath = [ num2str(Slope) , '.bmp' ];%输入输出文件名
    FilePath = [get(handles.edit_dirPath,'String'),'\重聚焦序列\',OutPath];
    isFilePath = dir( [get(handles.edit_dirPath,'String'),'\重聚焦序列\',OutPath] );%文件读取/存储位置
    if ~isempty(isFilePath)  %监测是否已存在该文件，如存在，读取该文件并进入下一层循环
        ImageOut = imread(FilePath);
        N = Slope2N(Slope);
        handles.ImageOut(:,:,:,N) = ImageOut;
        continue;
    end
    
    LF2 = LF;
    TVSlope = Slope;
    SUSlope = Slope;
    [vv, uu] = ndgrid(1:LFSize(3), 1:LFSize(4));
    VVec = linspace(-0.5,0.5, LFSize(1)) * TVSlope*LFSize(1);
    UVec = linspace(-0.5,0.5, LFSize(2)) * SUSlope*LFSize(2);
    for( TIdx = 1:LFSize(1) )
        VOffset = VVec(TIdx);
        for( SIdx = 1:LFSize(2) )
            UOffset = UVec(SIdx);
            for( iChan=1:size(LF2,5) )
                CurSlice = squeeze( LF2( TIdx , SIdx , : , : , iChan ) );
                CurSlice = interpn( CurSlice , vv+VOffset , uu+UOffset , 'linear' , 0);
%                 CurSlice = interpn( CurSlice , vv+VOffset , uu+UOffset , 'nearest' , 0);
                LF2(TIdx,SIdx, :,:, iChan) = CurSlice;
            end
        end
    end
    ImageOut = squeeze(sum(sum(LF2,1),2));
    WeightChan = ImageOut(:,:,end);
    for iColChan = 1:NColChans
        ImageOut(:,:,iColChan) = ImageOut(:,:,iColChan) ./ WeightChan;
    end
    ImageOut = ImageOut(:,:,1:iColChan);
    N = Slope2N(Slope); 
	imwrite(ImageOut,FilePath);     %存储图片到硬盘中
%     handles.ImageOut(:,:,:,N) = ImageOut;   %存储图片到句柄变量中
	handles.ImageOut(:,:,:,1) = ImageOut;   %存储图片到句柄变量中  
    
end

Slope = get(handles.slider_LF_L,'Value');   %获取图像重聚焦参数
N = Slope2N(Slope);	%需要显示的图片编号
axes(handles.axes_ImageOut);
handles.ImageH = imshow(handles.ImageOut(:,:,:,N));%放置图像并取得图像句柄
set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%将Button函数重新赋给新句柄
set(handles.text_Status,'String',['重聚焦参数： L = ',num2str(get(handles.slider_LF_L,'Value'))]);

function slider_LF_L_Callback(~,~,~)
global handles;

N = Slope2N(get(handles.slider_LF_L,'Value'));	%获得图像编号
Slope = N2Slope(N);	%由图像编号反推正确的重聚焦参数
set(handles.slider_LF_L,'Value',Slope);	%修改slider_LF_L显示的数值
set(handles.edit_LF_L,'String',num2str(Slope));	%修改edit_LF_L显示的数值

Image = handles.ImageOut(:,:,:,N);
axes(handles.axes_ImageOut);
handles.ImageH = imshow(Image);%放置图像并取得图像句柄
set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%将Button函数重新赋给新句柄
set(handles.text_Status,'String',['重聚焦参数： L = ',num2str(Slope)]);

function edit_LF_L_Callback(~,~,~)
global handles;
Slope=get(handles.edit_LF_L,'String');                                      %读取edit_ASL_Z中的数据
Slope=str2double(Slope);                                                    %字符串转double型
if Slope>get(handles.slider_LF_L,'Max')                                     %如果数值超过slider_ASL_Z最大值
    Slope=get(handles.slider_LF_L,'Max');                                   %则设置该值为最大值
elseif Slope<get(handles.slider_LF_L,'Min')                                 %如果数值小于slider_ASL_Z最小值
	Slope=get(handles.slider_LF_L,'Min');                                   %则设置该值为最小值
end
N = Slope2N(Slope);
Slope = N2Slope(N);
set(handles.slider_LF_L,'Value',Slope);                                     %将Slope数据赋值给slider_ASL_Z
set(handles.edit_LF_L,'String',num2str(Slope));                             %刷新edit_ASL_Z为正确值

Image = handles.ImageOut(:,:,:,N);
axes(handles.axes_ImageOut);
handles.ImageH = imshow(Image);%放置图像并取得图像句柄
set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%将Button函数重新赋给新句柄
set(handles.text_Status,'String',['重聚焦参数： L = ',num2str(Slope)]);

%% 文件编号与重聚焦参数的转换
function Slope = N2Slope(N)
global handles;
Min = get(handles.slider_LF_L,'Min');   %获取Slope最小值
Slope = (((N-1)/10)+Min);

function N = Slope2N(Slope)
global handles;
Min = get(handles.slider_LF_L,'Min');   %获取Slope最小值
N = round(((Slope-Min)*10)+1);	%获得图像编号

%% 边缘检测函数
function Out = Edge_Sobel(ImageIn)

ImageIn = rgb2gray(ImageIn);
[high,width] = size(ImageIn);
F = double(ImageIn);
U = double(ImageIn);
ImageOut = ImageIn;
for i = 2:high - 1   %sobel边缘检测
    for j = 2:width - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + F(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + F(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F(i+1,j-1));
        ImageOut(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end 
ImageOut = im2uint8(ImageOut);
% ImageOut = im2bw(ImageOut,0.6);
Out = sum(sum(ImageOut,1),2);

%% 未知函数
function LF = LFConvertToFloat( LF, Precision )

Precision = LFDefaultVal('Precision', 'single');

OrigClass = class(LF);
IsInt = isinteger(LF);

LF = cast(LF, Precision);

if( IsInt )
	LF = LF ./ cast(intmax(OrigClass), Precision);
end