classdef heart_rate_response < handle
    %
    %   Class:
    %   fitbit.responses.heart_rate_response
    %
    %   See Also
    %   --------
    %   fitbit.objects.activities_heart_intraday
    %   fitbit.api.getHeartRateDetailed
    %
    %   
    
    properties
        in
        s
        summary
        intraday
    end
    
    methods
        function obj = heart_rate_response(in,s)
            obj.in = in;
            obj.s = s;
            
            if isfield(s,'activities_heart_intraday')
                obj.intraday = ...
                    fitbit.objects.activity_heart_intraday(s.activities_heart_intraday);
            end
            
            if isfield(s,'activities_heart')
                obj.summary = ...
                    fitbit.objects.activity_heart(s.activities_heart);
            end
        end
    end
end

