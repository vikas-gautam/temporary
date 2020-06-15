node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
    stage("change the variable"){
        cname_subdomain_list = "${cname_subdomain_list}".split(',')
        sh """sed -e 's/cname_domain_value_list/${cname_subdomain_list}/' main.tf """
    }
}
def assignVariable(){
    def cname_map = [:]
    cname_map = cname_subdomain_list
    print cname_map

}