package hsh_forum

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'forum', action:'home')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
