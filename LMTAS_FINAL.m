%% main code to run project 
%Created by Hasiba
%LMTAS_FINAL combines all of the filters and
%allows them to be accessed in one simple script using conditional
%statements and inputs from the user

%creates a condition asking the user to choose what type of filter they
%want and shows which options are available for each type
disp('Welcome to the Big Brain Senior Photo Booth!')
a = input('Would you like a color filter or an object filter? \n', 's');
if strcmpi(a, 'color filter') || strcmpi(a, 'color')
    webcam_color();
else strcmpi(a, 'object filter') || strcmpi(a, 'object');
    disp('Available Object Filters: ');
    disp('Glasses, Hat, Hearts, Mustache, Lips, Clown Nose');
    o = input('Please type the object filter you would like: \n', 's');
        if strcmpi(o, 'glasses')
            webcam_sunglasses();
        elseif strcmpi(o, 'hat')
            webcam_hat_debugtest();
        elseif strcmpi(o, 'hearts')
            webcam_hearts();
        elseif strcmpi(o, 'mustache')
            webcam_mustache();
        elseif strcmpi(o, 'lips')
            lips_test();
        else strcmpi(o, 'clown nose')
            webcam_clownnose();
        end
end
