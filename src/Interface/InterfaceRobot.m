function varargout = InterfaceRobot(varargin)
% INTERFACEROBOT MATLAB code for InterfaceRobot.fig
%      INTERFACEROBOT, by itself, creates a new INTERFACEROBOT or raises the existing
%      singleton*.
%
%      H = INTERFACEROBOT returns the handle to a new INTERFACEROBOT or the handle to
%      the existing singleton*.
%
%      INTERFACEROBOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACEROBOT.M with the given input arguments.
%
%      INTERFACEROBOT('Property','Value',...) creates a new INTERFACEROBOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterfaceRobot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterfaceRobot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfaceRobot

% Last Modified by GUIDE v2.5 26-Feb-2020 08:26:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfaceRobot_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfaceRobot_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before InterfaceRobot is made visible.
function InterfaceRobot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterfaceRobot (see VARARGIN)

% Choose default command line output for InterfaceRobot
handles.output = hObject;

% Variables
handles.q1 = 0;


% Tracés
axes(handles.axes1);
handles.X=[0 1 1 0 0 1];
handles.Y=[0 0 1 1 0 0];
handles.Z=[0 1 2 3 4 5];
handles.hline1=line(handles.X,handles.Y,handles.Z);
rotate3d
axis([-1 2 -1 2 -1 6]);
grid on



% Paramétrage
set(handles.slider1,'Min',-1,'Max',10);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfaceRobot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterfaceRobot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function handles=UpdateGraphique(handles)
handles.X=[handles.q1 1 1 0 0 1];
set(handles.hline1,'XData',handles.X);
return


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.q1 = get(hObject,'Value');
set(handles.edit1,'String',num2str(handles.q1));
handles=UpdateGraphique(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.q1 = str2num(get(hObject,'String'));
set(handles.slider1,'Value',handles.q1);
handles=UpdateGraphique(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

