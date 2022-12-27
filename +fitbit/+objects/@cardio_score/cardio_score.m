classdef cardio_score < handle
    %
    %   Class:
    %   fitbit.objects.cardio_score
    
    properties
        in
        s
        df
    end
    
    methods
        function obj = cardio_score(in,s)
            obj.in = in;
            obj.s = s;
            
            s2 = struct();
            
            dates = {s.cardioScore.dateTime};
            
            dates = datetime(dates,'format','yyyy-MM-dd');
            
            values_s = [s.cardioScore.value];
            
            %TODO: Check fields, expecting only vo2Max
            
            vo2_ranges = {values_s.vo2Max};
            vo2_means = cellfun(@h__parseMean,vo2_ranges);
            
            s2.dates = dates';
            s2.vo2_ranges = vo2_ranges';
            s2.vo2_means = vo2_means';
            
            obj.df = struct2table(s2);
        end
    end
end

function value = h__parseMean(str)
    I = find(str == '-');
    v1 = str2double(str(1:I-1));
    v2 = str2double(str(I+1:end));
    value = 0.5*v1 + 0.5*v2;
end

