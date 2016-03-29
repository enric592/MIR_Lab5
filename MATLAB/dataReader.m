 M = csvimport('Database/happysad.csv','delimiter',';'); %Importing CSV database.
 Ms = M(:,[1 end]); % Subset of our Database containing only filename and class.