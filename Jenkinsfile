node{
    stage("clone"){
      git credentialsId: 'jenkins_git', url: 'git@github.com:Devpokhariya/temporary.git'
    }
    stage("varibale interchange"){

        def file = readYaml file: "./${location}/route53.yaml"
        cname_subdomain_list = file["cname_subdomain_list"]
        println "cname_subdomain_list"+cname_subdomain_list 
        cname_domain_records = file["cname_domain_records"]
        println "cname_domain_records"+cname_domain_records 

        a_subdomain_list = file["a_subdomain_list"]
        println "a_subdomain_list"+a_subdomain_list 

        a_records_ip = file["a_records_ip"]
        println "a_records_ip"+a_records_ip 

    }
//     stage("change the variable"){
//         cname_subdomain_list = "${cname_subdomain_list}".split(',')
//         sh """sed -e 's/cname_domain_value_list/${cname_subdomain_list}/' main.tf """
//         cname_subdomain_map = "${cname_subdomain_map}".split(',')
        
//         assignVariableToMap()
//     }
// }

// def assignVariableToMap(){
//     def cname_map = ""
//     for (i=0;i<cname_subdomain_list.size();i++){
//     cname_map += cname_subdomain_list[i] + "=" + cname_subdomain_map[i]
//     }
//     String map_string = cname_map.join(",")
//     sh """sed -e 's/cname_map_value/${map_string}/' main.tf """
// }