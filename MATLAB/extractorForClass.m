function [ features ] = extractorForClass( class )
cd Database
dirName = class;              %# folder path
files = dir( fullfile(dirName,'*.wav') );   %# list all *.wav files
files = {files.name}';                      %'# file names
addpath(class);
mirdata = miraudio(files);

fb = mirfilterbank(mirdata);
spec = mirspectrum(mirdata);
%pk=mirpeaks(happy);

rms=mirrms(mirdata);
lowenergy =mirlowenergy(rms);
attackt = mirattacktime(fb);
dur = mirduration(fb);
edensity=mireventdensity(files);
tempo=mirtempo(fb);
clear fb
metroid = mirmetroid(files);
iclarity = mirpulseclarity(spec);
brightness = mirbrightness(spec);
rolloff=mirrolloff(spec);
mfcc=mirmfcc(spec); 
inharm=mirinharmonicity(spec);
%roughness=mirroughness(spec); OUT of MEMORY eror
regularity=mirregularity(files, 'Krimphoff'); 
key=mirkey(mirdata);
mode=mirmode(mirdata);
tcentroid=mirtonalcentroid(mirdata);

speccentroid =mircentroid(spec);
specspread=mirspread(spec);

fname = sprintf('%s.csv',class);
mirexport(fname,rms,lowenergy,attackt,dur,edensity,tempo,metroid,iclarity,speccentroid,specspread,brightness,rolloff,mfcc,inharm,regularity,key,mode,tcentroid);
cd ..
end

