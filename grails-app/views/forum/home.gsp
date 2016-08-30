<%@ page import="hsh_forum.DiscussionThread" %>
<html>
    <head>
        <meta name="layout" content="main"></meta>
        <title>HSH Forum</title>
    </head>
    <body>
        <g:each var="section" in="${sections}">
            <div class="panel panel-default">
                <div class="panel-heading">${section.title}</div>
                <div class="list-group">
                    <g:each var="topic" in="${section.topics.sort{it.title}}">
                        <div class="list-group-item">
                            <g:link action="topic" controller="forum" params="[topicId:topic.id]">${topic.title}</g:link>
                            <span class="topicDescription">${topic.description}</span>
                            <div class="rightInfo">
                                <b>threads</b>: ${topic.numberOfThreads}
                                <b>replies</b>: ${topic.numberOfReplies}
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>
        </g:each>
    </body>

</html>
