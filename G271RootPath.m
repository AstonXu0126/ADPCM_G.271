function rootPath=G271RootPath()
% Return the path to the root ADPCM directory
%
% This function must reside in the directory at the base of this
% directory structure.  It is used to determine the location of various
% sub-directories.
% 
% Example:
%   fullfile(G271RootPath,'scripts')

rootPath=which('G271RootPath');

rootPath = fileparts(rootPath);

return