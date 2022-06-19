classdef Save < handle
   properties
      model;
      grid;
      config; 
      
      Folder;
      Pictures;
      Ills;
      Data;
      PsiMat;

      ts;
      ls;
      Ubs;
      mus;

   end
   methods
      function obj = Save(params)
          if nargin == 1
              if isfield(params, 'model')
                  obj.model = params.model;
              end
              if isfield(params, 'Folder')
                  obj.Folder = [params.Folder, '/'];
                  util.createFolder(obj.Folder);
              end
          end
          
          if ~isempty(obj.Folder)
              obj.Pictures = [obj.Folder, 'Pictures/'];
              util.createFolder(obj.Pictures);
              
              obj.Data = [obj.Folder, 'Data/'];
              util.createFolder(obj.Data);
              
              obj.PsiMat = [obj.Folder, 'Psi/'];
              util.createFolder(obj.PsiMat);
              
              obj.Ills = [obj.Folder, 'Ills/'];
              util.createFolder(obj.Ills);

              obj.config = obj.model.config;
              obj.grid = obj.model.grid;
              info = obj.saveInfo();

              f = fopen([obj.Data 'INFO.txt'],'w');
              fprintf(f, info);
              fclose(f);
          end
      end
   end
end