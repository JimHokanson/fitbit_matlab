classdef activity_heart_intraday
    %
    %   Class:
    %   fitbit.objects.activity_heart_intraday
    %
    %   See Also
    %   --------
    %   fitbit.responses.heart_rate_response
    
    
    properties
        s
        interval
        units
        heart_rates
        raw_times
        datetimes
    end
    
    methods
        function obj = activity_heart_intraday(s)
            obj.s = s;
            
            %{
             	dataset: [11219×1 struct]
                datasetInterval: 1
                datasetType: 'second'
            
                s.dataset(1)
                    time: '00:00:00'
                    value: 54
            %}
            
            obj.interval = s.datasetInterval;
            obj.units = s.datasetType;
            
            obj.heart_rates = [s.dataset.value];
            obj.raw_times = {s.dataset.time};
            obj.datetimes = datetime(obj.raw_times,'Format','HH:mm:ss');
        
            %Interpolate
            

            
        
        
        end
        function s = getInterpolatedValues(obj,varargin)
            %
            %   Goal: create evenly sampled timepoints
            %
            %   [values,times] = getInterpolatedValues(obj,varargin)
            
            MAX_GAP_1s = 60;
            
            in.max_gap = 'auto';
            in = sl.in.processVarargin(in,varargin);
            
            merged_interval = sprintf('%d%s',obj.interval,obj.units);
            
            orig_diffs = seconds(diff(obj.datetimes));
            
            x_old = obj.datetimes;
            
            switch merged_interval
                case '1second'
                    %TODO: Time range may not be f
                    sec_duration = seconds(obj.datetimes(end)-obj.datetimes(1));
                    x_new = obj.datetimes(1) + seconds(0:sec_duration);
                    
                    %TODO: Make this a generic function 
                    
                    new_values = interp1(x_old,obj.heart_rates,x_new);
                    
                    new_indices = round(interp1(new_datetimes,1:length(x_new),x_old));
                    
                    %1 2 4 5   - I - 1 2 3 4
                    %1 2 3 4 5 - I - 1 2 4 5
                    
                    
                    if strcmp(in.max_gap,'auto')
                        mask = orig_diffs > MAX_GAP_1s;
                    else
                        mask = orig_diffs > in.max_gap;
                    end
                    
                    large_gap_I = find(mask);
                    
                otherwise
            end
            
            s = struct();
            s.start_large_gaps = obj.datetimes(large_gap_I);
            s.large_gap_durations = obj.datetimes(large_gap_I+1) - obj.datetimes(large_gap_I);
            
            for i = 1:length(large_gap_I)
                old_start_I = large_gap_I(i);
                I1 = new_indices(old_start_I);
                I2 = new_indices(old_start_I+1);
                new_values(I1+1:I2-1) = NaN;
            end
            
            s.values = new_values;
            s.datetimes = x_new;
            
            
            
            %{
            plot(new_datetimes,new_values)
            hold on
            for i = 1:length(I)
                I1 = new_indices(I(i));
                I2 = new_indices(I(i)+1);
                plot(new_datetimes(I1:I2),new_values(I1:I2),'r');
            end
            hold off
            %}
            
            
        end
        function plot(obj,varargin)
            
            in.max_gap = 'auto';
            in = sl.in.processVarargin(in,varargin);
            
            %TODO: Add date
            plot(obj.datetimes,obj.heart_rates)
            ylabel('Heart rate') 
        end
    end
end
