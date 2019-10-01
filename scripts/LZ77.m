%% LZ77 encoding demo
% by Aston 2019/10/01
clear all
%% Initializing
input = 'aacaacabcabaaac';
len = length(input);
finished = 0;
line = 1;

%% Encoding starts here
while finished < len
    % For the first char
    if finished == 0
       cod(line,1) = 0;
       cod(line,2) = 0;
       cod(line,3) = input(1);
       dic = input(1);
       % move to next char to be encoded
       finished = cod(line,2) + 1;
       % move to next line
       line = line + 1;
       continue
    end
    % For following char
    Start = finished - 6;
    if Start <= 1
       Start = 1; 
    end
    dic = input(Start:finished); % dictionary, length = 7;
    End = finished + 4;
    if End >= len
       End = len; 
    end
    pending = input(finished+1:End); % array that pending for encoding, length = 4;
    % find the match
    dicTmp = [dic,dic];
    pendingCNT = length(pending);
    location = [];
    while isempty(location)
        location = strfind(dicTmp, pending(1:pendingCNT));
        pendingCNT = pendingCNT - 1;
    end
    pendingCNT = pendingCNT + 1; % The longest match
    if location(1) > length(dic)
       location(1) = mod(location(1),length(dic)); 
    end
    finished = finished + pendingCNT + 1;
    cod(line,1) = location(1);
    cod(line,2) = pendingCNT;
    cod(line,3) = input(finished);
    line = line + 1;
end