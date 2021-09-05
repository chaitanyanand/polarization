function varargout = polarization_plot_gui(varargin)
% POLARIZATION_PLOT_GUI MATLAB code for polarization_plot_gui.fig
%      POLARIZATION_PLOT_GUI, by itself, creates a new POLARIZATION_PLOT_GUI or raises the existing
%      singleton*.
%
%      H = POLARIZATION_PLOT_GUI returns the handle to a new POLARIZATION_PLOT_GUI or the handle to
%      the existing singleton*.
%
%      POLARIZATION_PLOT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLARIZATION_PLOT_GUI.M with the given input arguments.
%
%      POLARIZATION_PLOT_GUI('Property','Value',...) creates a new POLARIZATION_PLOT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before polarization_plot_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to polarization_plot_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help polarization_plot_gui

% Last Modified by GUIDE v2.5 13-Nov-2020 19:23:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @polarization_plot_gui_OpeningFcn, ...
    'gui_OutputFcn',  @polarization_plot_gui_OutputFcn, ...
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


% --- Executes just before polarization_plot_gui is made visible.
function polarization_plot_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to polarization_plot_gui (see VARARGIN)

% Choose default command line output for polarization_plot_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes polarization_plot_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = polarization_plot_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

switch get(handles.popupmenu1,'Value')
    case 1
        polar=0;
    case 2
        polar=pi;
    case 3
        polar=pi/2;
    otherwise
end
A=str2double(get(handles.edit1,'string'));
B=str2double(get(handles.edit2,'string'));
N=20;
x=1:20;
y=zeros(1,N);
z=zeros(1,N);
phase=get(hObject,'Value');
set(handles.text7, 'String', phase*180/pi);

angk=0:2*pi/180:2*pi;

axes(handles.axes1);

xx=x(end-19:end);
quiver3(1:20,y,z,zeros(1,N),A*cos(xx/2+phase),B*sin(xx/2+phase+polar),0)
hold on
plot3(1:20,A*cos(xx/2+phase),B*sin(xx/2+phase+polar))
axis equal
xlim([1 20])
if A==0
    ylim([-B B])
else
    ylim([-A A])
end
if B==0
    zlim([-A A])
else
    zlim([-B B])
end
xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
drawnow
hold off


axes(handles.axes2);
quiver(0,0,A*cos(xx(end)/2+phase),B*sin(xx(end)/2+phase+polar),0)
hold on
plot(A*cos(angk+phase),B*sin(angk+phase+polar))
grid on
axis equal
xlabel('Y-axis')
ylabel('Z-axis')
if A==0
    xlim([-B B])
else
    xlim([-A A])
end
if B==0
    ylim([-A A])
else
    ylim([-B B])
end
drawnow
hold off



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1

switch get(handles.popupmenu1,'Value')
    case 1
        polar=0;
    case 2
        polar=pi;
    case 3
        polar=pi/2;
    otherwise
end
A=str2double(get(handles.edit1,'string'));
B=str2double(get(handles.edit2,'string'));
N=20;
x=1:20;
y=zeros(1,N);
z=zeros(1,N);
phase=get(hObject,'Value');
count=21;
angk=0:2*pi/180:2*pi;
while get(hObject,'Value')
    axes(handles.axes1);
    x(count)=count;
    xx=x(end-19:end);
    quiver3(1:20,y,z,zeros(1,N),A*cos(xx/2+phase),B*sin(xx/2+phase+polar),0)
    hold on
    plot3(1:20,A*cos(xx/2+phase),B*sin(xx/2+phase+polar))
    axis equal
    xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
    xlim([1 20])
    if A==0
        ylim([-B B])
    else
        ylim([-A A])
    end
    if B==0
        zlim([-A A])
    else
        zlim([-B B])
    end
    count = count +1;
    pause(0.01)
    drawnow
    hold off
    
    axes(handles.axes2);
    quiver(0,0,A*cos(xx(end)/2+phase),B*sin(xx(end)/2+phase+polar),0)
    
    hold on
    plot(A*cos(angk+phase),B*sin(angk+phase+polar))
    grid on
    axis equal
    xlabel('Y-axis')
ylabel('Z-axis')
    if A==0
        xlim([-B B])
    else
        xlim([-A A])
    end
    if B==0
        ylim([-A A])
    else
        ylim([-B B])
    end
    drawnow
    hold off
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
switch get(handles.popupmenu1,'Value')
    case 1
        polar=0;
    case 2
        polar=pi;
    case 3
        polar=pi/2;
    otherwise
end
A=str2double(get(handles.edit1,'string'));
B=str2double(get(handles.edit2,'string'));
N=20;
x=1:20;
y=zeros(1,N);
z=zeros(1,N);
phase=get(hObject,'Value');
count=21;
angk=0:2*pi/180:2*pi;
while get(handles.togglebutton1,'Value')
    axes(handles.axes1);
    x(count)=count;
    xx=x(end-19:end);
    quiver3(1:20,y,z,zeros(1,N),A*cos(xx/2+phase),B*sin(xx/2+phase+polar),0)
    hold on
    plot3(1:20,A*cos(xx/2+phase),B*sin(xx/2+phase+polar))
    axis equal
    xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
    xlim([1 20])
    if A==0
        ylim([-B B])
    else
        ylim([-A A])
    end
    if B==0
        zlim([-A A])
    else
        zlim([-B B])
    end
    count = count +1;
    pause(0.01)
    drawnow
    hold off
    
    axes(handles.axes2);
    quiver(0,0,A*cos(xx(end)/2+phase),B*sin(xx(end)/2+phase+polar),0)
    hold on
    plot(A*cos(angk+phase),B*sin(angk+phase+polar))
    grid on
    axis equal
    xlabel('Y-axis')
ylabel('Z-axis')
    if A==0
        xlim([-B B])
    else
        xlim([-A A])
    end
    if B==0
        ylim([-A A])
    else
        ylim([-B B])
    end
    drawnow
    hold off
end

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
switch get(handles.popupmenu1,'Value')
    case 1
        polar=0;
    case 2
        polar=pi;
    case 3
        polar=pi/2;
    otherwise
end
A=str2double(get(handles.edit1,'string'));
B=str2double(get(handles.edit2,'string'));
N=20;
x=1:20;
y=zeros(1,N);
z=zeros(1,N);
phase=get(hObject,'Value');
count=21;
angk=0:2*pi/180:2*pi;
while get(handles.togglebutton1,'Value')
    axes(handles.axes1);
    x(count)=count;
    xx=x(end-19:end);
    quiver3(1:20,y,z,zeros(1,N),A*cos(xx/2+phase),B*sin(xx/2+phase+polar),0)
    hold on
    plot3(1:20,A*cos(xx/2+phase),B*sin(xx/2+phase+polar))
    axis equal
    xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
    xlim([1 20])
    if A==0
        ylim([-B B])
    else
        ylim([-A A])
    end
    if B==0
        zlim([-A A])
    else
        zlim([-B B])
    end
    count = count +1;
    pause(0.01)
    drawnow
    hold off
    
    axes(handles.axes2);
    quiver(0,0,A*cos(xx(end)/2+phase),B*sin(xx(end)/2+phase+polar),0)
    hold on
    plot(A*cos(angk+phase),B*sin(angk+phase+polar))
    grid on
    axis equal
    xlabel('Y-axis')
ylabel('Z-axis')
    if A==0
        xlim([-B B])
    else
        xlim([-A A])
    end
    if B==0
        ylim([-A A])
    else
        ylim([-B B])
    end
    drawnow
    hold off
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
switch get(hObject,'Value')
    case 1
        polar=0;
    case 2
        polar=pi;
    case 3
        polar=pi/2;
    otherwise
end
A=str2double(get(handles.edit1,'string'));
B=str2double(get(handles.edit2,'string'));
N=20;
x=1:20;
y=zeros(1,N);
z=zeros(1,N);
phase=get(hObject,'Value');
count=21;
angk=0:2*pi/180:2*pi;
while get(handles.togglebutton1,'Value')
    axes(handles.axes1);
    x(count)=count;
    xx=x(end-19:end);
    quiver3(1:20,y,z,zeros(1,N),A*cos(xx/2+phase),B*sin(xx/2+phase+polar),0)
    hold on
    plot3(1:20,A*cos(xx/2+phase),B*sin(xx/2+phase+polar))
    axis equal
    xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
    xlim([1 20])
    if A==0
        ylim([-B B])
    else
        ylim([-A A])
    end
    if B==0
        zlim([-A A])
    else
        zlim([-B B])
    end
    count = count +1;
    pause(0.01)
    drawnow
    hold off
    
    axes(handles.axes2);
    quiver(0,0,A*cos(xx(end)/2+phase),B*sin(xx(end)/2+phase+polar),0)
    hold on
    plot(A*cos(angk+phase),B*sin(angk+phase+polar))
    grid on
    axis equal
    xlabel('Y-axis')
ylabel('Z-axis')
    if A==0
        xlim([-B B])
    else
        xlim([-A A])
    end
    if B==0
        ylim([-A A])
    else
        ylim([-B B])
    end
    drawnow
    hold off
end


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

%Topic = VISUALIZATION OF LINEAR,CIRCULAR & ELLIPTICAL POLARIZATION OF EMW
%TEAM MEMBERS:
%DIGVIJAY NIKAM - 180002014
%KANCHI SAI ANVESH - 180002026
%CHAITANYANAND MAJETI - 180002032
%THATHIREDDY SANDEEP REDDY - 180002059
