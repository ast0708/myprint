!function(e){e.fn.imageSlider=function(t){function n(t,n){function i(t,n,i){return e(document.createElement("div")).html(e("<img src='"+encodeURI(t)+"' width=100 height=60>")).addClass("thumb").attr("src","'"+t+"'").attr("id","thumb_"+n).prop("container",i).mouseover(function(){if(clearTimeout(g),o.removeClass("thumb_selected").eq(n).addClass("thumb_selected"),k.stop().animate({top:"-"+I*n},_),1==s){if(f=n,f++,f==b&&(f=0,v++),v>l&&0!=l)return void(autoscroll=!1);g=setTimeout(function(){o.eq(f).trigger("mouseover")},d)}}).mouseup(function(){1==r&&(s=!1)})}function a(t,n){return e(document.createElement("div")).append(e('<div style="width:100%;height:100%;background:url('+encodeURI(t)+')  center center no-repeat;"></div>')).addClass("main_image").attr("src",t).attr("id","main_"+n).click(function(){}).mouseover(function(){}).mouseout(function(){})}var s=t.auto_scroll,d=t.auto_scroll_speed,c=t.images_path,o=t.thumbs,r=t.stop_on_click,l=t.stop_after,m=t.canvas_height,u=t.canvas_width,_=t.complete_cycle_slide,h=e(document.createElement("div")).addClass("main_image_container").append(e(document.createElement("div")).addClass("main_image_scroller")).append(e(document.createElement("div")).addClass("description_container")),p=e(document.createElement("div")).addClass("thumbs_list_container");n.append(h).append(p).addClass("slider_container"),n.find(".main_image_scroller").css("height",m+"px").css("width",u+"px"),n.find(".thumbs_list_container").css("height",m+"px");for(var f=0,v=1,g=null,b=o.length,w=e(),C=e(),E=0;b>E;E++){var y=c+o[E];w=w.add(new i(y,E,n)),C=C.add(new a(y,E,n))}n.find(".thumbs_list_container").append(w),n.find(".main_image_scroller").append(C);var k=n.find(".main_image_scroller"),q=n.find(".description_container"),x=k.find("div.main_image"),o=n.find(".thumbs_list_container").find("div"),I=x.eq(0).outerHeight();0==o.length&&n.find(".thumbs_list_container").css("visibility","hidden"),q.hide(),n.find(".thumbs_list_container").find("div").eq(0).trigger("mouseover")}var i=e(this),t=e.extend({auto_scroll:!1,auto_scroll_speed:2500,images_path:"",thumbs:[],stop_on_click:!0,stop_after:0,complete_cycle_slide:300,canvas_height:385,canvas_width:410},t);return this.each(function(){for(var e=[],a=0,s=t.thumbs.length;s>a;a++)e[a]=new Image,e[a].src=t.thumbs[a];new n(t,i)})}}(jQuery);