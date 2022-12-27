classdef sleep < handle
    %
    %   Class:
    %   fitbit.objects.sleep
    %
    %   See Also
    %   --------
    %   fitbit.responses.sleep_response
    
    properties
        in
        s
        date_of_sleep
        
        %Units, sec
        duration
        efficiency
        start_time
        end_time
        info_code
        is_main_sleep
        levels
        log_id
        log_type
        minutes_after_wakeup
        minutes_asleep
        minutes_awake
        minutes_to_fall_asleep
        time_in_bed
        type
    end
    
    methods
        function obj = sleep(in,s)
            
            %{
            dateOfSleep: '2021-01-30'
               duration: 26880000
             efficiency: 96
                endTime: '2021-01-30T07:21:00.000'
               infoCode: 0
            isMainSleep: 1
                 levels: [1×1 struct]
                  logId: 3.0715e+10
                logType: 'auto_detected'
     minutesAfterWakeup: 0
          minutesAsleep: 397
           minutesAwake: 51
    minutesToFallAsleep: 0
              startTime: '2021-01-29T23:52:30.000'
              timeInBed: 448
                   type: 'stages'
            
            %}
            
            obj.in = in;
            obj.s = s;
            
            obj.date_of_sleep = s.dateOfSleep;
            obj.duration = s.duration;
            obj.efficiency = s.efficiency;
            obj.start_time = s.startTime;
            obj.end_time = s.endTime;
            obj.info_code = s.infoCode;
            obj.is_main_sleep = s.isMainSleep;
            obj.levels = fitbit.objects.sleep_levels(in,s.levels);      
            obj.log_id = s.logId;
            obj.log_type = s.logType;
            obj.minutes_after_wakeup = s.minutesAfterWakeup;
            obj.minutes_asleep = s.minutesAsleep;
            obj.minutes_awake = s.minutesAwake;
            obj.minutes_to_fall_asleep = s.minutesToFallAsleep;
            obj.time_in_bed = s.timeInBed;
            obj.type = s.type;
        end
    end
end

