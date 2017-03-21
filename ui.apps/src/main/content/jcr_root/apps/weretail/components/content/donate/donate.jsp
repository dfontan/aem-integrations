<%@page session="false"%><%--

  ADOBE CONFIDENTIAL
  __________________

   Copyright 2011 Adobe Systems Incorporated
   All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
--%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page import="java.util.Locale,
                  com.day.cq.i18n.I18n" %><%
%>
<form method="GET" action="/content/we-retail/us/en/thank-you.html" enctype="multipart/form-data">
    <input type="hidden" name="_charset_" value="UTF-8">

    <h1><%= properties.get("title", "Please consider a donation!") %></h1>
    <p class="donationwrapper">
        <span class="donationfield">
            <label for="donation">Amount:</label>
            <span class="currency">$</span>
            <input name="donation" id="donation" type="number" value="<%= properties.get("defaultValue", "5") %>" min="1" required placeholder="Please enter your donation"/>
        <span>
    </p>
    <p class="formbuttons">
        <button type="submit" name="Submit"><%= properties.get("submitMsg", "Donate now") %></button>
    </p>
</form>
