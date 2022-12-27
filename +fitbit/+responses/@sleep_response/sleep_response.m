classdef sleep_response < handle
    %
    %   Class:
    %   fitbit.responses.sleep_response
    
    properties
        in
        s
        sleep
        summary
    end
    
    methods
        function obj = sleep_response(in,s)
            %{
                sleep: [1×1 struct]
                summary: [1×1 struct]

            %}
            obj.in = in;
            obj.s = s;
            
            if isfield(s,'sleep')
                obj.sleep = fitbit.objects.sleep(in,s.sleep);
            end
            if isfield(s,'summary')
                obj.summary = fitbit.objects.sleep_summary(in,s.summary);
            end
            
        end
    end
end

