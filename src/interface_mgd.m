function varargout = interface_mgd(varargin)
% INTERFACE_MGD MATLAB code for interface_mgd.fig
%      INTERFACE_MGD, by itself, creates a new INTERFACE_MGD or raises the existing
%      singleton*.
%
%      H = INTERFACE_MGD returns the handle to a new INTERFACE_MGD or the handle to
%      the existing singleton*.
%
%      INTERFACE_MGD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_MGD.M with the given input arguments.
%
%      INTERFACE_MGD('Property','Value',...) creates a new INTERFACE_MGD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_mgd_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_mgd_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_mgd

% Last Modified by GUIDE v2.5 26-Feb-2020 09:27:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_mgd_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_mgd_OutputFcn, ...
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


% --- Executes just before interface_mgd is made visible.
function interface_mgd_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_mgd (see VARARGIN)

% Choose default command line output for interface_mgd
handles.output = hObject;

handles = init(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_mgd wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = interface_mgd_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function handles = init(handles)
    % Init variables
    disp("Initialize variables...");
    handles.q = zeros(6, 1);
    handles.pts = zeros(3, 6);
    
    handles.sliders = [handles.slider1 handles.slider2 handles.slider3 handles.slider4 handles.slider5 handles.slider6];
    handles.edits = [handles.edit1 handles.edit2 handles.edit3 handles.edit4 handles.edit5 handles.edit6];
    
    handles.names = ["A"; "B"; "C"; "D"; "E"; "F"];
    handles.gline = line(handles.pts(1,:), handles.pts(2,:), handles.pts(3,:));
    handles.gtext = text(handles.pts(1,:), handles.pts(2,:), handles.pts(3,:), handles.names);
    
    for i = 1:6
        set(handles.sliders(i), "UserData", i, "Min", -180, "Max", 180);
        set(handles.edits(i), "UserData", i);
        
        update_text_with_slider(handles, i);
    end
    
    % Init axes
    axes(handles.axes1);
    rotate3d;
    grid on;
    [L1, L2, L3, L4, L5] = get_robot_lengths;  
    bounds = sum([L1, L2, L3, L4, L5]) / 2;
    axis([-bounds bounds -bounds bounds -bounds bounds*2]);

function slider_create(hObject, eventdata, handles)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end

function edit_create(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function edit_callback(hObject, eventdata, handles)
    i = get(hObject, 'UserData');
    update_slider_with_text(handles, i);

function slider_callback(hObject, eventdata, handles)
    i = get(hObject, 'UserData');
    update_text_with_slider(handles, i);

function update_slider_with_text(handles, i)
    handles.q(i) = str2double(get(handles.edits(i), 'String'));
    set(handles.sliders(i), 'Value', handles.q(i));
    update_axes(handles.edits(i), handles);

function update_text_with_slider(handles, i)
    handles.q(i) = get(handles.sliders(i), 'Value');
    set(handles.edits(i), 'String', num2str(handles.q(i)));
    update_axes(handles.sliders(i), handles);

function update_axes(hObject, handles)
    config = handles.q';
    transforms = get_transforms(config);
    [L1, ~, ~, ~, ~] = get_robot_lengths;   
    
    T02 = h_mul(transforms{1}, transforms{2});
    T03 = h_mul(T02, transforms{3});
    T04 = h_mul(T03, transforms{4});
    T05 = h_mul(T04, transforms{5});
    T06 = h_mul(T05, transforms{6});
    T07 = h_mul(T06, transforms{7});
    
    A = [0, 0, -L1];
    B = zeros(3, 1);
    C = h_pos(T02);
    D = h_pos(T03);
    E = h_pos(T04);
    F = h_pos(T07); 
    
    handles.pts(:,1) = A;
    handles.pts(:,2) = B;
    handles.pts(:,3) = C;
    handles.pts(:,4) = D;
    handles.pts(:,5) = E;
    handles.pts(:,6) = F;
    
    for i = 1:6
        set(handles.gtext(i), 'Position', handles.pts(:,i));
    end
    
    set(handles.gline, 'XData', handles.pts(1,:));
    set(handles.gline, 'YData', handles.pts(2,:));
    set(handles.gline, 'ZData', handles.pts(3,:));
    
    guidata(hObject, handles);
