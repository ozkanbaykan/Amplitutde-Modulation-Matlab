%Genlik Modülasyonu
%Özkan Yiğit Baykan 170519044

clc;
close all;
clear all;

%Bilgi Sinyalinin Alınması
Ab = input('Bilgi Sinyalinin Genliğini Giriniz: ');
fb = input('Bilgi Sinyalinin Frekansını Giriniz: ');

Tb = 1/fb;
t = 0:Tb/999:6*Tb;
Yb = Ab*sin(2*pi*fb*t);


%Modülasyon İndeksinin Alınması

while 1
    u = input('Modülasyon İndeksi Giriniz: ');
    if u>1
        disp("Modülasyon İndeksinin 1'den Büyük Olması Bilgi İşaretinin Bozulmasına Sebep Olur")
    elseif u<0
        disp("Modülasyon İndeksi Negatif Olamaz")
    else
        break
    end    
end

%Taşıyıcı Sinyalin Alınması
Ac = Ab/u;
fc = input('Taşıyıcı Sinyalin Frekansını Giriniz: ');
Tc = 1/fc;
Yc = Ab * sin(2*pi*fc*t);


%Genlik Modülasyonu
Y = Ac * (1+u*sin(2*pi*fb*t)).*sin(2*pi*fc*t);

figure(1)
subplot(3,1,1)
plot(t,Yb)
title('Bilgi Sinyali')

subplot(3,1,2)
plot(t,Yc)
title('Taşıyıcı Sinyal')
grid on;

subplot(3,1,3)
plot(t,Y)
title('Modüle Edilmiş Sinyal')
grid on;

