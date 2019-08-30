%%% takes notes out make a separate document
% Youlin Liu 2018-08-18
clear all
path_input = 'slides.tex'; %input name
fid=fopen('notes.txt','wt'); %output name

%% Process
fid_input = fopen (path_input, 'rt');
i = 1;
while feof(fid_input) ~= 1
    line_input = fgetl(fid_input);
    if 0 == sum(~isspace(line_input)) %skip empty lines
        continue; 
    end
    line_without_blank = strtrim(line_input); 
    if strcmp(line_without_blank(1:3),'%==') % if this line is a comment
        line_valid_entry{i}=line_without_blank; %save line
    end    
    i = i+1;
end

% line_valid_entry_sorted = sort(line_valid_entry); %sort entry in aphabetic order
fprintf(fid,'%s\n',line_valid_entry{:});
fclose(fid);


