classdef activity_calories_intraday_response < handle
    %
    %   Class:
    %   fitbit.responses.activity_calories_intraday_response
    %
    %   See Also
    %   --------
    %   fitbit.objects.activity_calories
    %   fitbit.objects.activity_calories_intraday
    
    properties
        in
        s
        calories
        calories_intraday
    end
    
    methods
        function obj = activity_calories_intraday_response(in,s)
            
            obj.in = in;
            obj.s = s;
            
            obj.calories = fitbit.objects.activity_calories(in,s.activities_calories);
            if isfield(s,'activities_calories_intraday')
                obj.calories_intraday = fitbit.objects.activity_calories_intraday(in,s.activities_calories_intraday);
            end
            
            
            
            keyboard
        end
    end
end

