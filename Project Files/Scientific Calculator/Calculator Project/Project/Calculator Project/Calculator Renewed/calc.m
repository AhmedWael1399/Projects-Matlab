function varargout = calc(varargin)


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




function calc_OpeningFcn(hObject, ~, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);


axes(handles.axes3)
matlabImage = imread('C:\Users\admin\Downloads\images 1.jpeg');
image(matlabImage)
axis off
axis image

function varargout = calc_OutputFcn(~, ~, handles) 

varargout{1} = handles.output;


function four_Callback(~, ~, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('4'));
set(handles.inputastext,'string',str);


function one_Callback(~, ~, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('1'));
set(handles.inputastext,'string',str);

function zero_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('0'));
set(handles.inputastext,'string',str);


function three_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('3'));
set(handles.inputastext,'string',str);


function decimal_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('.'));
set(handles.inputastext,'string',str);



function six_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('6'));
set(handles.inputastext,'string',str);


function five_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('5'));
set(handles.inputastext,'string',str);


function two_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('2'));
set(handles.inputastext,'string',str);


function signchange_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
s=str2double(str);
e=-(s);
t=num2str(e);
set(handles.inputastext,'string',t);




function seven_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('7'));
set(handles.inputastext,'string',str);


function nine_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('9'));
set(handles.inputastext,'string',str);


function eight_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('8'));
set(handles.inputastext,'string',str);


function add_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'+');
set(handles.inputastext,'string',str);


function sub_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'-');
set(handles.inputastext,'string',str);


function mul_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'*');
set(handles.inputastext,'string',str);


function div_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'/');
set(handles.inputastext,'string',str);


function Squareroot_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'sqrt(');
set(handles.inputastext,'string',str);


function percent_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
s=str2double(str);
per=s/100;
t=num2str(per);
set(handles.textasoutput,'string',t);



function inverse_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'1/');
set(handles.inputastext,'string',str);


function equal_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=eval(str);
set(handles.textasoutput,'string',str);


function clear_Callback(hObject, eventdata, handles)

set(handles.inputastext,'string','');
set(handles.textasoutput,'string','');
set(handles.edit1,'string','');



function derivative_Callback(hObject, eventdata, handles)

syms x;
input = get(handles.edit1, 'string'); 
input = strcat('@(x) ',input);
fx = str2func(input);
res = diff(fx,x);
set(handles.textasoutput, 'string', char(res));


function integration_Callback(hObject, eventdata, handles)

syms x;
input = get(handles.edit1, 'string'); 
input = strcat('@(x) ',input);
fx = str2func(input);
res = int(fx,x);
set(handles.textasoutput, 'string', char(res));


function plot_Callback(hObject, eventdata, handles)

a=get(handles.edit1,'string');
x = -5:0.1:5;
axes(handles.axes1)
comet(eval(a))


function solve_Callback(hObject, eventdata, handles)

syms x;
input = get(handles.edit1, 'string'); 
input = strcat('@(x) ',input);
fx = str2func(input);
res = solve(fx,x);
set(handles.textasoutput, 'string', char(res));


function cos_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'cosd(');
set(handles.inputastext,'string',str);


function power_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'^');
set(handles.inputastext,'string',str);


function bracket1_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('('));
set(handles.inputastext,'string',str);


function bracket2_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,(')'));
set(handles.inputastext,'string',str);



function tan_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'tand(');
set(handles.inputastext,'string',str);

function sin_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'sind(');
set(handles.inputastext,'string',str);
function edit1_Callback(hObject, eventdata, handles)






function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pi_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,('pi'));
set(handles.inputastext,'string',str);


function log_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'log10(');
set(handles.inputastext,'string',str);


function ln_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'log(');
set(handles.inputastext,'string',str);


function expo_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'exp(');
set(handles.inputastext,'string',str);



function root_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'^(1/');
set(handles.inputastext,'string',str);



function factorial_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'factorial(');
set(handles.inputastext,'string',str);



function Sinh_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'sinh(');
set(handles.inputastext,'string',str);


function Cosh_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'cosh(');
set(handles.inputastext,'string',str);


function Tanh_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'tanh(');
set(handles.inputastext,'string',str);


function Absolute_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'abs(');
set(handles.inputastext,'string',str);



function dtof_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'rat(');
set(handles.inputastext,'string',str);



function inversesin_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'asind(');
set(handles.inputastext,'string',str);


function inversecos_Callback(hObject, eventdata, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'acosd(');
set(handles.inputastext,'string',str);


function inversetan_Callback(hObject, ~, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'atand(');
set(handles.inputastext,'string',str);


function ftod_Callback(~, ~, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'double(');
set(handles.inputastext,'string',str);

function tenpower_Callback(hObject, ~, handles)

str=get(handles.inputastext,'string');
str=strcat(str,'*10^');
set(handles.inputastext,'string',str);
