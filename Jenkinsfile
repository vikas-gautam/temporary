node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
    stage("change the variable"){
        def cname_subdomain_list = "${cname_subdomain_list}".split(',')

        def final_cname_subdomain_list = []
        for ( i=0 ; i<cname_subdomain_list.size(); i++ ){
       final_cname_subdomain_list.add(cname_subdomain_list[i])
        }
       sh """sed -i /s/'$cname_subdomain_list'/${final_cname_subdomain_list}/ main.tf """
    }
}
def assignVariable(){
    print ("tset")
}