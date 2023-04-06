#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

require 'open3'
require 'shellwords'

define_target "openssl" do |target|
	target.provides "Library/openssl" do
		cflags_string, status = Open3.capture2(shell_environment, "pkg-config", "--cflags", "openssl")
		ldflags_string, status = Open3.capture2(shell_environment, "pkg-config", "--libs", "openssl")
		
		append buildflags Shellwords.split(cflags_string)
		append linkflags Shellwords.split(ldflags_string)
	end
end
