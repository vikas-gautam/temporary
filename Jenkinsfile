node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
    stage("change the variable"){
        cname_subdomain_list = "${cname_subdomain_list}".split(',')
        sh """sed -e 's/cname_domain_value_list/${cname_subdomain_list}/' main.tf """
        cname_subdomain_map = "${cname_subdomain_map}".split(',')
        
        assignVariableToMap()
    }
}

def assignVariableToMap(){
    def cname_map = ""
    for (i=0;i<cname_subdomain_list.size();i++){
    cname_map += cname_subdomain_list[i] + "=" + cname_subdomain_map[i]
    }
    String map_string = cname_map.join(",")
    sh """sed -e 's/cname_map_value/${map_string}/' main.tf """
}