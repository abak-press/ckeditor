﻿/*
 Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
CKEDITOR4.dialog.add("anchor",function(c){function d(a,b){return a.createFakeElement(a.document.createElement("a",{attributes:b}),"cke_anchor","anchor")}return{title:c.lang.link.anchor.title,minWidth:300,minHeight:60,onOk:function(){var a=CKEDITOR4.tools.trim(this.getValueOf("info","txtName")),a={id:a,name:a,"data-cke-saved-name":a};if(this._.selectedElement)this._.selectedElement.data("cke-realelement")?(a=d(c,a),a.replace(this._.selectedElement),CKEDITOR4.env.ie&&c.getSelection().selectElement(a)):
this._.selectedElement.setAttributes(a);else{var b=c.getSelection(),b=b&&b.getRanges()[0];b.collapsed?(a=d(c,a),b.insertNode(a)):(CKEDITOR4.env.ie&&9>CKEDITOR4.env.version&&(a["class"]="cke_anchor"),a=new CKEDITOR4.style({element:"a",attributes:a}),a.type=CKEDITOR4.STYLE_INLINE,c.applyStyle(a))}},onHide:function(){delete this._.selectedElement},onShow:function(){var a=c.getSelection(),b=a.getSelectedElement(),d=b&&b.data("cke-realelement"),e=d?CKEDITOR4.plugins.link.tryRestoreFakeAnchor(c,b):CKEDITOR4.plugins.link.getSelectedLink(c);
e&&(this._.selectedElement=e,this.setValueOf("info","txtName",e.data("cke-saved-name")||""),!d&&a.selectElement(e),b&&(this._.selectedElement=b));this.getContentElement("info","txtName").focus()},contents:[{id:"info",label:c.lang.link.anchor.title,accessKey:"I",elements:[{type:"text",id:"txtName",label:c.lang.link.anchor.name,required:!0,validate:function(){return!this.getValue()?(alert(c.lang.link.anchor.errorName),!1):!0}}]}]}});