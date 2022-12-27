classdef activity_calories < handle
    %
    %   Class:
    %   fitbit.ojects.activity_calories
    %
    %   See Also
    %   --------
    %   fitbit.responses.activity_calories_intraday_response
    %   fitbit.ojects.activity_calories_intraday
    
    properties
        in
        s
        date_times
        values
    end
    
    methods
        function obj = activity_calories(in,s)
            obj.in = in;
            obj.s = s;
            
            obj.date_times = fitbit.utils.stringToDate({s.dateTime});
            temp = {s.value};
            obj.values = cellfun(@(x) str2double(x),temp);
        end
    end
end

