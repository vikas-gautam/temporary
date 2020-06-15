node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
    stage("change the variable"){
        def cname_subdomain_list = "${cname_subdomain_list}".split(',')
       def final_cname_subdomain_list = assert cname_subdomain_list[0]+cname_subdomain_list[1]
       print (final_cname_subdomain_list)
    }
}
def assignVariable(){
    print ("tset")
}