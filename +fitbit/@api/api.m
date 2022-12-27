classdef api < handle
    %
    %   Class:
    %   fitbit.api
    
    %{
        api = fitbit.api('jim');
    %}
    
    
    properties
        fit
        h
    end
    
    methods (Static)
        function reset()
            %
            %   fitbit.api.reset()
            
            %Doesn't seem to work :/
            clear classes %#ok<CLCLS>
            fit = py.importlib.import_module('fitbitbit');
            py.importlib.reload(fit);
        end
    end
    
    methods
        function obj = api(user_name)
            %
            %
            %   api = fitbit.api(user_name)
            
            obj.fit = py.importlib.import_module('fitbitbit');
            obj.h = obj.fit.API(user_name,pyargs('return_type','text')); 
        end
        function result = activityZoneMinutesIntradaySeries(obj)
           %    activity_zone_minutes_intraday_series 
        end
        function result = activityZoneTimeSeries(obj,start_date,varargin)
            %
            %
            %   result = api.activityZoneTimeSeries('2022-07-01','period','1m');  
            
            in.period = '1d';
            in.end_date = string(missing);
            in = sl.in.processVarargin(in,varargin);

            args = sl.struct.toPythonArgs(in);
            
            temp = char(obj.h.activity_zone_time_series(activity_type,start_date,args));
            
            s = jsondecode(temp);
            
            keyboard
        end        
        function result = getSleepPeriod(obj,sleep_date)
            result = fitbit.period.sleep(obj,sleep_date);
        end
        function result = getActivityIntradayTimeSeries(obj,...
                activity_type,start_date,varargin)
            %
            %
            %   Inputs
            %   ------
            %   activity_type :
            %       - 'calories'
            %       - 'distance'
            %       - 'elevation'
            %       - 'floors'
            %       - 'steps'
            %
            %   
            %   start_date :
            %
            %   
            %   Optional Inputs
            %   ---------------
            %   detail_level : 
            %       - '1min'
            %       - '5min'
            %       - '15min'
            %   end_date :
            %   time_range : 
            %
            %   
            %
            %   Example
            %   -------
            %   result = api.getActivityIntradayTimeSeries('calories','2022-11-11');  
            %
            %   %Only returns the summary
            %   result = api.getActivityIntradayTimeSeries('calories','2022-11-11','end_date','2022-11-12');
            %
            %   %Gives details, 
            %   result = api.getActivityIntradayTimeSeries('calories','2022-11-11',...
            %       'end_date','2022-11-12','time_range',{'20:00','10:00'});
            
            in.detail_level = '1min';
            in.end_date = string(missing);
            in.time_range = [];
            in = sl.in.processVarargin(in,varargin);
            
            if ~isempty(in.time_range)
                in.start_time = in.time_range{1};
                in.end_time = in.time_range{2};
            else
            	in.start_time = string(missing);
                in.end_time = string(missing);
            end
            
            in = rmfield(in,'time_range');
            
            args = sl.struct.toPythonArgs(in);
            
            in.activity_type = activity_type;
            in.start_date = start_date;
            
            switch activity_type
                case 'calories'
                    fh = @fitbit.responses.activity_calories_intraday_response;
                case 'distance'
                    fh = @fitbit.responses.activity_distance_intraday_response;
                case 'elevation'
                    fh = @fitbit.responses.activity_elevation_intraday_response;
                case 'floors'
                    fh = @fitbit.responses.activity_floors_intraday_response;
                case 'steps'
                    fh = @fitbit.responses.activity_steps_intraday_response;
                otherwise
                    error('unrecognized activity request type')
            end

            temp = char(obj.h.get_activity_intraday_series(activity_type,start_date,args));
            
            s = jsondecode(temp);
            
            result = fh(in,s);
            
            
            keyboard
            
            
            
        end
        function result = getSleepByDate(obj,date)
            %
            %   Example
            %   -------
            %   result = api.getSleepByDate('2021-01-30')  
            
            temp = char(obj.h.get_sleep_by_date(date));
            
            s = jsondecode(temp);
            
            s2 = struct;
            s2.date = date;
            
            result = fitbit.responses.sleep_response(s2,s);
            
        end
        function result = getSleepByDateRange(obj)
            error('Not yet implemented')
        end
        function result = getHeartRateSummary(obj,date,end_date_or_period)
            %
            %
            %   result = getHeartRateSummary(obj,date,varargin)
            %
            %   result = getHeartRateSummary(d2,'period',<period_value>)
            %
            %   result = getHeartRateSummary(d1,'end_date',<end_date_value>)
            %
            %
            %
            %   Optional Inputs
            %   ---------------
            %   end_date : yyyy-MM-dd string or 'today'
            %   period : default '1min'
            %       - '1d'
            %       - '7d'
            %       - '30d'
            %       - '1w'
            %       - '1m' (1 month)
            %
            %   Example
            %   -------
            %   result = api.getHeartRateSummary('2021-01-30','1d')
            
%             if length(end_date_or_period) > 3
%                 end_date = end_date_or_period;
%                 period = '1d';
%             else
%                 
%             end
            
%             in.end_date = string(missing);
%             in.period = '1d';
%             in = sl.in.processVarargin(in,varargin);
%             
%             in.d2 = in.end_date;
%             in = rmfield(in,'end_date');
%             
%             args = sl.struct.toPythonArgs(in);
            
            temp = char(obj.h.get_heart_rate(date,end_date_or_period));
            
            s = jsondecode(temp);
            
            result = fitbit.responses.heart_rate_response(end_date_or_period,s);  
        end
        function result = getHeartRateDetailed(obj,date,varargin)
            %
            %
            %   result = getHeartRateDetailed(obj,date,varargin)
            %
            %
            %   Optional Inputs
            %   ---------------
            %   end_date : yyyy-MM-dd string or 'today'
            %   detail_level : default '1min'
            %       - '1sec'
            %       - '1min'
            %       - '5min'
            %       - '15min'
            %   start_time : HH:mm string
            %   end_time : HH:mm string
            %
            %   Example
            %   -------
            %   result = api.getHeartRateDetailed('2021-01-30','detail_level','1sec')
            
            in.end_date = string(missing);
            in.detail_level = '1min';
            in.start_time = string(missing);
            in.end_time = string(missing);
            in = sl.in.processVarargin(in,varargin);
            
            args = sl.struct.toPythonArgs(in);
            
            temp = char(obj.h.get_heart_rate_detailed(date,args));
            
            s = jsondecode(temp);
            
            result = fitbit.responses.heart_rate_response(in,s);            
        end
        function result = getVO2Max(obj,start_date,end_date)
            %
            %
            %   result = getVO2Max(obj,start_date,*end_date)
            %
            %   Usage Notes
            %   -----------
            %   Cannot exceed 30 days
            %
            %   Example
            %   -------
            %   result = api.getVO2Max('2021-01-30','2021-02-28')
            %   result = api.getVO2Max('2021-01-30')
            %
            %   Improvements
            %   ------------
            %   1. Anything that exceeds 30 days, handle requesting more
            %   internally
            %   
            
            if nargin == 2
                temp = char(obj.h.get_V02_max(start_date));
                end_date = [];
            else
                temp = char(obj.h.get_V02_max(start_date,end_date));
            end
            
            s = jsondecode(temp);
            
            s2 = struct;
            s2.start_date = start_date;
            s2.end_date = end_date;
            
            result = fitbit.responses.vo2_max(s2,s);
        end
    end
    
    methods
        function day = getDay(obj,target_date)
            day = fitbit.objects.day(target_date);
        end
    end
end


%Activity Zone Minutes Intraday Time Series
%Activity Zone Minutes Time Series
%Activity
%Activity Intraday Time Series
%Activity Time Series
%Auth
%Body and Weight
%Body and Weight Time Series
%Breathing Rate
%Breathing Rate Intraday
%Cardio Fitness Score (VO2 Max)
%Devices
%Food and Water
%Food and Water Time Series
%Friends
%X Heart Rate Intraday Time Series
%X Heart Rate Time Series
%Heart Rate Variability
%Heart Rate Variability Intraday
%X Sleep
%SpO2
%SpO2 Intraday
%Subscriptions
%Temperature
%Users

