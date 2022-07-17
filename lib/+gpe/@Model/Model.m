classdef Model < handle
   properties
       config;
       grid;
       
       Vts;% array with all Toroidal Potentials
       Vbs;% array with all Vertical Potentials
   end
   methods
      function obj = Model(params)
          if nargin == 1
              if isfield(params, 'config')
                  obj.config = params.config;
              end
              if isfield(params, 'grid')
                  obj.grid = params.grid;
              end
          end
      end
   end
end