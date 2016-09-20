function list_field(dat)
f=fieldnames(dat);
disp(['Fields are: ']);
for i=1:length(f)
    regexp(f{i},'_$');
if isempty(regexp(f{i},'_$'))==1
disp(['   ' f{i}]);
end
end
end