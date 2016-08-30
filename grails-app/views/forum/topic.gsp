<%@ page import="hsh_forum.DiscussionThread" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"></meta>
        <title>HSH Forum</title>
    </head>
    <body>
        <div class="pagination">
            <g:paginate total="${numberOfThreads}" params="${[topicId:topic.id]}"/>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                ${topic.title}
                <span class="topicDesc">${topic.description}</span>
            </div>
        </div>
        <div class="list-group">
            <g:each var="thread" in="${threads}">
                <div class="list-group-item">
                    <g:link controller="forum" action="thread" params="[threadId:thread.id]">${thread.subject}
                    </g:link>
                    <div class="rightInfo">
                        <b>replies</b>: ${thread.numberOfReplies}
                    </div>
                    <div>
                        Started by: ${thread.opener.username} on:
                        <g:formatDate date="${thread.createDate}" format="dd MMM yyyy"></g:formatDate>
                    </div>
                </div>
            </g:each>
        </div>
        <div class="pagination">
            <g:paginate total="${numberOfThreads}" params="${[topicId:topic.id]}"/>
        </div>
    </body>
</html>
