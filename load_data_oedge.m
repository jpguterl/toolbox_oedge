function load_data_code
global S
S.filename_err=[];
for i=1:length(S.datatype)
str=S.datatype{i};
try
eval(['S.dat' str '=read_'  str '_bgp(S.casename,S.folder);']);
catch ME
    S.filename_err=[S.folder '/' S.casename '.' str '_bgp.dat'];
    return
end 
end

end