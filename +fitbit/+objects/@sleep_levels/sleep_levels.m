classdef sleep_levels < handle
    %
    %   Class:
    %   fitbit.objects.sleep_levels
    
    
    properties (Constant)
        stage_levels = {'wake','rem','light','deep'};
        classic_levels = {'awake','restless','asleep'}
    end
    
    properties
        in
        s
        data
        short_data
        summary
    end
    
    methods
        function obj = sleep_levels(in,s)
            %{
                     data: [32×1 struct]
                shortData: [24×1 struct]
      summary: [1×1 struct]
            %}
            
            obj.in = in;
            obj.s = s;
            
            
            %2021-01-29T23:52:30.000
            temp = struct2table(s.data);
            temp.dateTime = datetime(temp.dateTime,...
                'format','yyyy-MM-dd''T''HH:mm:ss.SSS');
            
            obj.data = temp;
            
            temp = struct2table(s.shortData);
            temp.dateTime = datetime(temp.dateTime,...
                'format','yyyy-MM-dd''T''HH:mm:ss.SSS');
            
            obj.short_data = temp;
            
            obj.summary = s.summary;
        end
    end
end

