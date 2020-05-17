function varargout = IrisCollection(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IrisCollection_OpeningFcn, ...
                   'gui_OutputFcn',  @IrisCollection_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

%�}�l�ɪ��A
function IrisCollection_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

global Target;
global Address;
global PicName;
global F;
global StorageArray;
global PathName;
global StartTime;
global RecordLabel;
global pic;
global WhiteNum;
global BlackNum;
global Draw;
Draw = 0;
WhiteNum = 0.2;
BlackNum = 0.5;

load StorageLabell.mat

StartTime = tic;

Target = 1;                                 %��l�ƲĴX�i�Ϥ�
MainFile = dir();
MainFileDir = MainFile.folder;              %�]�w��Ƨ���l���|

load(fullfile(MainFileDir, 'Array.mat'))
LPath = [MainFileDir,'\Cartesian2\L\'];     %�������|
RPath = [MainFileDir,'\Cartesian2\R\'];     %�k�����|

FindLJpg = [LPath,'*jpg'];                  %�������|+*jpg
FindRJpg = [RPath,'*jpg'];                  %�k�����|+*jpg


LJpg = dir(FindLJpg);                       %�����Ϥ����
for i = 1 : size(LJpg,1)
    LPicName{i} = LJpg(i).name;             %Ū���ɦW
end

pic = imread(['Cartesian2\L\',LJpg(Target).name]);                 %Ū��

RJpg = dir(FindRJpg);                       %�k���Ϥ����
for i = 1 : size(RJpg,1)
    RPicName{i} = RJpg(i).name;             %Ū���ɦW
end
pic = imread(['Cartesian2\R\',RJpg(Target).name]);
AfterAdjustpic = imadjust(pic,[0.2 0.5],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p

if StorageArray{Target,2} == 1
    set(handles.FiveWay1, 'Value',1)
elseif StorageArray{Target,2} == 2
    set(handles.FiveWay2, 'Value',1)
elseif StorageArray{Target,2} == 3
    set(handles.FiveWay3, 'Value',1)
elseif StorageArray{Target,2} == 4
    set(handles.FiveWay4, 'Value',1)
elseif StorageArray{Target,2} == 5
    set(handles.FiveWay5, 'Value',1)
elseif StorageArray{Target,2} == 6
    set(handles.FiveWay6, 'Value',1)
elseif StorageArray{Target,2} == 7
    set(handles.FiveWay7, 'Value',1)
elseif StorageArray{Target,2} == 8
    set(handles.FiveWay8, 'Value',1)
elseif StorageArray{Target,2} == 9
    set(handles.FiveWay9, 'Value',1)
elseif StorageArray{Target,2} == 10
    set(handles.FiveWay8, 'Value',1)
elseif StorageArray{Target,2} == 11
    set(handles.FiveWay9, 'Value',1)
elseif StorageArray{Target,2} == 12
    set(handles.FiveWay12, 'Value',1)
else
    set(handles.FiveWay1,  'Value',1)
end


%��X�ثe�ɦW
OutputImageNameText = ['�{�b�G',LPicName{Target}];
set(handles.OutputImageName,'string',OutputImageNameText)

function varargout = IrisCollection_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

%�����ܴ�
%����1
function FiveWay1_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 1;

%����2
function FiveWay2_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 2;

%����3
function FiveWay3_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 3;

%����4
function FiveWay4_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 4;

%����5
function FiveWay5_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 5;

%����6
function FiveWay6_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 6;

%����7
function FiveWay7_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 7;

%����8
function FiveWay8_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 8;

%����9
function FiveWay9_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 9;

%����10
function FiveWay10_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 10;

%����11
function FiveWay11_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 11;

%����12
function FiveWay12_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global RecordLabel;
StorageArray{Target,2} = 12;

%���^�e�@�Ϥ�
function Forward_Callback(hObject, eventdata, handles)
global Target;
global Address;
global PathName;
global StorageArray;
global LX;
global LY;
global RX;
global RY;
global timer;
global StartTime;
global RecordLabel;
global pic;
global WhiteNum;
global BlackNum;
global Draw;
WhiteNum = 0.2;
BlackNum = 0.5;
LX(1) = 1;LX(2) = 640;
LY(1) = 1;LY(2) = 480;
RX(1) = 1;RX(2) = 640;
RY(1) = 1;RY(2) = 480;

timer = (tic - StartTime)/10000000;
if(timer > 120)
    StartTime = StartTime + 1200000000;
    save Array.mat StorageArray
end

%����X
if Target > 1
    Target = Target - 1;
end

%��X�Ϥ�
MainFile = dir();
MainFileDir = MainFile.folder;              %�]�w��Ƨ���l���|

LPath = [MainFileDir,'\Cartesian2\L\'];     %�������|
RPath = [MainFileDir,'\Cartesian2\R\'];     %�k�����|

FindLJpg = [LPath,'*jpg'];                  %�������|+*jpg
FindRJpg = [RPath,'*jpg'];                  %�k�����|+*jpg

LJpg = dir(FindLJpg);                       %�����Ϥ����
for i = 1 : size(LJpg,1)
    LPicName{i} = LJpg(i).name;             %Ū���ɦW
end

pic = imread(['Cartesian2\L\',LJpg(Target).name]);

RJpg = dir(FindRJpg);                       %�k���Ϥ����
for i = 1 : size(RJpg,1)
    RPicName{i} = RJpg(i).name;             %Ū���ɦW
end

pic = imread(['Cartesian2\R\',RJpg(Target).name]);
AfterAdjustpic = imadjust(pic,[0.2 0.5],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p

%��XRadioButton
if StorageArray{Target,2} == 1
    set(handles.FiveWay1, 'Value',1)
elseif StorageArray{Target,2} == 2
    set(handles.FiveWay2, 'Value',1)
elseif StorageArray{Target,2} == 3
    set(handles.FiveWay3, 'Value',1)
elseif StorageArray{Target,2} == 4
    set(handles.FiveWay4, 'Value',1)
elseif StorageArray{Target,2} == 5
    set(handles.FiveWay5, 'Value',1)
elseif StorageArray{Target,2} == 6
    set(handles.FiveWay6, 'Value',1)
elseif StorageArray{Target,2} == 7
    set(handles.FiveWay7, 'Value',1)
elseif StorageArray{Target,2} == 8
    set(handles.FiveWay8, 'Value',1)
elseif StorageArray{Target,2} == 9
    set(handles.FiveWay9, 'Value',1)
elseif StorageArray{Target,2} == 10
    set(handles.FiveWay8, 'Value',1)
elseif StorageArray{Target,2} == 11
    set(handles.FiveWay9, 'Value',1)
elseif StorageArray{Target,2} == 12
    set(handles.FiveWay12, 'Value',1)
else
    set(handles.FiveWay1,  'Value',1)
end

%��X�ثe�ɦW
OutputImageNameText = ['�{�b�G',LPicName{Target}];
set(handles.OutputImageName,'string',OutputImageNameText)

%����U�@�Ϥ�
function Next_Callback(hObject, eventdata, handles)
global Target;
global Address;
global PathName;
global StorageArray;
global LX;
global LY;
global RX;
global RY;
global StartTime;
global timer;
global RecordLabel;
global pic;
global WhiteNum;
global BlackNum;
global Draw;
WhiteNum = 0.2;
BlackNum = 0.5;

LX(1) = 1;LX(2) = 640;
LY(1) = 1;LY(2) = 480;
RX(1) = 1;RX(2) = 640;
RY(1) = 2;RY(2) = 480;

timer = (tic - StartTime)/10000000;
if(timer > 120)
    StartTime = StartTime + 1200000000;
    save Array.mat StorageArray
end
%��X�Ϥ�
MainFile = dir();
MainFileDir = MainFile.folder;              %�]�w��Ƨ���l���|

LPath = [MainFileDir,'\Cartesian2\L\'];     %�������|
RPath = [MainFileDir,'\Cartesian2\R\'];     %�k�����|

FindLJpg = [LPath,'*jpg'];                  %�������|+*jpg
FindRJpg = [RPath,'*jpg'];                  %�k�����|+*jpg

LJpg = dir(FindLJpg);                       %�����Ϥ����

%����X
if Target < size(LJpg,1)
    Target = Target + 1;
end

for i = 1 : size(LJpg,1)
    LPicName{i} = LJpg(i).name;             %Ū���ɦW
end

pic = imread(['Cartesian2\L\',LJpg(Target).name]);

RJpg = dir(FindRJpg);                       %�k���Ϥ����
for i = 1 : size(RJpg,1)
    RPicName{i} = RJpg(i).name;             %Ū���ɦW
end

pic = imread(['Cartesian2\R\',RJpg(Target).name]);
AfterAdjustpic = imadjust(pic,[0.2 0.5],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p

%��X�ثe�ɦW
OutputImageNameText = ['�{�b�G',LPicName{Target}];
set(handles.OutputImageName,'string',OutputImageNameText)

%��XRadioButton
if StorageArray{Target,2} == 1
    set(handles.FiveWay1, 'Value',1)
elseif StorageArray{Target,2} == 2
    set(handles.FiveWay2, 'Value',1)
elseif StorageArray{Target,2} == 3
    set(handles.FiveWay3, 'Value',1)
elseif StorageArray{Target,2} == 4
    set(handles.FiveWay4, 'Value',1)
elseif StorageArray{Target,2} == 5
    set(handles.FiveWay5, 'Value',1)
elseif StorageArray{Target,2} == 6
    set(handles.FiveWay6, 'Value',1)
elseif StorageArray{Target,2} == 7
    set(handles.FiveWay7, 'Value',1)
elseif StorageArray{Target,2} == 8
    set(handles.FiveWay8, 'Value',1)
elseif StorageArray{Target,2} == 9
    set(handles.FiveWay9, 'Value',1)
elseif StorageArray{Target,2} == 10
    set(handles.FiveWay8, 'Value',1)
elseif StorageArray{Target,2} == 11
    set(handles.FiveWay9, 'Value',1)
elseif StorageArray{Target,2} == 12
    set(handles.FiveWay12, 'Value',1)
else
    set(handles.FiveWay1,  'Value',1)
end


%�x�s
function Save_Callback(hObject, eventdata, handles)
global StorageArray
save Array.mat StorageArray

%������w�Ϥ�
function JumpTexts_Callback(hObject, eventdata, handles)
global StorageArray;
global Target;
global timer;
global StartTime;
global RecordLabel;
global pic;
global WhiteNum;
global BlackNum;
global Draw;
WhiteNum = 0.2;
BlackNum = 0.5;

timer = (tic - StartTime)/10000000;
if(timer > 120)
    StartTime = StartTime + 1200000000;
    save Array.mat StorageArray;
end
JumpString = get(handles.JumpTexts,'string');
JumpNum = str2num(JumpString);
Target = JumpNum * 10 + 1;

%��X�Ϥ�
MainFile = dir();
MainFileDir = MainFile.folder;              %�]�w��Ƨ���l���|

LPath = [MainFileDir,'\Cartesian2\L\'];     %�������|
RPath = [MainFileDir,'\Cartesian2\R\'];     %�k�����|

FindLJpg = [LPath,'*jpg'];                  %�������|+*jpg
FindRJpg = [RPath,'*jpg'];                  %�k�����|+*jpg

LJpg = dir(FindLJpg);                       %�����Ϥ����

for i = 1 : size(LJpg,1)
    LPicName{i} = LJpg(i).name;             %Ū���ɦW
end

pic = imread(['Cartesian2\L\',LJpg(Target).name]);

RJpg = dir(FindRJpg);                       %�k���Ϥ����
for i = 1 : size(RJpg,1)
    RPicName{i} = RJpg(i).name;             %Ū���ɦW
end

pic = imread(['Cartesian2\R\',RJpg(Target).name]);
AfterAdjustpic = imadjust(pic,[0.2 0.5],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p

%��X�ثe�ɦW
OutputImageNameText = ['�{�b�G',LPicName{Target}];
set(handles.OutputImageName,'string',OutputImageNameText)

%��XRadioButton
if StorageArray{Target,2} == 1
    set(handles.FiveWay1, 'Value',1)
elseif StorageArray{Target,2} == 2
    set(handles.FiveWay2, 'Value',1)
elseif StorageArray{Target,2} == 3
    set(handles.FiveWay3, 'Value',1)
elseif StorageArray{Target,2} == 4
    set(handles.FiveWay4, 'Value',1)
elseif StorageArray{Target,2} == 5
    set(handles.FiveWay5, 'Value',1)
elseif StorageArray{Target,2} == 6
    set(handles.FiveWay6, 'Value',1)
elseif StorageArray{Target,2} == 7
    set(handles.FiveWay7, 'Value',1)
elseif StorageArray{Target,2} == 8
    set(handles.FiveWay8, 'Value',1)
elseif StorageArray{Target,2} == 9
    set(handles.FiveWay9, 'Value',1)
else
    set(handles.FiveWay1,  'Value',1)
end

function JumpTexts_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in WhiteWeak.
function WhiteWeak_Callback(hObject, eventdata, handles)
% hObject    handle to WhiteWeak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
%�קK���X
WhiteNum = WhiteNum + 0.05;
if WhiteNum > BlackNum
    WhiteNum = WhiteNum - 0.05;
end
AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p


% --- Executes on button press in WhiteWeak.
function WhiteStrong_Callback(hObject, eventdata, handles)
% hObject    handle to WhiteWeak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
%�קK���X
WhiteNum = WhiteNum - 0.05;
if WhiteNum < 0
    WhiteNum = WhiteNum + 0.05;
end
AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p

% --- Executes on button press in BlackStrong.
function BlackStrong_Callback(hObject, eventdata, handles)
% hObject    handle to BlackStrong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
%�קK���X
BlackNum = BlackNum + 0.05;
if BlackNum > 1
    BlackNum = BlackNum - 0.05;
end
AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p

% --- Executes on button press in BlackWeak.
function BlackWeak_Callback(hObject, eventdata, handles)
% hObject    handle to BlackWeak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
%�קK���X
BlackNum = BlackNum - 0.05;
if BlackNum < WhiteNum
    BlackNum = BlackNum + 0.05;
end
AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p


% --- Executes on button press in DrawSupLine.
function DrawSupLine_Callback(hObject, eventdata, handles)
% hObject    handle to DrawSupLine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
Draw = 1;

AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
axis image;                                 %�վ�Ϥ��j�p
hold on;
x = 120;
y = 120;
r = 120 * 5 / 9;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'red');

% --- Executes on button press in CloseSupLine.
function CloseSupLine_Callback(hObject, eventdata, handles)
% hObject    handle to CloseSupLine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
Draw = 0;

AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
axis image;                                 %�վ�Ϥ��j�p


% --- Executes on button press in TurnToOriginalImage.
function TurnToOriginalImage_Callback(hObject, eventdata, handles)
% hObject    handle to TurnToOriginalImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
%�קK���X
WhiteNum = 0;
BlackNum = 1;
AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p

% --- Executes on button press in TurnToBestImage.
function TurnToBestImage_Callback(hObject, eventdata, handles)
% hObject    handle to TurnToBestImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
global WhiteNum;
global BlackNum;
global Draw;
WhiteNum = 0.2;
BlackNum = 0.5;
AfterAdjustpic = imadjust(pic,[WhiteNum BlackNum],[0 1]);
if Draw == 1
    DrawCircle;
else Draw == 0
    imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %��X�k�Ϥ�
end
axis image;                                 %�վ�Ϥ��j�p
