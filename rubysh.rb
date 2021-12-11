require "open3"

# Multiple ways to run a command
# value = `echo 'hi'`
# value = %x( echo 'hi' )
# value = %[ echo 'hi' ]
# value = exec( "echo 'hi'" )
value = system( "echo 'hi'" )

cmd = 'dir'
# system(cmd)
# val = exec( cmd )
# val = %x( #{cmd} )
val = %x[ #{cmd} ]
puts val

# Runs the command as a subprocess
# IO.popen("date") { |i| puts i.gets }

# Open3 grants you access to stdin, stdout, stderr and a
# thread to wait the child process when running another program.
Open3.popen3("date") do |stdin, stdout, stderr|
  puts stdout.read
end

# Creates a background process
# pid = spawn("ls -alh")
# Process.wait pid

# Same as echo $?
puts $?.exitstatus
