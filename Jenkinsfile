node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
     file = readYaml file: "route53.yaml"
    stage('setting cname records'){

        cname_subdomain_list = file["cname_subdomain_list"]
        println "cname_subdomain_list:" + cname_subdomain_list 
        cname_domain_records = file["cname_domain_records"]
        println "cname_domain_records:" + cname_domain_records 

        assignVariableToMap(cname_subdomain_list,cname_domain_records)
        
        sh """sed -e 's/cname_domain_value_list/${cname_subdomain_list}/' main.tf """
        sh """sed -e 's/cname_map_value/${map_string}/' main.tf """

        
    }
    stage("setting A records"){
   
        a_subdomain_list = file["a_subdomain_list"]
        println "a_subdomain_list:" + a_subdomain_list 

        a_records_ip = file["a_records_ip"]
        println "a_records_ip:" + a_records_ip 

        assignVariableToMap(a_subdomain_list,a_records_ip)
        
        sh """sed -e 's/a_domain_value_list/${a_subdomain_list}/' main.tf """
        sh """sed -e 's/a_record_map_value/${map_string}/' main.tf """
    }

}
def assignVariableToMap(list,record){
    def map_value = []
    for (i=0;i<list.size();i++){
    map_value += list[i] + "=" + record[i] 

    }
    String map_string = map_value.join(",")
    return map_string
 }