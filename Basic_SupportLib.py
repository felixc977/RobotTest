import subprocess
import csv
import os
import shutil

class Basic_SupportLib(object):

    def is_device_online(self, ipaddress):
        output = subprocess.Popen(["ping.exe", "-n", "1", ipaddress],stdout = subprocess.PIPE).communicate()[0]

        if (b'TTL' in output):
            return True
        else:
            return False