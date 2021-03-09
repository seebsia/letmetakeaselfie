%% main code to run project

%creates a condition asking the user to choose what type of filter they
%want and shows which options are available for each type
disp('Welcome to the Big Brain Senior Photo Booth!')
a = input('Would you like a color filter or an object filter? \n', 's');
if strcmpi(a, 'color filter') || strcmpi(a, 'color')
    color();
else strcmpi(a, 'object filter') || strcmpi(a, 'object');
    disp('Available Object Filters: ');
    disp('Glasses, Hat, Hearts, Mustache');
    o = input('Please type the object filter you would like: \n', 's');
        if strcmpi(o, 'glasses')
            sunglasses()
        elseif strcmpi(o, 'hat')
            hat();
        elseif strcmpi(o, 'hearts')
            hearts();
        elseif strcmpi(o, 'mustache')
            mustache();
        end
end