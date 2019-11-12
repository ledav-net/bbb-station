
----------------------------
### BBB-Station Project 2018
----------------------------

Beagle Bone Black Wireless Monitoring Station

Monitors the following values:
- Temperature (C)
- Humidity (RH)
- Luminosity (Lux and intensity)
- CO2
- Air quality (TVOC)

Features:
- History of values exportable in CVS
- Web access with realtime value graphs
- ...

#### Build procedure

Clone this git repository, then 1st, look at the `README` file in
`project/bbb-station/README` and follow the steps there.

2nd, simply start `./makebr` to see all the build.  The 1st time, it's quite
long as he will have to download all the packages and git repositories and
some of them are hudge...  This is done only once, until you remove the
folder `./dl`.

If you don't want to see all the ouputs, you can pass the `--brief` option
to the above command to only show the steps of the process + some nice
logging with the time elapsed aso...  A `--help` will give you all the
possible options...

Once the build is done, you should have all you need in
`o-bbb-station_beaglebone/final` to flash a sdcard and let your device boot
on it...

Also, this is a project still under development.  It's quite stable but
there is still things to do...  Unfortunately, I don't have enough time to
work on it right now.  I want to replace the dht11 by another one more
precise and connected through i2c, use another framework for the interface,
etc...  etc...

So, don't hesitate to submit your ideas/changes if you wish.  You are
welcome :)

David.
