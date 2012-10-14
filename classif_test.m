
alldir=dir('C:\Users\Administrator\Downloads\scene_categories');
num = size(alldir,1);
%image_dir = 'C:\Users\Administrator\Downloads\scene_categories\bedroom'; 
%data_dir = 'data';
cd 'C:\Users\Administrator\Downloads\scene_categories'; 
% for other parameters, see BuildPyramid

%fnames = dir(fullfile(image_dir, '*.jpg'));
%num_files = size(fnames,1);
%filenames = cell(num_files,1);

for m=3:num
        %get all dictionaries
        each_dir{m} = alldir(m).name;
        %get every pic in each dictionary
	    fnames = dir(fullfile(each_dir{m}, '*.jpg'));
        num_files = size(fnames,1);
		for f = 1:num_files	
            filenames{f} = fnames(f).name;
            clear img;
            img = imread(fullfile(each_dir{m},filenames{f}));
            clear gist;
            clear gist_result;
            param.orientationsPerScale = [8 8 8 8];
            param.numberBlocks = 4;
            param.fc_prefilt = 4;
            % output energies
            [gist, param] = LMgist(img, '', param);
            gist_result(f,:)=gist;
        end
        if m==3
            train_gist=gist_result(1:200,:);
            test_gist=gist_result(201:num_files,:);
            test_label_num=num_files-200;
        else
        train_gist=[train_gist;gist_result(1:200,:)];
        test_gist=[test_gist;gist_result(201:num_files,:)];
        test_label_num=[test_label_num;num_files-200];
        end
end

