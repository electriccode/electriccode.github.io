require 'fileutils'
require 'date'

cloneurl = "git@heroku.com:phartiyal-stage.git"
deploymessage = "New deployment @ #{DateTime.now.rfc822.to_s}"

ARGV.each_index do|index|
    a = ARGV[index]
    if a === "--prod"
        cloneurl = "git@heroku.com:phartiyal.git"
    end
    if (a.start_with? "--message" or a.start_with? "-m")
        deploymessage = ARGV[index+1].tr('"', '').tr("'", "")
    end
end

print "🔥 Deploying to #{cloneurl} 🔥\n"
FileUtils.rm_rf('_deploy')
FileUtils::mkdir_p '_deploy'

system "git clone #{cloneurl} _deploy"
system 'jekyll build --destination _deploy/_site'
system "cd _deploy && git add . && git commit -am '#{deploymessage}' && git push origin master"

print "✅ Deployed to #{cloneurl} successful!! ✅\n"