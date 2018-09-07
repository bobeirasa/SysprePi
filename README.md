# About

SysprePi is a suita than can run on Raspberry Pi devices running Raspbian. It allows the device to self-configure on boot. There are basically 2 ways of doing stuff:

1. On every boot: things that make not expensive to locally compute, or are not bandwidth intensive, are performed on every boot. Like for example setting the device's serial number as hostname and updating a dynamic DNS.

2. On selected boots: some other things make sense to be executed only once there is a file called <code>/boot/firstrun</code> exists, if yes, than it runs some other stuff. When you clone the microSD card make sure to have that, after the execution the file is removed to avoid a loop. This is useful if you want to do one time configurations on the devices, like printing a label with the unit's serial number. 

3. From time to time when the device is turned on. The repository also contains some useful scripts that can be placed in the OS' <code>crontab</code>.

For the boot options (1 and 2), the code relies on <code>/etc/rc.local</code>, so for convenience I placed that file in the repo, where you can symlink to your <code>/etc/rc.local</code> on Raspbian.

# Serial Number Label Printing

Printer model: https://www.amazon.com/gp/product/B00JHME7W4/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1

I'm still waiting for my printer to arrive to start development on that.
