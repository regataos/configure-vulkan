#!/bin/bash

# Checking if the NVIDIA proprietary driver is installed.
if test -e /usr/bin/nvidia-xconfig ; then
    echo "NVIDIA Driver"
	cp -f /etc/vulkan/icd.d/nvidia_icd.json /opt/regataos-vulkan/icd.d/nvidia_icd.json

	cp -f /usr/share/vulkan/icd.d/intel_icd.i686.json /opt/regataos-vulkan/icd.d/intel_icd.i686.json
	cp -f /usr/share/vulkan/icd.d/intel_icd.x86_64.json /opt/regataos-vulkan/icd.d/intel_icd.x86_64.json
    rm -f /usr/share/vulkan/icd.d/intel_icd*

    cp -f /usr/share/vulkan/icd.d/radeon_icd.i686.json /opt/regataos-vulkan/icd.d/radeon_icd.i686.json
	cp -f /usr/share/vulkan/icd.d/radeon_icd.x86_64.json /opt/regataos-vulkan/icd.d/radeon_icd.x86_64.json
    rm -f /usr/share/vulkan/icd.d/radeon_icd*

    cp -f /etc/vulkan/icd.d/amd_icd64.json /opt/regataos-vulkan/icd.d/amd_icd64.json
    rm -f /etc/vulkan/icd.d/amd_icd64.json

    cp -f /opt/regataos-vulkan/icd.d/nvidia_icd.json /etc/vulkan/icd.d/nvidia_icd.json
else

	if test -e /usr/bin/amdgpu-pro-uninstall ; then
    	echo "AMDGPU-PRO Driver for Linux"
		cp -f /etc/vulkan/icd.d/amd_icd64.json /opt/regataos-vulkan/icd.d/amd_icd64.json

		cp -f /usr/share/vulkan/icd.d/intel_icd.i686.json /opt/regataos-vulkan/icd.d/intel_icd.i686.json
		cp -f /usr/share/vulkan/icd.d/intel_icd.x86_64.json /opt/regataos-vulkan/icd.d/intel_icd.x86_64.json
    	rm -f /usr/share/vulkan/icd.d/intel_icd*

    	cp -f /usr/share/vulkan/icd.d/radeon_icd.i686.json /opt/regataos-vulkan/icd.d/radeon_icd.i686.json
		cp -f /usr/share/vulkan/icd.d/radeon_icd.x86_64.json /opt/regataos-vulkan/icd.d/radeon_icd.x86_64.json
    	rm -f /usr/share/vulkan/icd.d/radeon_icd*

        cp -f /etc/vulkan/icd.d/nvidia_icd.json /opt/regataos-vulkan/icd.d/nvidia_icd.json
		rm -f /etc/vulkan/icd.d/nvidia_icd.json

		cp -f /opt/regataos-vulkan/icd.d/amd_icd64.json /etc/vulkan/icd.d/amd_icd64.json

    else

    kmsg=$(lspci | grep VGA)
    echo $kmsg

        if [[ $kmsg == *"Intel"* ]]; then
        	echo "Intel open source driver"
            cp -f /usr/share/vulkan/icd.d/intel_icd.i686.json /opt/regataos-vulkan/icd.d/intel_icd.i686.json
            cp -f /usr/share/vulkan/icd.d/intel_icd.x86_64.json /opt/regataos-vulkan/icd.d/intel_icd.x86_64.json

    		cp -f /usr/share/vulkan/icd.d/radeon_icd.i686.json /opt/regataos-vulkan/icd.d/radeon_icd.i686.json
			cp -f /usr/share/vulkan/icd.d/radeon_icd.x86_64.json /opt/regataos-vulkan/icd.d/radeon_icd.x86_64.json
    		rm -f /usr/share/vulkan/icd.d/radeon_icd*

            cp -f /etc/vulkan/icd.d/nvidia_icd.json /opt/regataos-vulkan/icd.d/nvidia_icd.json
    		rm -f /etc/vulkan/icd.d/nvidia_icd.json

    		cp -f /etc/vulkan/icd.d/amd_icd64.json /opt/regataos-vulkan/icd.d/amd_icd64.json
    		rm -f /etc/vulkan/icd.d/amd_icd64.json

            cp -f /opt/regataos-vulkan/icd.d/intel_icd.i686.json /usr/share/vulkan/icd.d/intel_icd.i686.json
            cp -f /opt/regataos-vulkan/icd.d/intel_icd.x86_64.json /usr/share/vulkan/icd.d/intel_icd.x86_64.json
        elif [[ $kmsg == *"AMD"* ]]; then
        	echo "AMD open source driver"
            cp -f /usr/share/vulkan/icd.d/radeon_icd.i686.json /opt/regataos-vulkan/icd.d/radeon_icd.i686.json
            cp -f /usr/share/vulkan/icd.d/radeon_icd.x86_64.json /opt/regataos-vulkan/icd.d/radeon_icd.x86_64.json

        	cp -f /usr/share/vulkan/icd.d/intel_icd.i686.json /opt/regataos-vulkan/icd.d/intel_icd.i686.json
			cp -f /usr/share/vulkan/icd.d/intel_icd.x86_64.json /opt/regataos-vulkan/icd.d/intel_icd.x86_64.json
    		rm -f /usr/share/vulkan/icd.d/intel_icd*

            cp -f /etc/vulkan/icd.d/nvidia_icd.json /opt/regataos-vulkan/icd.d/nvidia_icd.json
    		rm -f /etc/vulkan/icd.d/nvidia_icd.json

    		cp -f /etc/vulkan/icd.d/amd_icd64.json /opt/regataos-vulkan/icd.d/amd_icd64.json
    		rm -f /etc/vulkan/icd.d/amd_icd64.json

            cp -f /opt/regataos-vulkan/icd.d/radeon_icd.i686.json /usr/share/vulkan/icd.d/radeon_icd.i686.json
            cp -f /opt/regataos-vulkan/icd.d/radeon_icd.x86_64.json /usr/share/vulkan/icd.d/radeon_icd.x86_64.json
        elif [[ $kmsg == *"ATI"* ]]; then
        	echo "AMD open source driver"
            cp -f /usr/share/vulkan/icd.d/radeon_icd.i686.json /opt/regataos-vulkan/icd.d/radeon_icd.i686.json
            cp -f /usr/share/vulkan/icd.d/radeon_icd.x86_64.json /opt/regataos-vulkan/icd.d/radeon_icd.x86_64.json

        	cp -f /usr/share/vulkan/icd.d/intel_icd.i686.json /opt/regataos-vulkan/icd.d/intel_icd.i686.json
			cp -f /usr/share/vulkan/icd.d/intel_icd.x86_64.json /opt/regataos-vulkan/icd.d/intel_icd.x86_64.json
    		rm -f /usr/share/vulkan/icd.d/intel_icd*

            cp -f /etc/vulkan/icd.d/nvidia_icd.json /opt/regataos-vulkan/icd.d/nvidia_icd.json
    		rm -f /etc/vulkan/icd.d/nvidia_icd.json

    		cp -f /etc/vulkan/icd.d/amd_icd64.json /opt/regataos-vulkan/icd.d/amd_icd64.json
    		rm -f /etc/vulkan/icd.d/amd_icd64.json

            cp -f /opt/regataos-vulkan/icd.d/radeon_icd.i686.json /usr/share/vulkan/icd.d/radeon_icd.i686.json
            cp -f /opt/regataos-vulkan/icd.d/radeon_icd.x86_64.json /usr/share/vulkan/icd.d/radeon_icd.x86_64.json
        else
            echo "ERROR: Unsupported VGA controller"
            exit 1
        fi
	fi
fi
