classdef sleep_summary < handle
    %
    %   Class:
    %   fitbit.objects.sleep_summary
    
    properties
        in
        s
        stages
        total_minutes_asleep
        total_sleep_records
        total_time_in_bed 
    end
    
    methods
        function obj = sleep_summary(in,s)
            %
            %
            %   fitbit.objects.sleep_summary(in,s);
            
            obj.in = in;
            obj.s = s;
            
            obj.stages = s.stages;
            obj.total_minutes_asleep = s.totalMinutesAsleep;
            obj.total_sleep_records = s.totalSleepRecords;
            obj.total_time_in_bed = s.totalTimeInBed;
            
            
            %{
                stages: [1×1 struct]
                totalMinutesAsleep: 397
                totalSleepRecords: 1
                totalTimeInBed: 448
            %}
            
            %{
                 deep: 70
    light: 241
      rem: 86
     wake: 51
            %}
        end
    end
end

