classdef activity_calories_intraday
    %
    %   Class:
    %   fitbit.ojects.activity_calories_intraday
    %
    %   See Also
    %   --------
    %   fitbit.responses.activity_calories_intraday_response
    %   
    
    properties
        in
        s
        start_date
        interval
        units
        
        %table with fields
        %
        % - level
        % - mets
        % - time
        % - value - calories???
        data
    end
    
    methods
        function obj = activity_calories_intraday(in,s)
            obj.in = in;
            obj.s = s;
            
            obj.interval = s.datasetInterval;
            obj.units = s.datasetType;
            
            temp = struct2table(s.dataset);
            temp.time = fitbit.utils.stringToTime(temp.time);
            obj.data = temp;            
            %level
            %mets
            %time
            %value

        end
    end
end

