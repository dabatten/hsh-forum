package hsh_forum

class Comment {

    static belongsTo = DiscussionThread
    DiscussionThread thread
    SecUser commentBy
    String body
    Date createDate = new Date()
    static hasMany = [attachments: Document]

    static constraints = {
      body(maxSize:8000)
    }
}
