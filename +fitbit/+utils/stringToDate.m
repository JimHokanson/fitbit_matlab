function output = stringToDate(values)
%
%   output = fitbit.utils.stringToDate(values)

    output = datetime(values,'format','2014-04-19');

end