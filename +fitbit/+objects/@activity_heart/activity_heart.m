classdef activities_heart
    %
    %   Class:
    %   fitbit.objects.activities_heart
    %
    %   See Also
    %   --------
    %   fitbit.objects.activities_heart_intraday
    %   fitbit.responses.heart_rate_response
    
    properties
        s
        datetime
        custom_zones
        zones
        zone_names
        resting_heart_rate
    end
    
    methods
        function obj = activities_heart(s)
            obj.s = s;
            
            %{
             s = 

                  struct with fields:

                    dateTime: '2021-01-30'
                       value: [1×1 struct]
            
            s.value
                customHeartRateZones: []
                heartRateZones: [4×1 struct]
                restingHeartRate: 69
            
            %}
            
            obj.custom_zones = s.value.customHeartRateZones;
            
            hr_zones = s.value.heartRateZones;
            obj.zones = hr_zones;
            obj.zone_names = {hr_zones.name};
            
            obj.resting_heart_rate = s.value.restingHeartRate;
        end
    end
end

