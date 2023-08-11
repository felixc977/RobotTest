import subprocess
import sys

p = subprocess.Popen(
  [
    "powershell.exe", 
    "-noprofile", "-c",
    r"""
    exit (
      Start-Process -Verb RunAs -PassThru -Wait powershell.exe -Args "
        -noprofile -c Set-Location \`"$PWD\`"; & C:\work\test_tools\ModS_Cycling_Test_Utility_v1.7.1\ModS_Cycling_Test_Utility.exe; exit `$LASTEXITCODE
      "
    ).ExitCode
    """
  ],
  stdout=sys.stdout
)
p.communicate()

print('Terminated with exit code ' + str(p.returncode))