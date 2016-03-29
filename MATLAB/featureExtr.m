clear all;
addpath 'MATLAB'
cd ..
classes = cell(1,2);classes{1}='Happy';classes{2}='Sad';

for i=1:numel(classes)
    extractorForClass(classes{i});
end
extractorForClass('Test');