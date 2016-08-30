package hsh_forum

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ForumController {

    def home() {
      [sections:Section.listOrderByTitle()]
    }

    def topic(long topicId) {
      Topic topic = Topic.get(topicId)
      params.max = 10
      params.sort = 'createDate'
      params.order = 'desc'
      [threads:DiscussionThread.findAllByTopic(topic, params), numberOfThreads:DiscussionThread.countByTopic(topic), topic:topic]
    }

    def thread(long threadId) {
      DiscussionThread thread = DiscussionThread.get(threadId)
      params.max = 10
      params.sort = 'createDate'
      params.order = 'asc'
      [comments:Comment.findAllByThread(thread, params), numberOfComments:Comment.countByThread(thread), thread:thread]
    }

    @Secured(['ROLE_USER'])
    def postReply(long threadId, String body) {
        def offset = params.offset
        if (body != null && body.trim().length() > 0) {
            DiscussionThread thread = DiscussionThread.get(threadId)
            def commentBy = springSecurityService.currentUser
            new Comment(thread:thread, commentBy:commentBy, body:body).save()
            // go to last page so user can view his comment
            def numberOfComments = Comment.countByThread(thread)
            def lastPageCount = numberOfComments % 10 == 0 ? 10 : numberOfComments % 10
            offset = numberOfComments - lastPageCount
        }
        redirect(action:'thread', params:[threadId:threadId, offset:offset])
    }

    def download(long id) {
        Document documentInstance = Document.get(id)
        if ( documentInstance == null) {
            flash.message = "Document not found."
            // redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentInstance.filename}\"")
            def file = new File(documentInstance.fullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }
}
