html = "<%= escape_javascript(render partial: 'messages/reply', locals: {message: @message, reply: @reply}) %>"
$("#items_<%= @reply.message_id %>").append(html)
$("#message_<%=@reply.message_id%>").val('')
