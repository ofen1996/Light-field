function Main
%% ��������������
clear all;
clc;

%% �½�ͼ�β������������
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

%% ͼ����ʾ����
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
    'String','�ļ��洢·����',...
    'Units','pixels',...
    'Position',[870 650 150 30]);

handles.edit_dirPath = uicontrol('Style','edit',...
    'FontName','MS SansSerif',...
    'FontSize',12,...
    'FontWeight','normal',...
    'HandleVisibility','on',...
    'HorizontalAlignment','left',...
	'parent',handles.uipanel_LF,...
    'String','C:\Users\ofen\Desktop\20180330���\result2snap',...
    'Units','pixels',...
    'Position',[870 600 350 30]);

handles.text_M = uicontrol('Style','text',...
    'FontName','MS SansSerif',...
    'FontSize',15,...
    'FontWeight','bold',...
    'HandleVisibility','on',...
    'HorizontalAlignment','left',...
	'parent',handles.uipanel_LF,...
    'String','�������������',...
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
    'String','�������������',...
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
    'String','�ؾ۽�������',...
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
    'String','����',...
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
    'String','������',...
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

Point = get(handles.axes_ImageOut,'CurrentPoint');  %��ȡ�����������
Point = Point(1,1:2);
x = ceil(Point(1));   %������
y = ceil(Point(2));   %������
X = (x-40:x+40);
Y = (y-40:y+40);

ImageSize = size(handles.ImageOut);
for N = 1:ImageSize(4)
    Sobel(N) = Edge_Sobel(handles.ImageOut(Y,X,:,N));   %ע��XY�����еĶ�Ӧ��ϵ��
end
[ ~ , N ] = find(Sobel == max(Sobel));    %NΪ��Ե����ֵ���ֵ�ı��
proSlope = N2Slope(N); %proSlopeΪ��ȷ��Slope����

A = -1;  %A����0ѡ���ƽ��������̣�AС��0ѡ��ƽ���������
if A>0
    %��ƽ���������
    set(handles.slider_LF_L,'Value',proSlope);
    set(handles.edit_LF_L,'String',num2str(proSlope));
    set(handles.text_Status,'String',['�ؾ۽������� L = ',num2str(proSlope)]);
    axes(handles.axes_ImageOut);
    handles.ImageH = imshow(handles.ImageOut(:,:,:,N));%����ͼ��ȡ��ͼ����
    set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%��Button�������¸����¾��
else
    %ƽ�����ɴ������
    currSlope = get(handles.slider_LF_L,'Value');   %��ȡ��ǰͼ���Slope
    currN = Slope2N(currSlope);
    set(handles.slider_LF_L,'Value',proSlope);
    set(handles.edit_LF_L,'String',num2str(proSlope));
    set(handles.text_Status,'String',['�ؾ۽������� L = ',num2str(proSlope)]);
    for n = round(linspace(currN,N,8))
        axes(handles.axes_ImageOut);
        handles.ImageH = imshow(handles.ImageOut(:,:,:,n));%����ͼ��ȡ��ͼ����
        pause(0.001);
    end
    set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%��Button�������¸����¾��
end

a = 1;

function pushbutton_Star_Callback(~,~,~)
global handles;

set(handles.text_Status,'String','��ʼ�����ؾ۽�����');
InputPath = get(handles.edit_dirPath,'String');
mm = str2double(get(handles.edit_M,'String'));
nn = str2double(get(handles.edit_N,'String'));
L = str2double(get(handles.edit_L,'String'));

Image = LFShift( InputPath , mm , nn , L );
axes(handles.axes_ImageOut);
imshow(Image);
imwrite(Image,'D:\Desktop\LFImage.jpg');
set(handles.text_Status,'String',['�ؾ۽������� L = ',num2str(L)]);

function ImageOut = LFShift( InputPath , mm , nn , Slope)
%InputPahtΪ�ⳡ�ļ��洢·��
%mmΪ�����������
%nnΪ�����������
%SlopeΪ�ؾ۽�����

%% �����ⳡ�ļ�----------------------------------------------------
global handles;

Num = mm*nn;%��Ƭ����
num = 1;%������
InputPath_Dir = InputPath;	%�ļ��洢·��
InputPath_LF = fullfile( InputPath_Dir , 'LF.mat'); %�ⳡ�ļ�·��
File_LF = dir( InputPath_LF );  

if( ~isempty(File_LF) )
    set(handles.text_Status,'String','��������ⳡ����');
    pause(0.001);
    load (InputPath_LF);    %����ⳡ�ļ�
else
    for ii=1:mm
        for jj=1:nn
            set(handles.text_Status,'String',['�������ɹⳡ���ݣ�',num2str(num),'/',num2str(Num)]);
            pause(0.001);
            FnamePattern = [ num2str(ii) , '-' , num2str(jj) , '.bmp' ];	%�ļ���
            InputPath_Image = fullfile( InputPath_Dir , FnamePattern );   %�ļ���ȡ·��
            Image = imread( InputPath_Image );
            LF(ii,jj,:,:,:) = Image;
            num = num + 1;
        end
    end
    num = 1;
    set(handles.text_Status,'String','���ڱ���ⳡ�ļ�');
    pause(0.001);
    save ( InputPath_LF , 'LF' );%����ⳡ�ļ�
end

%% �ⳡ����--------------------------------------------------------
set(handles.text_Status,'String','���ڽ����ؾ۽��㷨');
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
        
        set(handles.text_Status,'String',['���ڽ����ؾ۽��㷨��',num2str(num),'/',num2str(Num)]);
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
%InputPahtΪ�ⳡ�ļ��洢·��
%mmΪ�����������
%nnΪ�����������
%SlopeΪ�ؾ۽�����
%NΪ�ؾ۽�ͼƬ��ţ����ؾ۽�����Slopeһһ��Ӧ

%% �����ⳡ�ļ�----------------------------------------------------
global handles;

InputPath = get(handles.edit_dirPath,'String');
mm = str2double(get(handles.edit_M,'String'));
nn = str2double(get(handles.edit_N,'String'));

Num = mm*nn;%��Ƭ����
num = 1;%������
InputPath_Dir = InputPath;	%�ļ��洢·��
InputPath_LF = fullfile( InputPath_Dir , 'LF.mat'); %�ⳡ�ļ�·��
File_LF = dir( InputPath_LF );  

if( ~isempty(File_LF) )
    set(handles.text_Status,'String','��������ⳡ����');
    pause(0.001);
    load (InputPath_LF);    %����ⳡ�ļ�
else
    for ii=1:mm
        for jj=1:nn
            set(handles.text_Status,'String',['�������ɹⳡ���ݣ�',num2str(num),'/',num2str(Num)]);
            pause(0.001);
            FnamePattern = [ num2str(ii) , '-' , num2str(jj) , '.bmp' ];	%�ļ���
            InputPath_Image = fullfile( InputPath_Dir , FnamePattern );   %�ļ���ȡ·��
            Image = imread( InputPath_Image );
            LF(ii,jj,:,:,:) = Image;
            num = num + 1;
        end
    end
    num = 1;
    set(handles.text_Status,'String','���ڱ���ⳡ�ļ�');
    pause(0.001);
    save ( InputPath_LF , 'LF' );%����ⳡ�ļ�
end

%% �ⳡ����--------------------------------------------------------
set(handles.text_Status,'String','���ڽ����ؾ۽��㷨');
pause(0.001);

LFSize = size( LF );
NColChans = size( LF , 5 );
Class_Orig = class(LF);
LF = cast(LF, 'single');
LF = LF ./ cast(intmax(Class_Orig), 'single');
LF(:,:,:,:,end+1) = ones(size(LF(:,:,:,:,1)), 'single');
Num = ((get(handles.slider_LF_L,'Max')-get(handles.slider_LF_L,'Min'))*100)+1;

isDirPath = dir( [get(handles.edit_dirPath,'String'),'\�ؾ۽�����'] );
if isempty(isDirPath)
    mkdir([get(handles.edit_dirPath,'String'),'\�ؾ۽�����']);   %�½��ؾ۽������ļ���
end

Min = get(handles.slider_LF_L,'Min');
Max = get(handles.slider_LF_L,'Max');
for Slope = Min:0.1:Max
	set(handles.text_Status,'String',['���ڽ����ؾ۽��㷨��',num2str(num),'/',num2str(Num)]);
    pause(0.001);
    num = num + 1;
    
    OutPath = [ num2str(Slope) , '.bmp' ];%��������ļ���
    FilePath = [get(handles.edit_dirPath,'String'),'\�ؾ۽�����\',OutPath];
    isFilePath = dir( [get(handles.edit_dirPath,'String'),'\�ؾ۽�����\',OutPath] );%�ļ���ȡ/�洢λ��
    if ~isempty(isFilePath)  %����Ƿ��Ѵ��ڸ��ļ�������ڣ���ȡ���ļ���������һ��ѭ��
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
	imwrite(ImageOut,FilePath);     %�洢ͼƬ��Ӳ����
%     handles.ImageOut(:,:,:,N) = ImageOut;   %�洢ͼƬ�����������
	handles.ImageOut(:,:,:,1) = ImageOut;   %�洢ͼƬ�����������  
    
end

Slope = get(handles.slider_LF_L,'Value');   %��ȡͼ���ؾ۽�����
N = Slope2N(Slope);	%��Ҫ��ʾ��ͼƬ���
axes(handles.axes_ImageOut);
handles.ImageH = imshow(handles.ImageOut(:,:,:,N));%����ͼ��ȡ��ͼ����
set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%��Button�������¸����¾��
set(handles.text_Status,'String',['�ؾ۽������� L = ',num2str(get(handles.slider_LF_L,'Value'))]);

function slider_LF_L_Callback(~,~,~)
global handles;

N = Slope2N(get(handles.slider_LF_L,'Value'));	%���ͼ����
Slope = N2Slope(N);	%��ͼ���ŷ�����ȷ���ؾ۽�����
set(handles.slider_LF_L,'Value',Slope);	%�޸�slider_LF_L��ʾ����ֵ
set(handles.edit_LF_L,'String',num2str(Slope));	%�޸�edit_LF_L��ʾ����ֵ

Image = handles.ImageOut(:,:,:,N);
axes(handles.axes_ImageOut);
handles.ImageH = imshow(Image);%����ͼ��ȡ��ͼ����
set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%��Button�������¸����¾��
set(handles.text_Status,'String',['�ؾ۽������� L = ',num2str(Slope)]);

function edit_LF_L_Callback(~,~,~)
global handles;
Slope=get(handles.edit_LF_L,'String');                                      %��ȡedit_ASL_Z�е�����
Slope=str2double(Slope);                                                    %�ַ���תdouble��
if Slope>get(handles.slider_LF_L,'Max')                                     %�����ֵ����slider_ASL_Z���ֵ
    Slope=get(handles.slider_LF_L,'Max');                                   %�����ø�ֵΪ���ֵ
elseif Slope<get(handles.slider_LF_L,'Min')                                 %�����ֵС��slider_ASL_Z��Сֵ
	Slope=get(handles.slider_LF_L,'Min');                                   %�����ø�ֵΪ��Сֵ
end
N = Slope2N(Slope);
Slope = N2Slope(N);
set(handles.slider_LF_L,'Value',Slope);                                     %��Slope���ݸ�ֵ��slider_ASL_Z
set(handles.edit_LF_L,'String',num2str(Slope));                             %ˢ��edit_ASL_ZΪ��ȷֵ

Image = handles.ImageOut(:,:,:,N);
axes(handles.axes_ImageOut);
handles.ImageH = imshow(Image);%����ͼ��ȡ��ͼ����
set(handles.ImageH,'ButtonDownFcn',@axes_ImageOut_ButtonDownFcn);%��Button�������¸����¾��
set(handles.text_Status,'String',['�ؾ۽������� L = ',num2str(Slope)]);

%% �ļ�������ؾ۽�������ת��
function Slope = N2Slope(N)
global handles;
Min = get(handles.slider_LF_L,'Min');   %��ȡSlope��Сֵ
Slope = (((N-1)/10)+Min);

function N = Slope2N(Slope)
global handles;
Min = get(handles.slider_LF_L,'Min');   %��ȡSlope��Сֵ
N = round(((Slope-Min)*10)+1);	%���ͼ����

%% ��Ե��⺯��
function Out = Edge_Sobel(ImageIn)

ImageIn = rgb2gray(ImageIn);
[high,width] = size(ImageIn);
F = double(ImageIn);
U = double(ImageIn);
ImageOut = ImageIn;
for i = 2:high - 1   %sobel��Ե���
    for j = 2:width - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + F(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + F(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F(i+1,j-1));
        ImageOut(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end 
ImageOut = im2uint8(ImageOut);
% ImageOut = im2bw(ImageOut,0.6);
Out = sum(sum(ImageOut,1),2);

%% δ֪����
function LF = LFConvertToFloat( LF, Precision )

Precision = LFDefaultVal('Precision', 'single');

OrigClass = class(LF);
IsInt = isinteger(LF);

LF = cast(LF, Precision);

if( IsInt )
	LF = LF ./ cast(intmax(OrigClass), Precision);
end