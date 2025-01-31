module spring(size = [40,20,10], thinness = 1, waveNum = 9, divPerWave = 360, $fs=0.5) {
    amp = size.y/2;
    waveLength = size.x/waveNum;
    sinWave = function (x) amp*sin(360*x/waveLength);
    // cosWave = function (x) amp*cos(360*x/waveLength);

    dx = waveLength/divPerWave;
    printFunc(func = sinWave, xrange = [0,size.x], div = dx, height = size.z, thinness = thinness);
}

module printFunc(func = function (x) 10*sin(360*x/100), xrange = [0,100], div=0.1, height = 10, thinness=1) {
    for (i = [xrange[0]+div:div:xrange[1]]) {
        p0 = [i-div, func(i-div), 0];
        p1 = [i, func(i), 0];
        hull() {
            translate(v = p0) cylinder(h = height, r = thinness, center = false);
            translate(v = p1) cylinder(h = height, r = thinness, center = false);
        }
    }
}

spring(thinness=0.5);

