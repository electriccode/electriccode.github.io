require 'fileutils'
require 'date'

cloneurl = "git@heroku.com:phartiyal-stage.git"
deploymessage = "New deployment @ #{DateTime.now.rfc822.to_s}"

ARGV.each do|a|
    if a === "--prod"
        cloneurl = "git@heroku.com:phartiyal.git"
    end
end

print "🔥 Deploying to #{cloneurl}\n"
FileUtils.rm_rf('_deploy')
FileUtils::mkdir_p '_deploy'

system "git clone #{cloneurl} _deploy"
system 'jekyll build --destination _deploy/_site'
system "cd _deploy && git add . && git commit -am '#{deploymessage}' && git push origin master"

print "✅ Deploying to #{cloneurl} successful!!\n"