function show_fg_boundary(fg_bitmap)

b = bwboundaries(fg_bitmap);
plot(b{1}(:,1),b{1}(:,2));
set(gca,'YDir','reverse')
