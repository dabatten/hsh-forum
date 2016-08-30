package hsh_forum

class DiscussionThread {

    static belongsTo = Topic
    static hasMany = [comments: Comment]
    Topic topic
    String subject
    SecUser opener
    Date createDate = new Date()

    static constraints = {
    }

    public long getNumberOfReplies(){
        Comment.countByThread(this)
    }
}
