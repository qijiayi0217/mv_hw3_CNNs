clear all;
images=load('./data/mnist-extra/imdb.mat');
for i=1:70000
    type1=rand(1);
    type2=rand(1);
    if images.images.set(i)==1
        if type1<=1/6
            sigma=20;
        elseif type1<=2/6
            sigma=40;
        elseif type1<=3/6
            sigma=60;
        elseif type1<=4/6
            sigma=80;
        elseif type1<=5/6
            sigma=100;
        elseif type1<=6/6
            sigma=1000;
        end
        if type2<=1/6
            degree=20;
        elseif type2<=2/6
            degree=45;
        elseif type2<=3/6
            degree=90;
        elseif type2<=4/6
            degree=135;
        elseif type2<=5/6
            degree=160;
        elseif type2<=6/6
            degree=180;
        end
    else
        continue
    end
    noise_image=attack(images.images.data(:,:,:,i),images.images.data_mean,sigma,0);
    rotation_image=attack(images.images.data(:,:,:,i),images.images.data_mean,0,degree);
    images.images.data(:,:,:,end+1)=noise_image;
    images.images.set(end+1)=1;
    images.images.labels(end+1)=images.images.labels(i);
    images.images.data(:,:,:,end+1)=rotation_image;
    images.images.set(end+1)=1;
    images.images.labels(end+1)=images.images.labels(i);
end
meta=images.meta;
images=images.images;
save ./data/mnist-extra/imdb.mat images meta
    
            