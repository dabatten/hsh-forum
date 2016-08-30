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
        <div class="section">
            <div class="sectionTitle">
                ${topic.title}
                <span class="topicDesc">${topic.description}</span>
            </div>
        </div>
        <g:each var="thread" in="${threads}">
            <div class="topic">
                <g:link controller="forum" action="thread" params="[threadId:thread.id]">${thread.subject}
                </g:link>
                <div class="rightInfo">
                    <b>replies</b>: ${thread.numberOfReplies}
                </div>
                <div>
                    Started by: ${thread.opener.username}
                    <br>
                        on:
                        <g:formatDate date="${thread.createDate}" format="dd MMM yyyy"/>
                    </div>
                </div>
            </g:each>
            <div class="pagination">
                <g:paginate total="${numberOfThreads}" params="${[topicId:topic.id]}"/>
            </div>
        </body>
    </html>
