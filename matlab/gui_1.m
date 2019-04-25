function varargout = gui_1(varargin)
% gui_var MATLAB code for gui_var.fig
%      gui_var, by itself, creates a new gui_var or raises the existing
%      singleton*.
%
%      H = gui_var returns the handle to a new gui_var or the handle to
%      the existing singleton*.
%
%      gui_var('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in gui_var.M with the given input arguments.
%
%      gui_var('Property','Value',...) creates a new gui_var or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_var_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_var_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_var

% Last Modified by GUIDE v2.5 24-Apr-2019 18:32:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_var_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_var_OutputFcn, ...
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


% --- Executes just before gui_var is made visible.
function gui_var_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_var (see VARARGIN)

% Choose default command line output for gui_var
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_var wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_var_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function outlet_angle_Callback(hObject, eventdata, handles)
% hObject    handle to outlet_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outlet_angle as text
%        str2double(get(hObject,'String')) returns contents of outlet_angle as a double

% --- Executes during object creation, after setting all properties.
function outlet_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outlet_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outlet_separation_Callback(hObject, eventdata, handles)
% hObject    handle to outlet_separation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outlet_separation as text
%        str2double(get(hObject,'String')) returns contents of outlet_separation as a double


% --- Executes during object creation, after setting all properties.
function outlet_separation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outlet_separation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aerofoil_length_Callback(hObject, eventdata, handles)
% hObject    handle to aerofoil_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aerofoil_length as text
%        str2double(get(hObject,'String')) returns contents of aerofoil_length as a double


% --- Executes during object creation, after setting all properties.
function aerofoil_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aerofoil_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aerofoil_height_Callback(hObject, eventdata, handles)
% hObject    handle to aerofoil_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aerofoil_height as text
%        str2double(get(hObject,'String')) returns contents of aerofoil_height as a double


% --- Executes during object creation, after setting all properties.
function aerofoil_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aerofoil_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cone_angle_Callback(hObject, eventdata, handles)
% hObject    handle to cone_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cone_angle as text
%        str2double(get(hObject,'String')) returns contents of cone_angle as a double


% --- Executes during object creation, after setting all properties.
function cone_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cone_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lip_height_Callback(hObject, eventdata, handles)
% hObject    handle to lip_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lip_height as text
%        str2double(get(hObject,'String')) returns contents of lip_height as a double


% --- Executes during object creation, after setting all properties.
function lip_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lip_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%initial_rotation = 0; %str2double(get(handles.initial_rotation, 'string')); % 13




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    

% str = get(hObject, 'String');
% val = get(hObject, 'Value');
% switch str{val}
%     case 'Circle'
%         handles.current_data = handles.Circle;
%     case 'Oval'
%         handles.current_data = handles.Oval;
%     case 'Rectangle'
%         handles.current_data = handles.Rectangle;
% end
% 
% guidata(hObject,handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initial_rotation_Callback(hObject, eventdata, handles)
% hObject    handle to initial_rotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial_rotation as text
%        str2double(get(hObject,'String')) returns contents of initial_rotation as a double


% --- Executes during object creation, after setting all properties.
function initial_rotation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_rotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function thickness_Callback(hObject, eventdata, handles)
% hObject    handle to thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of thickness as text
%        str2double(get(hObject,'String')) returns contents of thickness as a double


% --- Executes during object creation, after setting all properties.
function thickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lip_width_Callback(hObject, eventdata, handles)
% hObject    handle to lip_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lip_width as text
%        str2double(get(hObject,'String')) returns contents of lip_width as a double


% --- Executes during object creation, after setting all properties.
function lip_width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lip_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exit_edge_x_Callback(hObject, eventdata, handles)
% hObject    handle to exit_edge_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exit_edge_x as text
%        str2double(get(hObject,'String')) returns contents of exit_edge_x as a double


% --- Executes during object creation, after setting all properties.
function exit_edge_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exit_edge_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exit_edge_ang_Callback(hObject, eventdata, handles)
% hObject    handle to exit_edge_ang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exit_edge_ang as text
%        str2double(get(hObject,'String')) returns contents of exit_edge_ang as a double


% --- Executes during object creation, after setting all properties.
function exit_edge_ang_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exit_edge_ang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sweep_height_Callback(hObject, eventdata, handles)
% hObject    handle to sweep_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sweep_height as text
%        str2double(get(hObject,'String')) returns contents of sweep_height as a double


% --- Executes during object creation, after setting all properties.
function sweep_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sweep_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sweep_width_Callback(hObject, eventdata, handles)
% hObject    handle to sweep_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sweep_width as text
%        str2double(get(hObject,'String')) returns contents of sweep_width as a double


% --- Executes during object creation, after setting all properties.
function sweep_width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sweep_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function corner_diameter_Callback(hObject, eventdata, handles)
% hObject    handle to corner_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of corner_diameter as text
%        str2double(get(hObject,'String')) returns contents of corner_diameter as a double


% --- Executes during object creation, after setting all properties.
function corner_diameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to corner_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resolution_Callback(hObject, eventdata, handles)
% hObject    handle to resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resolution as text
%        str2double(get(hObject,'String')) returns contents of resolution as a double


% --- Executes during object creation, after setting all properties.
function resolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


function holeRad_Callback(hObject, eventdata, handles)
% hObject    handle to holeRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of holeRad as text
%        str2double(get(hObject,'String')) returns contents of holeRad as a double


% --- Executes during object creation, after setting all properties.
function holeRad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to holeRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
aerofoil_choice = get(handles.popupmenu2, 'Value');
outlet_angle = str2double(get(handles.outlet_angle, 'string'));
outlet_separation = str2double(get(handles.outlet_separation, 'string')); % 1.3
aerofoil_length = str2double(get(handles.aerofoil_length, 'string')); % 100
aerofoil_height = str2double(get(handles.aerofoil_height, 'string')); % 28
thickness = str2double(get(handles.thickness, 'string')); % 1.5
cone_angle = str2double(get(handles.cone_angle, 'string')); % 16
lip_height = 0; %str2double(get(handles.lip_height, 'string')); % 9
lip_width = 0; %str2double(get(handles.lip_width, 'string')); % 6
exit_edge_x = str2double(get(handles.exit_edge_x, 'string')); % 2
exit_edge_ang = 45; %str2double(get(handles.exit_edge_ang, 'string')); % 45

sweep_height = str2double(get(handles.sweep_height, 'string')); % diameter for circle
sweep_width = str2double(get(handles.sweep_width, 'string'));
corner_diameter = str2double(get(handles.corner_diameter, 'string')); % for rectangle only
resolution = 0; %str2double(get(handles.resolution, 'string')); % diameter for circle
swept_select = get(handles.popupmenu1, 'Value');
check_box = get(handles.checkbox1, 'Value');
hole_rad = str2double(get(handles.holeRad,'string'));
plotCol = [0, 0, 0];
vargin = [aerofoil_choice, outlet_angle, outlet_separation, aerofoil_length, aerofoil_height, thickness, cone_angle, lip_height, lip_width, exit_edge_x, exit_edge_ang, sweep_height, sweep_width, corner_diameter, resolution, swept_select, check_box, hole_rad];
%subplot(1,1,1);
crossSection = aero_manip_final(vargin,1);
sweptSection = aero_manip_final(vargin,2);
innerSection = aero_manip_final(vargin,3);
axes(handles.axes2);
plot(crossSection(:,1),crossSection(:,2),'Color',plotCol);
axis equal;
axes(handles.axes3);
plot(sweptSection(:,1),sweptSection(:,2),'Color',plotCol);
axis equal;
axes(handles.axes1);
plot(innerSection(:,1),innerSection(:,2),'Color',plotCol);
axis equal;


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over corner_diameter.
function corner_diameter_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to corner_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on corner_diameter and none of its controls.
function corner_diameter_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to corner_diameter (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function corner_diameter_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to corner_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
