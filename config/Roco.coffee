set 'application', 'nicck.tk'
set 'hosts', ['130.255.188.231']
set 'keepReleases', 3
set 'repository', 'https://github.com/nicck/nicck.tk'
set 'wwwPath', -> "/usr/share/nginx/www/#{roco.application}"

namespace 'deploy', ->
    task 'default', (done) ->
        sequence 'update', 'wwwSymlink', done
    task 'wwwSymlink', (done) ->
        # releasePath
        run """
          rm -f #{roco.wwwPath};
          ln -s #{roco.currentPath}/public #{roco.wwwPath};
          true
          """, done
