<%@ page import="hsh_forum.DiscussionThread" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"></meta>
        <title>HSH Forum</title>
    </head>
    <body>
        <div class="pagination">
            <g:paginate total="${numberOfComments}" params="${[threadId:thread.id]}"/>
        </div>
        <div class="">
            <div class="bg-primary sectionTitle">
                <h4>${thread.subject}</h4>
            </div>
            <br>
                <g:each var="comment" in="${comments}">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <b>${comment.commentBy.username}</b>
                            <span class="topicDesc">
                                <g:formatDate date="${comment.createDate}" format="dd MMM yyyy hh:mma"/>
                            </span>
                        </div>
                        <div class="panel-body">
                            ${comment.body}

                            <br></br>
                            <g:each in="${comment.attachments}" status="i" var="documentInstance">
                                <div class="well">
                                    <i class="fa fa-file"></i>
                                    <g:link action="download" id="${documentInstance.id}">${documentInstance.filename}</g:link>
                                    <g:formatDate date="${documentInstance.uploadDate}"/>
                                </div>
                            </g:each>
                        </div>
                    </div>
                </g:each>
                <sec:ifLoggedIn>
                    <div class="comment">
                        <h2>Reply</h2>
                        <g:form>
                            <g:textArea name="body" value="${value}" rows="5" cols="40"/>
                            <g:hiddenField name="threadId" value="${thread.id}"/>
                            <fieldset class="buttons">
                                <g:actionSubmit value="Post Comment" action="postReply"/>
                            </fieldset>
                        </g:form>
                    </div>
                </sec:ifLoggedIn>
            </div>
            <div class="pagination">
                <g:paginate total="${numberOfComments}" params="${[threadId:thread.id]}"/>
            </div>
        </body>
    </html>
