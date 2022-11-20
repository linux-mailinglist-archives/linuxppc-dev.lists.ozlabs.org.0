Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F55631595
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 18:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFdKJ46Tvz3dvG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 04:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=prEOr59t;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2lDE5UaY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=prEOr59t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2lDE5UaY;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFdJM6SXgz300l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 04:47:15 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 534F91F38A;
	Sun, 20 Nov 2022 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1668966431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qQlkNKhlh2I+jMc5FdVV/7SJOjtEM9O9Z7NPgfkMBVg=;
	b=prEOr59tiXnLEQkbf/tRGw+dZIKs6ddqY0KpoB1YlRNUmI3NZIE2S8qBxIq/a2pS5/9aoJ
	p95hLhLCXNoJ1yZus47qavY7CJoDRvGLR/zbCBTEQULEldXHBVifQKNs0f6jSdBAgd7RAD
	pKUsjaGnVZglq7WRpPlAFYgV+RpxP4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1668966431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qQlkNKhlh2I+jMc5FdVV/7SJOjtEM9O9Z7NPgfkMBVg=;
	b=2lDE5UaYHzj4m59MtraFqRie9mXVzgkVy39I9K//Xdl643B+mxoLxOqu1XiCQoQxViE/pp
	mpOsS/RYuGW5HSBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24F7F1348D;
	Sun, 20 Nov 2022 17:47:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dpGvBx9oemMVbgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Sun, 20 Nov 2022 17:47:11 +0000
Message-ID: <fc0b2426-d463-028a-68df-26b73e8ba802@suse.de>
Date: Sun, 20 Nov 2022 18:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: build failure in linux-next: offb missing fb helpers
To: Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Michal_Such=c3=a1nek?=
 <msuchanek@suse.de>, Masahiro Yamada <masahiroy@kernel.org>
References: <20221118150351.GV28810@kitsune.suse.cz>
 <b8191c01-4d78-537b-9650-a783e14e5997@infradead.org>
 <CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com>
 <20221119153729.GX28810@kitsune.suse.cz>
 <ff3a1ee2-3439-d79c-aa59-5bccec99bf3e@infradead.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ff3a1ee2-3439-d79c-aa59-5bccec99bf3e@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Hd9vTpvjP00gY5a6j0YzCwNO"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Hd9vTpvjP00gY5a6j0YzCwNO
Content-Type: multipart/mixed; boundary="------------DiVkbqDeZoAT8wL94A68726j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Michal_Such=c3=a1nek?=
 <msuchanek@suse.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-fbdev@vger.kernel.org, linux-kbuild@vger.kernel.org
Message-ID: <fc0b2426-d463-028a-68df-26b73e8ba802@suse.de>
Subject: Re: build failure in linux-next: offb missing fb helpers
References: <20221118150351.GV28810@kitsune.suse.cz>
 <b8191c01-4d78-537b-9650-a783e14e5997@infradead.org>
 <CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com>
 <20221119153729.GX28810@kitsune.suse.cz>
 <ff3a1ee2-3439-d79c-aa59-5bccec99bf3e@infradead.org>
In-Reply-To: <ff3a1ee2-3439-d79c-aa59-5bccec99bf3e@infradead.org>

--------------DiVkbqDeZoAT8wL94A68726j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMTEuMjIgdW0gMTk6MTUgc2NocmllYiBSYW5keSBEdW5sYXA6DQo+IEhp
LA0KPiANCj4gT24gMTEvMTkvMjIgMDc6MzcsIE1pY2hhbCBTdWNow6FuZWsgd3JvdGU6DQo+
PiBIZWxsbywNCj4+DQo+PiBPbiBTYXQsIE5vdiAxOSwgMjAyMiBhdCAxMDoyNzowNFBNICsw
OTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6DQo+Pj4gT24gU2F0LCBOb3YgMTksIDIwMjIg
YXQgMzoyMCBQTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6
DQo+Pj4+DQo+Pj4+IEhpLS0NCj4+Pj4NCj4+Pj4gW2FkZGluZyBNYXNhaGlyby1zYW5dDQo+
Pj4+DQo+Pj4+DQo+Pj4+IE9uIDExLzE4LzIyIDA3OjAzLCBNaWNoYWwgU3VjaMOhbmVrIHdy
b3RlOg0KPj4+Pj4gSGVsbG8sDQo+Pj4+Pg0KPj4+Pj4gSSBhbSBzZWVpbmcgdGhlc2UgZXJy
b3JzOg0KPj4+Pj4NCj4+Pj4+IFsgMzgyNXNdICAgQVIgICAgICBidWlsdC1pbi5hDQo+Pj4+
PiBbIDM4MjdzXSAgIEFSICAgICAgdm1saW51eC5hDQo+Pj4+PiBbIDM4MzVzXSAgIExEICAg
ICAgdm1saW51eC5vDQo+Pj4+PiBbIDM4MzVzXSAgIE9CSkNPUFkgbW9kdWxlcy5idWlsdGlu
Lm1vZGluZm8NCj4+Pj4+IFsgMzgzNXNdICAgR0VOICAgICBtb2R1bGVzLmJ1aWx0aW4NCj4+
Pj4+IFsgMzgzNXNdICAgR0VOICAgICAudm1saW51eC5vYmpzDQo+Pj4+PiBbIDM4NDhzXSAg
IE1PRFBPU1QgTW9kdWxlLnN5bXZlcnMNCj4+Pj4+IFsgMzg0OHNdICAgQ0MgICAgICAudm1s
aW51eC5leHBvcnQubw0KPj4+Pj4gWyAzODQ5c10gICBVUEQgICAgIGluY2x1ZGUvZ2VuZXJh
dGVkL3V0c3ZlcnNpb24uaA0KPj4+Pj4gWyAzODQ5c10gICBDQyAgICAgIGluaXQvdmVyc2lv
bi10aW1lc3RhbXAubw0KPj4+Pj4gWyAzODQ5c10gICBMRCAgICAgIC50bXBfdm1saW51eC5i
dGYNCj4+Pj4+IFsgMzg2NHNdIGxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29mZmIubzooLmRh
dGEucmVsLnJvKzB4NTgpOiB1bmRlZmluZWQNCj4+Pj4+IHJlZmVyZW5jZSB0byBgY2ZiX2Zp
bGxyZWN0Jw0KPj4+Pj4gWyAzODY0c10gbGQ6IGRyaXZlcnMvdmlkZW8vZmJkZXYvb2ZmYi5v
OiguZGF0YS5yZWwucm8rMHg2MCk6IHVuZGVmaW5lZA0KPj4+Pj4gcmVmZXJlbmNlIHRvIGBj
ZmJfY29weWFyZWEnDQo+Pj4+PiBbIDM4NjRzXSBsZDogZHJpdmVycy92aWRlby9mYmRldi9v
ZmZiLm86KC5kYXRhLnJlbC5ybysweDY4KTogdW5kZWZpbmVkDQo+Pj4+PiByZWZlcmVuY2Ug
dG8gYGNmYl9pbWFnZWJsaXQnDQo+Pj4+Pg0KPj4+Pj4gY2ZiX2ZpbGxyZWN0IGlzIHByb3Zp
ZGVkIGJ5IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9jZmJmaWxscmVjdC5jDQo+Pj4+Pg0K
Pj4+Pj4gSXQgaXMgY29tcGlsZWQgd2hlbiBDT05GSUdfRkJfQ0ZCX0ZJTExSRUNUDQo+Pj4+
PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvTWFrZWZpbGU6b2JqLSQoQ09ORklHX0ZCX0NG
Ql9GSUxMUkVDVCkgICs9IGNmYmZpbGxyZWN0Lm8NCj4+Pj4+DQo+Pj4+PiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L01ha2VmaWxlOm9iai0kKENPTkZJR19GQl9PRikgICAgICAgICAgICAgICAr
PSBvZmZiLm8NCj4+Pj4+IGlzIGNvbXBpbGVkIHdoZW4gQ09ORklHX0ZCX09GDQo+Pj4+Pg0K
Pj4+Pj4gSXQgc2VsZWN0cyBDT05GSUdfRkJfQ0ZCX0ZJTExSRUNUDQo+Pj4+PiBjb25maWcg
RkJfT0YNCj4+Pj4+ICAgICAgICAgIGJvb2wgIk9wZW4gRmlybXdhcmUgZnJhbWUgYnVmZmVy
IGRldmljZSBzdXBwb3J0Ig0KPj4+Pj4gICAgICAgICAgZGVwZW5kcyBvbiAoRkIgPSB5KSAm
JiBQUEMgJiYgKCFQUENfUFNFUklFUyB8fCBQQ0kpDQo+Pj4+PiAgICAgICAgICBzZWxlY3Qg
QVBFUlRVUkVfSEVMUEVSUw0KPj4+Pj4gICAgICAgICAgc2VsZWN0IEZCX0NGQl9GSUxMUkVD
VA0KPj4+Pj4gICAgICAgICAgc2VsZWN0IEZCX0NGQl9DT1BZQVJFQQ0KPj4+Pj4gICAgICAg
ICAgc2VsZWN0IEZCX0NGQl9JTUFHRUJMSVQNCj4+Pj4+ICAgICAgICAgIHNlbGVjdCBGQl9N
QUNNT0RFUw0KPj4+Pj4NCj4+Pj4+IFRoZSBjb25maWcgaGFzIEZCX09GIGJ1aWx0LWluIGFu
ZCBGQl9DRkJfRklMTFJFQ1QgbW9kdWxhcg0KPj4+Pj4gY29uZmlnL3BwYzY0bGUvdmFuaWxs
YTpDT05GSUdfRkJfQ0ZCX0ZJTExSRUNUPW0NCj4+Pj4+IGNvbmZpZy9wcGM2NGxlL3Zhbmls
bGE6Q09ORklHX0ZCX0NGQl9DT1BZQVJFQT1tDQo+Pj4+PiBjb25maWcvcHBjNjRsZS92YW5p
bGxhOkNPTkZJR19GQl9DRkJfSU1BR0VCTElUPW0NCj4+Pj4+IGNvbmZpZy9wcGM2NGxlL3Zh
bmlsbGE6Q09ORklHX0ZCX09GPXkNCj4+Pj4+DQo+Pj4+PiBJdCBvbmx5IGRlcGVuZHMgb24g
RkIgd2hpY2ggbXV0IGJlIGJ1aWx0LWluIGZvciBGQl9PRg0KPj4+Pj4gY29uZmlnIEZCX0NG
Ql9GSUxMUkVDVA0KPj4+Pj4gICAgICAgICAgdHJpc3RhdGUNCj4+Pj4+ICAgICAgICAgIGRl
cGVuZHMgb24gRkINCj4+Pj4+DQo+Pj4+PiBJcyBzZWxlY3QgaW4ga2NvbmZpZyBicm9rZW4/
DQo+Pj4+Pg0KPj4+Pj4gQXR0YWNobmlnIHRoZSBjb25maWcgaW4gcXVlc3Rpb24uDQo+Pj4+
DQo+Pj4+IFRoZSBzeW1ib2wgaW5mbyBmcm9tIHhjb25maWcgc2F5czoNCj4+Pj4NCj4+Pj4g
U3ltYm9sOiBGQl9DRkJfRklMTFJFQ1QgWz1tXQ0KPj4+PiBUeXBlIDogdHJpc3RhdGUNCj4+
Pj4gRGVmaW5lZCBhdCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWc6NjkNCj4+Pj4gRGVw
ZW5kcyBvbjogSEFTX0lPTUVNIFs9eV0gJiYgRkIgWz15XQ0KPj4+PiBTZWxlY3RlZCBieSBb
bV06DQo+Pj4+IFtkZWxldGVkXQ0KPj4+PiAtIEZCX09GIFs9eV0gJiYgSEFTX0lPTUVNIFs9
eV0gJiYgRkIgWz15XT15ICYmIFBQQyBbPXldICYmICghUFBDX1BTRVJJRVMgWz15XSB8fCBQ
Q0kgWz15XSkgJiYgIURSTV9PRkRSTSBbPW1dDQo+Pj4+DQo+Pj4+IEkgZG9uJ3Qgc2VlIHdo
eSB0aGUgJ3NlbGVjdCcgZnJvbSAoYm9vbCkgRkJfT0Ygd291bGQgbGVhdmUgRkJfQ0ZCX0ZJ
TExSRUNUIChhbmQgdGhlIG90aGVycykNCj4+Pj4gYXMgPW0gaW5zdGVhZCBvZiA9eS4NCj4+
Pj4NCj4+Pj4gSG9wZWZ1bGx5IE1hc2FoaXJvIGNhbiBzaGVkIHNvbWUgbGlnaHQgb24gdGhp
cy4NCj4+Pj4NCj4+Pj4gLS0NCj4+Pj4gflJhbmR5DQo+Pj4NCj4+Pg0KPj4+IFRoZSByZWFz
b24gaXMgc2hvd24gaW4geW91ciBwYXN0ZSBvZiBoZWxwIG1lc3NhZ2U6DQo+Pj4NCj4+PiAi
JiYgIURSTV9PRkRSTSBbPW1dIiBkb3duZ3JhZGVzIGl0IHRvICJzZWxlY3RlZCBieSBtIg0K
Pj4+DQo+Pj4gVG8gYWlkIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgZm9sbG93aW5nIHdp
bGwgc2VsZWN0DQo+Pj4gRkJfQ0ZCX0ZJTExSRUNUPXkuDQo+Pj4NCj4+Pg0KPiANCj4gVGhh
bmtzIGFnYWluIGZvciB5b3VyIGhlbHAuDQo+IA0KPj4+DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIGIvZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnDQo+Pj4gaW5kZXggNjZmMzZiNjllOGYzLi4yYmNmODYyNzgxOWYgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+Pj4gKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9LY29uZmlnDQo+Pj4gQEAgLTQ1OCw3ICs0NTgsNyBAQCBjb25maWcg
RkJfQVRBUkkNCj4+PiAgIGNvbmZpZyBGQl9PRg0KPj4+ICAgICAgICAgIGJvb2wgIk9wZW4g
RmlybXdhcmUgZnJhbWUgYnVmZmVyIGRldmljZSBzdXBwb3J0Ig0KPj4+ICAgICAgICAgIGRl
cGVuZHMgb24gKEZCID0geSkgJiYgUFBDICYmICghUFBDX1BTRVJJRVMgfHwgUENJKQ0KPj4+
IC0gICAgICAgZGVwZW5kcyBvbiAhRFJNX09GRFJNDQo+Pj4gKyAgICAgICBkZXBlbmRzIG9u
IERSTV9PRkRSTSAhPSB5DQo+Pj4gICAgICAgICAgc2VsZWN0IEFQRVJUVVJFX0hFTFBFUlMN
Cj4+PiAgICAgICAgICBzZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+Pj4gICAgICAgICAgc2Vs
ZWN0IEZCX0NGQl9DT1BZQVJFQQ0KPj4NCj4+IFRoYW5rcyBmb3IgY2xhcmlmaWNhdGlvbi4N
Cj4+DQo+PiBUaGlzIGNoYW5nZSBmaXhlc3MgdGhlIGNvbmZpZyBmb3IgbWUuDQo+IA0KPiAN
Cj4gVGhvbWFzLCBpcyB0aGlzIGNoYW5nZSB0byBEUk1fT0ZEUk0gdW5kZXIgRkJfT0YgYWNj
ZXB0YWJsZSB0byB5b3U/DQoNClN1cmUsIHRoYW5rcyBmb3IgaGVscGluZy4NCg0KVGhlIG9u
bHkgcmVhc29uIGZvciBhZGRpbmcgdGhpcyBLY29uZmlnIHJ1bGUgaXMgdGhhdCBpdCBkb2Vz
bid0IG1ha2UgDQptdWNoIHNlbnNlIHRvIGhhdmUgb2ZmYiBhbmQgb2Zkcm0gZW5hYmxlZCBh
dCB0aGUgc2FtZSB0aW1lLiBCVFcgd2UgaGF2ZSANCmEgc2ltaWxhciBydWxlIGZvciBzaW1w
bGVmYi9zaW1wbGVkcm0sIHdoaWNoIG5ldmVyIG1hZGUgYW55IHByb2JsZW1zLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+PiBPciwgcGVyaGFwcyAiZGVwZW5kcyBv
biBEUk1fT0ZEUk0gPSBuIg0KPj4+IEkgZG8gbm90IGtub3cgdGhlIGludGVudGlvbiBvZiB0
aGlzIGRlcGVuZGVuY3kuDQo+Pj4NCj4+PiBSZWNvbW1lbmRhdGlvbiBpcyB0byB1c2UgImRl
cGVuZHMgb24iIGluc3RlYWQgb2YgInNlbGVjdCIgdGhvdWdoLg0KPj4+DQo+Pj4NCj4+Pg0K
Pj4+IEJUVywgdGhpcyBpcyBzaW1pbGFyIHRvIHdoYXQgeW91IGFza2VkIGJlZm9yZS4NCj4+
Pg0KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtidWlsZC9lMWE2MjI4ZC0x
MzQxLTYyNjQtZDk3YS1lMmJkNTJhNjVjODJAaW5mcmFkZWFkLm9yZy8NCj4+Pg0KPj4+DQo+
Pj4gSSB0cmllZCB0byBmaXggaXQgaW4gdGhlIHBhc3QsIGJ1dCB0aGUgaXNzdWUgd2FzIG5v
dCBhcyBzaGFsbG93IGFzIEkNCj4+PiBoYWQgZXhwZWN0ZWQuDQo+Pj4gSSBkaWQgbm90IGdl
dCBhcm91bmQgdG8gcmV2aXNpdGluZyB0aGlzIHRvcGljLg0KPj4+DQo+Pj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWtidWlsZC9wYXRjaC8xNTQzMjE2
OTY5LTIyMjctMS1naXQtc2VuZC1lbWFpbC15YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNv
bS8NCj4+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------DiVkbqDeZoAT8wL94A68726j--

--------------Hd9vTpvjP00gY5a6j0YzCwNO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN6aBwFAwAAAAAACgkQlh/E3EQov+Bw
hhAArl4AVotTy386F5ntfFIvxY+AlvG68dHXSpnrxqel4zUBbU3rGQy7a2heXeZHjx+Wv02ylAN2
tZ1qAcb1v3Iezrg9goYmRKE+fAZgpRKOggEu/sumDW2NuWutZrKIedLKYe3XSGCFsWR7ee43KoRn
bGWPr1olHTs4Ny5ecYNHNMW21OS71ONwE/LQc+4mllopk/rlFJeHLucSjH04dG0Z0Th40/CwaBJv
bU59iPCut6peMdWusXQHeUkcGjdiPR5uTzZRp66OGEYiYY3e91z//KlbAKCNstN18cH6fhMJCKOQ
8aswW5Ba0/0W1vqX8DfTHXqNTGT9fUrCNpqkh5HQH7YFUKWYa7ucjgHBkqvDvzY/HJHk5t26Yq6D
jlDznX74cGMASKCArQsqGUH1yglkK9y0bdllP2i+7kJEslfJwW0GWz2PQzB0AN+Suqj112SN8yUu
1RZ1/cXSYp6wuye3BXDW3+WEegyq4UqfteFaKdwifmLESCJ9XZ+alOJUL0lIg4oe5ANPuKMqx++f
IbYbJq3sZI0Jrn/gamD9cwjNs3UhTI1uMvrqCkuqy75iBmnTiVrYkegn4dNKDJ70dqv7EhdfXkTq
w3K/7wrxiLpb5V1JmorP0p54OnMROKGRCq7LxzvZZks0HFOopVcDYRvdqH/0mwHBtjFMVwWgWGnL
McA=
=UxHj
-----END PGP SIGNATURE-----

--------------Hd9vTpvjP00gY5a6j0YzCwNO--
