node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
    stage("change the variable"){
        def cname_subdomain_list = "${cname_subdomain_list}".split(',')
        print (cname_subdomain_list)
        def final_cname_subdomain_list = []
       final_cname_subdomain_list.add(cname_subdomain_list)
       print (final_cname_subdomain_list)
    }
}
def assignVariable(){
    print ("tset")
}