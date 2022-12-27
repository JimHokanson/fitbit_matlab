function output = stringToTime(values)
%
%   output = fitbit.utils.stringToTime(values)

    output = datetime(values,'format','HH:mm:ss');

end