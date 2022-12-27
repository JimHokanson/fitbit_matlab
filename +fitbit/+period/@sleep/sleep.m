classdef sleep < handle
    %
    %   Class:
    %   fitbit.period.sleep
    
    properties
        sleep_date
        main
    end
    
    methods
        function obj = sleep(api,sleep_date)
            obj.sleep_date = sleep_date;
            
            obj.main = api.getSleepByDate(sleep_date);
            
            
            
            
        end
    end
end

