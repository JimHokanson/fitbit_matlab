classdef vo2_max
    %
    %   Class:
    %   fitbit.responses.vo2_max
    
    properties
        in
        s
        data
    end
    
    methods
        function obj = vo2_max(in,s)
            obj.in = in;
            obj.s = s;
            
            obj.data = fitbit.objects.cardio_score(in,s);            
        end
    end
end

