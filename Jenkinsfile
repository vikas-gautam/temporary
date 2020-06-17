node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
    //reading yaml file
    file = readYaml file: "route53.yaml"

    stage('setting cname records'){

        cname_subdomain_list = file["cname_subdomain_list"]
        println "cname_subdomain_list:" + cname_subdomain_list 
        cname_domain_records = file["cname_domain_records"]
        println "cname_domain_records:" + cname_domain_records 
        
        // conversion of list to map 
        def cname_map=listToMap(cname_subdomain_list,cname_domain_records)
        
        // call funct to assign varible in main.tf
        assign_Tf_Vars(cname_subdomain_list,cname_map,"cname") 
    }

    stage("setting A records"){
   
        a_subdomain_list = file["a_subdomain_list"]
        println "a_subdomain_list:" + a_subdomain_list 

        a_records_ip = file["a_records_ip"]
        println "a_records_ip:" + a_records_ip 

        // conversion of list to map 
        def a_map=listToMap(a_subdomain_list,a_records_ip)

        // call funct to assign varible in main.tf
        assign_Tf_Vars(cname_subdomain_list,cname_map,"A_record")
        
    }

}

def listToMap(list,record){
    def map_value = []
    for (i=0;i<list.size();i++){
    map_value += list[i] + "=" + record[i] 
    }
    String map_string = map_value.join(",")
    return map_string
 }
 def assign_Tf_Vars(list,map,type){

     if (type=="A_record"){
        sh """sed -e 's/a_domain_value_list/${a_subdomain_list}/' main.tf """
        sh """sed -e 's/a_record_map_value/${map_string}/' main.tf """
     }
     else{
         sh """sed -e 's/cname_domain_value_list/${cname_subdomain_list}/' main.tf """
        sh """sed -e 's/cname_map_value/${map_string}/' main.tf """
     }
 }