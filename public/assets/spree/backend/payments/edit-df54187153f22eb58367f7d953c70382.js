(function(){var t={}.hasOwnProperty,n=function(n,o){function r(){this.constructor=n}for(var e in o)t.call(o,e)&&(n[e]=o[e]);return r.prototype=o.prototype,n.prototype=new r,n.__super__=o.prototype,n};jQuery(function(t){var o,r,e,i,u;return u=t("#payments").data("order-id"),r=function(){function n(n){this.url=Spree.url(""+Spree.routes.payments_api(u)+"/"+n+".json"),this.json=t.getJSON(this.url.toString(),function(t){return function(n){return t.data=n}}(this))}return n.prototype.if_pending=function(t){return this.json.done(function(n){return"pending"===n.state?t():void 0})},n.prototype.update=function(n){var o;return o=t.ajax({type:"PUT",url:this.url.toString(),data:{payment:n}}),o.done(function(t){return function(n){return t.data=n}}(this)),o.fail(function(){var n;return n=t.parseJSON(o.responseText),show_flash("error",n.error)})},n.prototype.amount=function(){return this.data.amount},n.prototype.display_amount=function(){return this.data.display_amount},n}(),e=function(){function n(t,n){this.$el=t,this.payment=n,this.render()}return n.prototype.render=function(){return this.add_action_button()},n.prototype.show=function(){return this.remove_buttons(),new i(this.$el,this.payment)},n.prototype.edit=function(){return this.remove_buttons(),new o(this.$el,this.payment)},n.prototype.add_action_button=function(){return this.$actions().prepend(this.$new_button(this.action))},n.prototype.remove_buttons=function(){return this.$buttons().remove()},n.prototype.$new_button=function(n){return t("<a><span class='icon icon-"+n+"'></span></a>").attr({"class":"payment-action-"+n+" btn btn-default btn-sm icon-link no-text with-tip",title:Spree.translations[n]}).data({action:n}).one({click:function(t){return t.preventDefault()},mousedown:function(){return t(this).data("clicked",!0)},mouseup:function(t){return function(){return t[n]()}}(this)})},n.prototype.$buttons=function(){return this.$actions().find(".payment-action-"+this.action+", .payment-action-cancel")},n.prototype.$actions=function(){return this.$el.find(".actions")},n.prototype.$amount=function(){return this.$el.find("td.amount")},n}(),i=function(o){function r(){return r.__super__.constructor.apply(this,arguments)}return n(r,o),r.prototype.action="edit",r.prototype.render=function(){return r.__super__.render.apply(this,arguments),this.set_actions_display(),this.show_actions(),this.show_amount()},r.prototype.set_actions_display=function(){var t;return t=this.$actions().width(),this.$actions().width(t).css("text-align","left")},r.prototype.show_actions=function(){return this.$actions().find("a").show()},r.prototype.show_amount=function(){var n;return n=t("<span />").html(this.payment.display_amount()).one("click",function(t){return function(){return t.edit().$input().focus()}}(this)),this.$amount().html(n)},r}(e),o=function(o){function r(){return r.__super__.constructor.apply(this,arguments)}return n(r,o),r.prototype.action="save",r.prototype.render=function(){return r.__super__.render.apply(this,arguments),this.hide_actions(),this.edit_amount(),this.add_cancel_button()},r.prototype.add_cancel_button=function(){return this.$actions().append(this.$new_button("cancel"))},r.prototype.hide_actions=function(){return this.$actions().find("a").not(this.$buttons()).hide()},r.prototype.edit_amount=function(){var t;return t=this.$amount(),t.html(this.$new_input(t.find("span").width()))},r.prototype.save=function(){return this.payment.update({amount:this.$input().val()}).done(function(t){return function(){return t.show()}}(this))},r.prototype.cancel=r.prototype.show,r.prototype.$new_input=function(n){var o;return o=this.constructor.normalize_amount(this.payment.display_amount()),t("<input />").prop({id:"amount",value:o}).width(n).one({blur:function(n){return function(){var o;return o=n.$buttons().filter(function(){return t(this).data("clicked")}).length,o?void 0:n.save()}}(this)}).css({"text-align":"right"})},r.prototype.$input=function(){return this.$amount().find("input")},r.normalize_amount=function(t){var n;return n=Spree.translations.currency_separator,t.replace(RegExp("[^\\d"+n+"]","g"),"")},r}(e),t(".admin tr[data-hook=payments_row]").each(function(){var n,o;return n=t(this),o=new r(n.prop("id").match(/\d+$/)),o.if_pending(function(){return new i(n,o)})})})}).call(this);