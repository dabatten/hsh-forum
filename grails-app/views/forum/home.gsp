<%@ page import="hsh_forum.DiscussionThread" %>
<html>
    <head>
        <meta name="layout" content="main"></meta>
        <title>HSH Forum</title>
    </head>
    <body>
        <g:each var="section" in="${sections}">
            <div class="section">
                <div class="sectionTitle">${section.title}</div>
                <g:each var="topic" in="${section.topics.sort{it.title}}">
                    <div class="topic">
                        <g:link action="topic" controller="forum" params="[topicId:topic.id]">${topic.title}</g:link>
                        <span class="topicDescription">${topic.description}</span>
                        <div class="rightInfo">
                            <b>threads</b>: ${topic.numberOfThreads}
                            <b>replies</b>: ${topic.numberOfReplies}
                        </div>
                    </div>
                </g:each>
            </div>
        </g:each>
    </body>

</html>
