function varargout = calc(varargin)
% CALC MATLAB code for calc.fig
%      CALC, by itself, creates a new CALC or raises the existing
%      singleton*.
%
%      H = CALC returns the handle to a new CALC or the handle to
%      the existing singleton*.
%
%      CALC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALC.M with the given input arguments.
%
%      CALC('Property','Value',...) creates a new CALC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calc

% Last Modified by GUIDE v2.5 21-Apr-2019 04:12:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calc_OpeningFcn, ...
                   'gui_OutputFcn',  @calc_OutputFcn, ...
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


% --- Executes just before calc is made visible.
function calc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calc (see VARARGIN)

% Choose default command line output for calc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = calc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in four.
function four_Callback(hObject, eventdata, handles)
% hObject    handle to four (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('4'));
set(handles.inputastext,'string',str);

% --- Executes on button press in one.
function one_Callback(hObject, eventdata, handles)
% hObject    handle to one (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('1'));
set(handles.inputastext,'string',str);

% --- Executes on button press in zero.
function zero_Callback(hObject, eventdata, handles)
% hObject    handle to zero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('0'));
set(handles.inputastext,'string',str);

% --- Executes on button press in three.
function three_Callback(hObject, eventdata, handles)
% hObject    handle to three (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('3'));
set(handles.inputastext,'string',str);

% --- Executes on button press in decimal.
function decimal_Callback(hObject, eventdata, handles)
% hObject    handle to decimal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('.'));
set(handles.inputastext,'string',str);


% --- Executes on button press in six.
function six_Callback(hObject, eventdata, handles)
% hObject    handle to six (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('6'));
set(handles.inputastext,'string',str);

% --- Executes on button press in five.
function five_Callback(hObject, eventdata, handles)
% hObject    handle to five (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('5'));
set(handles.inputastext,'string',str);

% --- Executes on button press in two.
function two_Callback(hObject, eventdata, handles)
% hObject    handle to two (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('2'));
set(handles.inputastext,'string',str);

% --- Executes on button press in signchange.
function signchange_Callback(hObject, eventdata, handles)
% hObject    handle to signchange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
s=str2double(str);
e=-(s);
t=num2str(e);
set(handles.inputastext,'string',t);



% --- Executes on button press in seven.
function seven_Callback(hObject, eventdata, handles)
% hObject    handle to seven (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('7'));
set(handles.inputastext,'string',str);

% --- Executes on button press in nine.
function nine_Callback(hObject, eventdata, handles)
% hObject    handle to nine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('9'));
set(handles.inputastext,'string',str);

% --- Executes on button press in eight.
function eight_Callback(hObject, eventdata, handles)
% hObject    handle to eight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('8'));
set(handles.inputastext,'string',str);

% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'+');
set(handles.inputastext,'string',str);

% --- Executes on button press in sub.
function sub_Callback(hObject, eventdata, handles)
% hObject    handle to sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'-');
set(handles.inputastext,'string',str);

% --- Executes on button press in mul.
function mul_Callback(hObject, eventdata, handles)
% hObject    handle to mul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'*');
set(handles.inputastext,'string',str);

% --- Executes on button press in div.
function div_Callback(hObject, eventdata, handles)
% hObject    handle to div (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'/');
set(handles.inputastext,'string',str);

% --- Executes on button press in Squareroot.
function Squareroot_Callback(hObject, eventdata, handles)
% hObject    handle to Squareroot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'sqrt(');
set(handles.inputastext,'string',str);
% --- Executes on button press in percent.
function percent_Callback(hObject, eventdata, handles)
% hObject    handle to percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
s=str2double(str);
per=s/100;
t=num2str(per);
set(handles.textasoutput,'string',t);


% --- Executes on button press in inverse.
function inverse_Callback(hObject, eventdata, handles)
% hObject    handle to inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'1/');
set(handles.inputastext,'string',str);
% --- Executes on button press in equal.
function equal_Callback(hObject, eventdata, handles)
% hObject    handle to equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=eval(str);
set(handles.textasoutput,'string',str);
% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.inputastext,'string','');
set(handles.textasoutput,'string','');
set(handles.edit1,'string','');
cla
% --- Executes on button press in derivative.
function derivative_Callback(hObject, eventdata, handles)
% hObject    handle to derivative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x;
input = get(handles.edit1, 'string'); 
input = strcat('@(x) ',input);
fx = str2func(input);
res = diff(fx,x);
set(handles.textasoutput, 'string', char(res));

% --- Executes on button press in integration.
function integration_Callback(hObject, eventdata, handles)
% hObject    handle to integra                                                                                          tion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x;
input = get(handles.edit1, 'string'); 
input = strcat('@(x) ',input);
fx = str2func(input);
res = int(fx,x);
set(handles.textasoutput, 'string', char(res));

% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
x = -5:0.1:5;
axes(handles.axes1)
plot(eval(a))
grid on;
% --- Executes on button press in solve.
function solve_Callback(hObject, eventdata, handles)
% hObject    handle to solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x;
input = get(handles.edit1, 'string'); 
input = strcat('@(x) ',input);
fx = str2func(input);
res = solve(fx,x);
set(handles.textasoutput, 'string', char(res));

% --- Executes on button press in cos.
function cos_Callback(hObject, eventdata, handles)
% hObject    handle to cos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'cosd(');
set(handles.inputastext,'string',str);
% --- Executes on button press in power.
function power_Callback(hObject, eventdata, handles)
% hObject    handle to power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'^');
set(handles.inputastext,'string',str);

% --- Executes on button press in bracket1.
function bracket1_Callback(hObject, eventdata, handles)
% hObject    handle to bracket1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('('));
set(handles.inputastext,'string',str);

% --- Executes on button press in bracket2.
function bracket2_Callback(hObject, eventdata, handles)
% hObject    handle to bracket2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,(')'));
set(handles.inputastext,'string',str);


% --- Executes on button press in tan.
function tan_Callback(hObject, eventdata, handles)
% hObject    handle to tan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'tand(');
set(handles.inputastext,'string',str);
% --- Executes on button press in sin.
function sin_Callback(hObject, eventdata, handles)
% hObject    handle to sin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'sind(');
set(handles.inputastext,'string',str);
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pi.
function pi_Callback(hObject, eventdata, handles)
% hObject    handle to pi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,('pi'));
set(handles.inputastext,'string',str);


% --- Executes on button press in log.
function log_Callback(hObject, eventdata, handles)
% hObject    handle to log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'log10(');
set(handles.inputastext,'string',str);

% --- Executes on button press in ln.
function ln_Callback(hObject, eventdata, handles)
% hObject    handle to ln (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'log(');
set(handles.inputastext,'string',str);

% --- Executes on button press in expo.
function expo_Callback(hObject, eventdata, handles)
% hObject    handle to expo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'exp(');
set(handles.inputastext,'string',str);


% --- Executes on button press in root.
function root_Callback(hObject, eventdata, handles)
% hObject    handle to root (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'^(1/');
set(handles.inputastext,'string',str);


% --- Executes on button press in factorial.
function factorial_Callback(hObject, eventdata, handles)
% hObject    handle to factorial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'factorial(');
set(handles.inputastext,'string',str);


% --- Executes on button press in Sinh.
function Sinh_Callback(hObject, eventdata, handles)
% hObject    handle to Sinh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'sinh(');
set(handles.inputastext,'string',str);

% --- Executes on button press in Cosh.
function Cosh_Callback(hObject, eventdata, handles)
% hObject    handle to Cosh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'cosh(');
set(handles.inputastext,'string',str);

% --- Executes on button press in Tanh.
function Tanh_Callback(hObject, eventdata, handles)
% hObject    handle to Tanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'tanh(');
set(handles.inputastext,'string',str);

% --- Executes on button press in Absolute.
function Absolute_Callback(hObject, eventdata, handles)
% hObject    handle to Absolute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'abs(');
set(handles.inputastext,'string',str);


% --- Executes on button press in dtof.
function dtof_Callback(hObject, eventdata, handles)
% hObject    handle to dtof (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'rat(');
set(handles.inputastext,'string',str);


% --- Executes on button press in inversesin.
function inversesin_Callback(hObject, eventdata, handles)
% hObject    handle to inversesin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'asind(');
set(handles.inputastext,'string',str);

% --- Executes on button press in inversecos.
function inversecos_Callback(hObject, eventdata, handles)
% hObject    handle to inversecos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'acosd(');
set(handles.inputastext,'string',str);

% --- Executes on button press in inversetan.
function inversetan_Callback(hObject, eventdata, handles)
% hObject    handle to inversetan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'atand(');
set(handles.inputastext,'string',str);

% --- Executes on button press in ftod.
function ftod_Callback(hObject, eventdata, handles)
% hObject    handle to ftod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'double(');
set(handles.inputastext,'string',str);

% --- Executes on button press in tenpower.
function tenpower_Callback(hObject, eventdata, handles)
% hObject    handle to tenpower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.inputastext,'string');
str=strcat(str,'*10^');
set(handles.inputastext,'string',str);


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
% This creates the 'background' axes
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);

uistack(ha,'bottom');

I=imread('eight.tif');
hi = imagesc(I);
colormap gray

set(ha,'handlevisibility','off', ...
            'visible','off')
