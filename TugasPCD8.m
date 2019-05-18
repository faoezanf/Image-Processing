function varargout = TugasPCD8(varargin)
% TUGASPCD8 MATLAB code for TugasPCD8.fig
%      TUGASPCD8, by itself, creates a new TUGASPCD8 or raises the existing
%      singleton*.
%xt
%      H = TUGASPCD8 returns the handle to a new TUGASPCD8 or the handle to
%      the e;xisting singleton*.
%
%      TUGASPCD8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGASPCD8.M with the given input arguments.
%
%      TUGASPCD8('Property','Value',...) creates a new TUGASPCD8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TugasPCD8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TugasPCD8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TugasPCD8

% Last Modified by GUIDE v2.5 07-May-2019 10:31:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TugasPCD8_OpeningFcn, ...
                   'gui_OutputFcn',  @TugasPCD8_OutputFcn, ...
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


% --- Executes just before TugasPCD8 is made visible.
function TugasPCD8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TugasPCD8 (see VARARGIN)

% Choose default command line output for TugasPCD8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TugasPCD8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TugasPCD8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

%BUKA GAMBAR
global image;
%pemilihan gambar
[filename, pathname] = uigetfile('*.jpg; *.png', 'Pilih gambar yang lain');

%membaca file imagenya
image = imread([pathname, filename]);
%menampilkan gambar yang dipilih
imshow(image);


% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)

%GRAYSCALE
global image; %pemanggilan variabel gambar

abuabu = 0.2*image(:,:,1)+0.5*image(:,:,2)+0.3*image(:,:,3); % merubah RGB ke Gray

imshow (abuabu); % menampilkan hasilnya


% --- Executes on button press in brightnessplus.
function brightnessplus_Callback(hObject, eventdata, handles)

%BRIGHTNESS +
global image;

hasil = double(image) + 10; % penambahan brightness sebanyak 10 intensitas dari gambar sebelumnya
image = double(hasil); % menyimpan kecerahan baru untuk digunakan pada operasi selanjutnya
imshow(uint8(hasil)); % menampilkan gambar dengan kecerahan yang baru


% --- Executes on button press in brightnessmin.
function brightnessmin_Callback(hObject, eventdata, handles)

%BRIGHTNESS -
global image;

hasil = double(image) - 10; % pengurangan brightness sebanyak 10 intensitas dari gambar sebelumnya
image = double(hasil); % menyimpan kecerahan baru untuk digunakan pada operasi selanjutnya
imshow(uint8(hasil)); % menampilkan gambar dengan kecerahan yang baru


% --- Executes on button press in brightnesskali.
function brightnesskali_Callback(hObject, eventdata, handles)

%BRIGHTNESS X
global image;

hasil = double(image) * 2; % penambahan brightness sebanyak 2 kali lipat intensitas dari gambar sebelumnya
image = double(hasil); % menyimpan kecerahan baru untuk digunakan pada operasi selanjutnya
imshow(uint8(hasil)); % menampilkan gambar dengan kecerahan yang baru


% --- Executes on button press in brightnessbagi.
function brightnessbagi_Callback(hObject, eventdata, handles)

%BRIGHTNESS /
global image;

hasil = double(image) / 2; % pengurangan brightness sebanyak 2 kali lipat intensitas dari gambar sebelumnya
image = double(hasil); % menyimpan kecerahan baru untuk digunakan pada operasi selanjutnya
imshow(uint8(hasil)); % menampilkan gambar dengan kecerahan yang baru


% --- Executes on button press in zoomin.
function zoomin_Callback(hObject, eventdata, handles)

%ZOOM IN
global image;


baris = round(1.5*size(image,1)); %menyiapkan baris gambar baru sebanyak 1.5 kali lipat dari gambar asli
kolom = round(1.5*size(image,2)); %menyiapkan kolom gambar baru sebanyak 1.5 kali lipat dari gambar asli
hasilZoomin = zeros(baris, kolom, 3); %membuat matriks untuk gambar baru berdasarkan baris dan kolom yang telah diinisialisasi

ix=1; %iterasi baris untuk perulangan matriks baru
jx=1; %iterasi kolom untuk perulangan matriks baru
for i = 1:size(image,1) % perulangan baris gambar
    for j = 1:size(image,2) % perulangan kolom gambar
        % 4 baris kode dibawah ini adalah untuk mengeset nilai pixel pada 
        % pixel gambar dengan baris i  dan kolom j kepada 4 pixel yang sama
        % pada gambar baru
        hasilZoomin(ix,jx,:) = image(i,j,:);
        hasilZoomin(ix,jx+1,:) = image(i,j,:);
        hasilZoomin(ix+1,jx,:) = image(i,j,:);
        hasilZoomin(ix+1,jx+1,:) = image(i,j,:);
        jx = jx+2; % iterasi tambah 2 karena setiap kolom pixel baru yg kosong berada di 2 angka setelah dari j
    end
    ix = ix+2; % iterasi tambah 2 karena setiap baris pixel baru yg kosong berada di 2 angka setelah dari i
    jx = 1; % pengesetan ulang kolom menjadi kolom pertama lagi
end
hasilZoomin = uint8(hasilZoomin); %konversi gambar baru menjadi tipe data uint8 (gambar)
figure, imshow(hasilZoomin); %menampilkan hasil zoom in pada pop up 


% --- Executes on button press in zoomout.
function zoomout_Callback(hObject, eventdata, handles)

%ZOOM OUT
global image;

hasilZoomout = zeros(floor(size(image,1)/1.5), floor(size(image,2)/1.5), 3); %membuat matriks untuk gambar baru dengan baris dan kolom diperkecil sebanyak 1.5 lipat

for i = 1:size(image,1) %perulangan baris 
    for j = 1:size(image,2) %perulangan kolom
        hasilZoomout(i,j,:) = image(i,j,:); % mengeset nilai pixel pada gambar baru dengan pixel pada gambar
        j = j+2; % iterasi kolom
    end
    i = i+2; % iterasi baris
    j = 1; %pengesetan ulang iterasi
end
hasilZoomout = uint8(hasilZoomout); % mengonvert matriks menjadi tipe data sebuah gambar
figure, imshow(hasilZoomout); % menampilkan hasil zoom out pada pop up 


% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)

%CROP
global image;

vStart = str2num(handles.vpixelstart.String); % mendapatkan value dari teks dengan tag vpixelstart yang telah diisi user dan convert dari string ke integer
hStart = str2num(handles.hpixelstart.String); % mendapatkan value dari teks dengan tag hpixelstart yang telah diisi user dan convert dari string ke integer
vEnd = str2num(handles.vpixelend.String); % mendapatkan value dari teks dengan tag vpixelend yang telah diisi user dan convert dari string ke integer
hEnd = str2num(handles.hpixelend.String); % mendapatkan value dari teks dengan tag hpixelend yang telah diisi user dan convert dari string ke integer

hasilCrop = image(vStart:vEnd,hStart:hEnd); % inisialisasi gambar baru dengan ukuran pixel yang telah ditentukan user
hasilCrop(:,:,1) = image(vStart:vEnd,hStart:hEnd,1); % mengeset nilai pixel yang berwarna Red
hasilCrop(:,:,2) = image(vStart:vEnd,hStart:hEnd,2); % mengeset nilai pixel yang berwarna Green
hasilCrop(:,:,3) = image(vStart:vEnd,hStart:hEnd,3); % mengeset nilai pixel yang berwarna Blue

imshow(uint8(hasilCrop)); %menampilkan gambar baru 



function vpixelstart_Callback(hObject, eventdata, handles)
% hObject    handle to vpixelstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vpixelstart as text
%        str2double(get(hObject,'String')) returns contents of vpixelstart as a double


% --- Executes during object creation, after setting all properties.
function vpixelstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vpixelstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hpixelstart_Callback(hObject, eventdata, handles)
% hObject    handle to hpixelstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hpixelstart as text
%        str2double(get(hObject,'String')) returns contents of hpixelstart as a double


% --- Executes during object creation, after setting all properties.
function hpixelstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hpixelstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vpixelend_Callback(hObject, eventdata, handles)
% hObject    handle to vpixelend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vpixelend as text
%        str2double(get(hObject,'String')) returns contents of vpixelend as a double


% --- Executes during object creation, after setting all properties.
function vpixelend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vpixelend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hpixelend_Callback(hObject, eventdata, handles)
% hObject    handle to hpixelend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hpixelend as text
%        str2double(get(hObject,'String')) returns contents of hpixelend as a double


% --- Executes during object creation, after setting all properties.
function hpixelend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hpixelend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)

%HISTEQ
global image;
%catatan : dibawah ini ada beberapa baris yang tidak dikomentar karena hal
%tersebut merupakan konsep/perhitungan dari equalization.
image = 0.2*image(:,:,1)+0.5*image(:,:,2)+0.3*image(:,:,3); % merubah RGB ke Gray

baris = size(image,1); % set nilai baris kedalam variabel baris
kolom = size(image,2); % set nilai kolom kedalam variabel kolom
jum = baris * kolom; % variabel untuk

hasil=uint8(zeros(baris,kolom)); %variabel untuk gambar akhir setelah equalisasi
fungsi=zeros(256,1); % variabel awal dari nilai pixel + 1
cdf=zeros(256,1); % variabel yang nilainya bersifat kumulatif dari pdf
pdf=zeros(256,1); % variabel yang menyimpan hasil dari variabel fungsi dibagi jum
cum=zeros(256,1); % variabel sementara (temp) yang bernilai kumulatif dari variabel fungsi
out=zeros(256,1); % variabel akhir yang akan disimpan kedalam variabel hasil

%perulangan untuk set nilai fungsi dan pdf
for i=1:baris
    for j=1:kolom
        nilaiPixel = image(i,j);
        fungsi(nilaiPixel+1) = fungsi(nilaiPixel+1) +1;
        pdf(nilaiPixel+1) = fungsi(nilaiPixel+1) / jum;
    end
end

sum=0;
L=255; % L-1 = 256-1

%perulangan untuk mendapatkan nilai pixel yang baru (diequalisasi)
for i=1:size(pdf)
    sum = sum+fungsi(i); % sum akan bertambah dan berubah seiring berjalannya perulangan
    cum(i)=sum; 
    cdf(i)=cum(i)/jum;
    out(i)=round(cdf(i)*L); % membulatkan dan mengalikan cdf terhadap L
end

%perulangan untuk mengeset variabel out kedalam variabel hasil
for i=1:baris
    for j=1:kolom
        hasil(i,j) = out(image(i,j)+1);
    end
end


t=1:256; % variabel untuk nilai pixel
n=0:255; % interval/range dari grafik
count=0; % variabel untuk menghitung nilai pixel kedalam grafik

%perulangan untuk mengeset nilai pada grafik
for z=1:256
    for i=1:baris
        for j=1:kolom
            
            if image(i,j)==z-1
                count=count+1;
            end
        end
    end
    t(z)=count;
    count=0;
end

imshow(hasil); %memunculkan hasil equalisasi gambar pada axes di GUI.
figure, plot(n,t); %memunculkan pop up baru dan menunjukkan grafik/histogram dari gambarnya.


% --- Executes on button  press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)

%HISTOGRAM
global image;
[baris,kolom,colormap] = size(image);
t1=1:256; %variabel nilai pixel pada grafik R
n1=0:255; %interval/range dari grafik R

t2=1:256; %variabel nilai pixel pada grafik G
n2=0:255; %interval/range dari grafik G

t3=1:256; %variabel nilai pixel pada grafik B
n3=0:255; %interval/range dari grafik B

count=0; %variabel untuk menghitung nilai pixel kedalam grafik

%perulangan untuk grafik R
for z=1:256
    for i=1:baris
        for j=1:kolom
            
            if image(i,j,1)==z-1
                count=count+1;
            end
        end
    end
    t1(z)=count;
    count=0;
end

%perulangan untuk grafik G
for z=1:256
    for i=1:baris
        for j=1:kolom
            
            if image(i,j,2)==z-1
                count=count+1;
            end
        end
    end
    t2(z)=count;
    count=0;
end

%perulangan untuk grafik B
for z=1:256
    for i=1:baris
        for j=1:kolom
            
            if image(i,j,3)==z-1
                count=count+1;
            end
        end
    end
    t3(z)=count;
    count=0;
end

figure, plot(n1,t1,'R',n2,t2,'G',n3,t3,'B'); %memunuculkan 1 grafik RGB, dengan masing-masing RGB diberi warna garis sesuai warnanya. (Misal grafik R warna garis nya merah, dst)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)

%EDGE DETECTION
global image; %pemanggilan variabel gambar pada axes/GUI
[baris, kolom, colormap]=size(image); %meng-get ukuran baris serta kolm dari gambar
hasil=double(image); %inisialisasi matriks gambar untuk hasil yang baru
k = [1 1 1
    1 -13 1
    1 1 1]; %inisialisasi matriks yang dapat mendektesi edge dari gambar
for i=2 : baris-2 %perulangan baris
    for j=2 : kolom-2 %perulangan kolom
        sum=hasil(i-1,j-1)*k(1,1)+hasil(i,j-1)*k(2,1)...
            + hasil(i+1,j-1)*k(3,1)+hasil(i-1,j)*k(1,2)...
            + hasil(i,j)*k(2,2)+hasil(i+1,j)*k(3,2)...
            +hasil(i-1,j+1)*k(1,3)+hasil(i,j+1)*k(2,3)...
            +hasil(i+1,j+1)*k(3,3); %pengalian matriks k dengan gambar
        hasil(i-1,j-1)=sum; %hasil pixel deteksi edge tersimpan
    end
end

imshow(uint8(hasil)); %menampilkan gambar dengan deteksi edge ke layar


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)

%SHARP
global image; %pemanggilan variabel gambar pada axes/GUI
[baris, kolom, colormap]=size(image); %meng-get ukuran baris serta kolom dari gambar
hasil=double(image);%inisialisasi matriks gambar untuk hasil yang baru
k = [0 -1 0
    -1 5 -1
    0 -1 0]; %inisialisasi matriks yang membuat gambar menjadi sharp/tajam
for i=2 : baris-2 %perulangan baris
    for j=2 : kolom-2 %perulangan kolom
        sum=hasil(i-1,j-1,:)*k(1,1,:)+hasil(i,j-1,:)*k(2,1,:)...
            + hasil(i+1,j-1,:)*k(3,1,:)+hasil(i-1,j,:)*k(1,2,:)...
            + hasil(i,j,:)*k(2,2,:)+hasil(i+1,j,:)*k(3,2,:)...
            +hasil(i-1,j+1,:)*k(1,3,:)+hasil(i,j+1,:)*k(2,3,:)...
            +hasil(i+1,j+1,:)*k(3,3,:); %pengalian matriks k dengan gambar
        hasil(i-1,j-1,:)=sum; %hasil pixel yang baru tersimpan
    end
end

imshow(uint8(hasil)); %menampilkan hasil pertajaman gambar ke layar


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)

%BLUR
global image; %pemanggilan variabel gambar pada axes / GUI
[baris, kolom, colormap]=size(image); %meng-get ukuran baris serta kolom dari gambar
hasil=double(image); %inisialisasi matriks gambar untuk hasil yang baru
k = [1/8 1/8 1/8
    1/8 1/8 1/8
    1/8 1/8 1/8]; %inisialisasi matriks yang membuat gambar menjadi blur
for i=2 : baris-2 %perulangan baris
    for j=2 : kolom-2 %perulangan kolom
        sum=hasil(i-1,j-1,:)*k(1,1,:)+hasil(i,j-1,:)*k(2,1,:)...
            + hasil(i+1,j-1,:)*k(3,1,:)+hasil(i-1,j,:)*k(1,2,:)...
            + hasil(i,j,:)*k(2,2,:)+hasil(i+1,j,:)*k(3,2,:)...
            +hasil(i-1,j+1,:)*k(1,3,:)+hasil(i,j+1,:)*k(2,3,:)...
            +hasil(i+1,j+1,:)*k(3,3,:); %pengalian matriks k dengan gambar
        hasil(i-1,j-1,:)=sum; %hasil pixel yang baru tersimpan
    end
end

imshow(uint8(hasil)); %menampilkan hasil blur gambar ke layar



function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1 as text
%        str2double(get(hObject,'String')) returns contents of r1 as a double


% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g1_Callback(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g1 as text
%        str2double(get(hObject,'String')) returns contents of g1 as a double


% --- Executes during object creation, after setting all properties.
function g1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b1 as text
%        str2double(get(hObject,'String')) returns contents of b1 as a double


% --- Executes during object creation, after setting all properties.
function b1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Segmentasi Threshold
global image; %variabel gambar dari axes

RAwal = str2num(handles.r1.String); % Nilai R awal
RAkhir = str2num(handles.r2.String); % Nilai R akhir
GAwal = str2num(handles.g1.String); % Nilai G awal
GAkhir = str2num(handles.g2.String); % Nilai G akhir
BAwal = str2num(handles.b1.String); % Nilai B awal
BAkhir = str2num(handles.b2.String); % Nilai B akhir

[baris, kolom, colormap]= size(image); % assign nilai baris,kolom dan colormap gambar
hasil= zeros(baris,kolom,colormap); % inisialisasi matriks gambar baru
for i = 1 : baris % perulangan baris
   for j=1 : kolom % perulangan kolom
        if image(i,j,1)>RAwal && image(i,j,1)<RAkhir && image(i,j,2)>GAwal && image(i,j,2)<GAkhir && image(i,j,3)>BAwal && image(i,j,3)<BAkhir
            hasil(i,j,:)=image(i,j,:); % proses segmentasi
        end
    end
end

hasil = uint8(hasil); % konversi array menjadi format gambar (uint8)
imshow(hasil); % menampilkan hasil



function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2 as text
%        str2double(get(hObject,'String')) returns contents of r2 as a double


% --- Executes during object creation, after setting all properties.
function r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g2_Callback(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g2 as text
%        str2double(get(hObject,'String')) returns contents of g2 as a double


% --- Executes during object creation, after setting all properties.
function g2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b2 as text
%        str2double(get(hObject,'String')) returns contents of b2 as a double


% --- Executes during object creation, after setting all properties.
function b2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputX_Callback(hObject, eventdata, handles)
% hObject    handle to inputX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputX as text
%        str2double(get(hObject,'String')) returns contents of inputX as a double


% --- Executes during object creation, after setting all properties.
function inputX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputY_Callback(hObject, eventdata, handles)
% hObject    handle to inputY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputY as text
%        str2double(get(hObject,'String')) returns contents of inputY as a double


% --- Executes during object creation, after setting all properties.
function inputY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Segmentasi Seed
global image;
valueX = str2num(handles.inputX.String); % get value dari kolom inputan X
valueY = str2num(handles.inputY.String); % get value dari kolom inputan Y

thresholdValue = 40; % inisialisasi nilai threshold

[baris,kolom, colormap]=size(image); % assign nilai baris, kolom dan colormap gambar
hasilSegmentasi = zeros(baris, kolom, colormap); %inisialisasi matriks hasilSegmentasi
newMatrix = zeros(baris,kolom, colormap); %inisialisasi matriks baru
seed= image(valueX,valueY); % variabel segmentasi sesuai inputan X dan Y


%perulangan proses segmentasi :
while newMatrix ~= 1
    for i = 1 : baris
        for j = 1 : kolom
            if image(i,j)<thresholdValue+seed && newMatrix(i,j)~=1
                hasilSegmentasi(i,j)=thresholdValue;
                newMatrix(i,j)=1;
            end
        end
    end
    thresholdValue = thresholdValue + 30;
    for i = 1 : baris
        for j = 1 : kolom
            if newMatrix(i,j)~=1
                seed = image(i,j);
                break;
            end
        end
    end
end

hasil =uint8(hasilSegmentasi); %proses konversi array menjadi format uint8 / gambar
imshow(hasil); % menampilkan hasil ke layar


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Proses Dilasi
global image; %variabel gambar di axes
abuImage = 0.2*image(:,:,1)+0.5*image(:,:,2)+0.3*image(:,:,3); %grayscaling image
new = imcomplement(abuImage); %proses negatif / complement gambar grayscale
[baris, kolom]=size(new); %get baris dan kolom pada gambar
hasilDilasi = new; %inisialisasi variabel hasilDilasi dengan gambar negatif

for i=2 : baris-2 %perulangan baris
    for j=2 : kolom-2 %perulangan kolom
        if new(i,j)==1 %jika nilai pixel =1, 
            hasilDilasi(i,j-1) = 1;
            hasilDilasi(i,j)   = 1;
            hasilDilasi(i,j+1) = 1;
            hasilDilasi(i-1,j) = 1;
            hasilDilasi(i+1,j) = 1;
        end
    end
end

imshow(hasilDilasi); %memunculkan hasil dari proses dilasi


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Proses Erosi
global image; %variabel gambar pada axes
abuImage = 0.2*image(:,:,1)+0.5*image(:,:,2)+0.3*image(:,:,3); %proses grayscaling gambar
new = imcomplement(abuImage); %proses negatif / complement pada gambar
[baris,kolom]=size(new); %get baris dan kolom gambar negatif
hasil = double(new); %inisialisasi variabel hasil dengan gambar, dengan tipe data double
hasilErosi = zeros(baris,kolom); %inisialisasi variabel gambar hasilErosi sebanyak baris dan kolom pada gambar awal

for i=2 : baris-2 %perulangan baris
    for j=2 : kolom-2 %perulangan kolom
        if new(i,j)==1
            if hasil(i,j-1)==0 || hasil(i,j+1)==0 || hasil(i-1,j)==0 || hasil(i+1,j)==0
                hasil(i,j)=2;
            end
        end
    end
end

for i=1 : baris % perulangan baris 
    for j=1 : kolom  % perulangan kolom
        if hasil(i,j)==1
            hasilErosi(i,j)=1;
        end
    end
end

imshow(hasilErosi); %menampilkan hasil dari proses erosi ke layar


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Image Compression

global image;
imageLama = image;
[baris,kolom,colormap]=size(imageLama);
array = double(imageLama);


for p = 1:3

    arr = array(:,:,p);

    arraybaru = zeros(1,256);

    newimage = zeros(baris,kolom);


    for i= 1:baris
        for j= 1:kolom
            if mod(double(arr(i,j)),2)==0
                newimage(i,j)=((double(arr(i,j))+1))/2;
            else
                newimage(i,j) = double(arr(i,j))/2;
            end
        end
    end
    
    gambarbaru(:,:,p)=newimage;
end

hasilKompresi = uint8(gambarbaru);

figure
subplot(1,2,1),imshow(image);

axes(handles.gambar);
imshow(hasilKompresi);

imwrite(hasilKompresi,'hasil kompresi.jpg');
