var pageName = window.location.pathname;
pageName = pageName.substring(1, pageName.lastIndexOf(".")); // remove .html and leading /
pageName = pageName.replace(/\//g , ":"); // replace / with :
return pageName;