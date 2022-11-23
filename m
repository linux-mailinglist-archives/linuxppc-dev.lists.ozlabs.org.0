Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A06359B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 11:24:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHHKx15Fjz2xJF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 21:24:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pj9S7pyi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3gUZSFFR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pj9S7pyi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3gUZSFFR;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHHJy0Ghzz3bYF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 21:23:29 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BC13220D7;
	Wed, 23 Nov 2022 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1669199006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iMFkicO649ESbufr5miqGFwIbAYKV+R2iqhQ4uq5YtY=;
	b=pj9S7pyimH/pRmux0UOzrUIWddrsJPaD1lTPszNUVML2YcKqn6pb7kSawvHB1g1qH67R99
	Wxf1/JDP6AaNkIYasAA728n3kQL4Fd/9+B1XFj5c8jV00SDn1xdqG1uULJkolX3lainCh3
	XSjdP3PurQ6V9TFvY/e755uFOoUypG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1669199006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iMFkicO649ESbufr5miqGFwIbAYKV+R2iqhQ4uq5YtY=;
	b=3gUZSFFRLBbxSYVBHXZxksPtLcgQF93Sy3eWWoBQ62Um0Mt/8Y/Z6SB9R84svXY1Iqy5Xb
	NVsXbGl84KJiG4Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C9C1813AE7;
	Wed, 23 Nov 2022 10:23:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4iw9MJ30fWNuKgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 10:23:25 +0000
Message-ID: <9782676d-618b-9c86-c2c5-3f36248e59e6@suse.de>
Date: Wed, 23 Nov 2022 11:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
References: <20221123031605.16680-1-rdunlap@infradead.org>
 <4b10b87d-f255-4839-8700-858d98ffb801@app.fastmail.com>
 <25c22370-b67a-33a6-f1e6-abf70760d866@infradead.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <25c22370-b67a-33a6-f1e6-abf70760d866@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------35RstSOOJMxeHvujC4iaaxp3"
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
Cc: linux-fbdev@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------35RstSOOJMxeHvujC4iaaxp3
Content-Type: multipart/mixed; boundary="------------0SH6CvWlumnvZwehx0lcdcni";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 Helge Deller <deller@gmx.de>
Message-ID: <9782676d-618b-9c86-c2c5-3f36248e59e6@suse.de>
Subject: Re: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
References: <20221123031605.16680-1-rdunlap@infradead.org>
 <4b10b87d-f255-4839-8700-858d98ffb801@app.fastmail.com>
 <25c22370-b67a-33a6-f1e6-abf70760d866@infradead.org>
In-Reply-To: <25c22370-b67a-33a6-f1e6-abf70760d866@infradead.org>

--------------0SH6CvWlumnvZwehx0lcdcni
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMTEuMjIgdW0gMTE6MDIgc2NocmllYiBSYW5keSBEdW5sYXA6DQo+IEhp
IEFybmQsDQo+IA0KPiBPbiAxMS8yMy8yMiAwMTowOCwgQXJuZCBCZXJnbWFubiB3cm90ZToN
Cj4+IE9uIFdlZCwgTm92IDIzLCAyMDIyLCBhdCAwNDoxNiwgUmFuZHkgRHVubGFwIHdyb3Rl
Og0KPj4+IEZpeCBidWlsZCB3aGVuIENPTkZJR19GQl9PRj15IGFuZCBDT05GSUdfRFJNX09G
RFJNPW0uDQo+Pj4gV2hlbiB0aGUgbGF0dGVyIHN5bWJvbCBpcyA9bSwga2NvbmZpZyBkb3du
Z3JhZGVzIChsaW1pdHMpIHRoZSAnc2VsZWN0J3MNCj4+PiB1bmRlciBGQl9PRiB0byBtb2R1
bGFyICg9bSkuIFRoaXMgY2F1c2VzIHVuZGVmaW5lZCBzeW1ib2wgcmVmZXJlbmNlczoNCj4+
Pg0KPj4+IHBvd2VycGM2NC1saW51eC1sZDogZHJpdmVycy92aWRlby9mYmRldi9vZmZiLm86
KC5kYXRhLnJlbC5ybysweDU4KToNCj4+PiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjZmJf
ZmlsbHJlY3QnDQo+Pj4gcG93ZXJwYzY0LWxpbnV4LWxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L29mZmIubzooLmRhdGEucmVsLnJvKzB4NjApOg0KPj4+IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYGNmYl9jb3B5YXJlYScNCj4+PiBwb3dlcnBjNjQtbGludXgtbGQ6IGRyaXZlcnMvdmlk
ZW8vZmJkZXYvb2ZmYi5vOiguZGF0YS5yZWwucm8rMHg2OCk6DQo+Pj4gdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgY2ZiX2ltYWdlYmxpdCcNCj4+Pg0KPj4+IEZpeCB0aGlzIGJ5IGFsbG93
aW5nIEZCX09GIGFueSB0aW1lIHRoYXQgRFJNX09GRFJNICE9IHkgc28gdGhhdCB0aGUNCj4+
PiBzZWxlY3RlZCBGQl9DRkJfKiBzeW1ib2xzIHdpbGwgYmVjb21lID15IGluc3RlYWQgb2Yg
PW0uDQo+Pj4NCj4+PiBJbiB0cmlzdGF0ZSBsb2dpYyAoZm9yIERSTV9PRkRSTSksIHRoaXMg
Y2hhbmdlcyB0aGUgZGVwZW5kZW5jeSBmcm9tDQo+Pj4gICAgICAhRFJNX09GRFJNCT09IDIg
LSAxID09IDEgPT4gbW9kdWxhciBvbmx5IChvciBkaXNhYmxlZCkNCj4+PiB0byAoYm9vbGVh
bikNCj4+PiAgICAgIERSTV9PRkRSTSAhPSB5ID09IHksIGFsbG93aW5nIHRoZSAnc2VsZWN0
J3MgdG8gY2F1c2UgdGhlDQo+Pj4gRkJfQ0ZCXyogc3ltYm9scyB0byA9eSBpbnN0ZWFkIG9m
ID1tLg0KPj4+DQo+Pg0KPj4gSXMgaXQgYWN0dWFsbHkgYSB1c2VmdWwgY29uZmlndXJhdGlv
biB0byBoYXZlIE9GRFJNPW0gYW5kDQo+PiBGQl9PRj15IHRob3VnaD8gSSB3b3VsZCBleHBl
Y3QgaW4gdGhhdCBjYXNlIHRoYXQgdGhlIE9GRFJNDQo+PiBkcml2ZXIgbmV2ZXIgYmluZHMg
dG8gYSBkZXZpY2UgYmVjYXVzZSBpdCdzIGFscmVhZHkgb3duZWQNCj4+IGJ5IEZCX09GLg0K
Pj4NCj4+PiBkaWZmIC0tIGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIGIvZHJpdmVy
cy92aWRlby9mYmRldi9LY29uZmlnDQo+Pj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnDQo+Pj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+Pj4gQEAg
LTQ1NSw3ICs0NTUsNyBAQCBjb25maWcgRkJfQVRBUkkNCj4+PiAgIGNvbmZpZyBGQl9PRg0K
Pj4+ICAgCWJvb2wgIk9wZW4gRmlybXdhcmUgZnJhbWUgYnVmZmVyIGRldmljZSBzdXBwb3J0
Ig0KPj4+ICAgCWRlcGVuZHMgb24gKEZCID0geSkgJiYgUFBDICYmICghUFBDX1BTRVJJRVMg
fHwgUENJKQ0KPj4+IC0JZGVwZW5kcyBvbiAhRFJNX09GRFJNDQo+Pj4gKwlkZXBlbmRzIG9u
IERSTV9PRkRSTSAhPSB5DQo+Pj4gICAJc2VsZWN0IEFQRVJUVVJFX0hFTFBFUlMNCj4+DQo+
PiBJIHdvdWxkIGluc3RlYWQgbWFrZSB0aGlzICdkZXBlbmRzIG9uIERSTV9PRkRSTT1uJywg
d2hpY2gNCj4+IGNvbXBsZXRlbHkgZWxpbWluYXRlcyBjb25maWdzIHRoYXQgaGF2ZSBib3Ro
IGRyaXZlciBlbmFibGVkLg0KPiANCj4gWWVwLCB0aGF0IHdvcmtzIGZvciBtZS4gVGhhbmtz
Lg0KPiANCj4gVGhvbWFzLCBNaWNoYWwsIGFyZSB5b3UgT0sgd2l0aCB0aGF0IGNoYW5nZT8N
Cg0KWWVzLg0KDQo+IA0KPj4gQSBuaWNlciBjaGFuZ2Ugd291bGQgYmUgdG8gbWFrZSBGQl9P
RiBhIHRyaXN0YXRlIHN5bWJvbCwNCj4+IHdoaWNoIG1ha2VzIGl0IHBvc3NpYmxlIHRvIGxv
YWQgb25lIG9mIHRoZSB0d28gbW9kdWxlcyBpZg0KPj4gYm90aCBhcmUgZW5hYmxlZCA9bSwg
d2hpbGUgb25seSBhbGxvd2luZyBvbmUgb2YgdGhlbSB0bw0KPj4gYmUgPXkgaWYgdGhlIG90
aGVyIGlzIGNvbXBsZXRlbHkgZGlzYWJsZWQuIEl0IGxvb2tzIGxpa2UNCj4+IG9mZmIgd2Fz
IG9yaWdpbmFsbHkgd3JpdHRlbiB0byBiZSB1c2FibGUgYXMgYSBsb2FkYWJsZSBtb2R1bGUs
DQo+PiBidXQgS2NvbmZpZyBoYXMgcHJldmVudGVkIHRoaXMgc2luY2UgYXQgbGVhc3QgdGhl
IHN0YXJ0IG9mDQo+PiB0aGUgZ2l0IGhpc3RvcnkuDQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------0SH6CvWlumnvZwehx0lcdcni--

--------------35RstSOOJMxeHvujC4iaaxp3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN99J0FAwAAAAAACgkQlh/E3EQov+A5
fRAAnEqxt5dz+tVOfIu0EQp6/awGT481QrPGhjimlY11IoV40BXNrDx3SZjzFEdV/PapZih3oSb/
QzNM4S7H3RHiGmynDGQqGX4iBeqSwdjfX7MlMzgpt3eqTKVByvtFN8Fz8tzgACs+WfPI1DH3whP5
+ZWaJWO8McF6cAbzkIDXNHmT3TBwomu19gChrkGfk25wtGU16MjJZoMedLJ9RPcZ6/hp+wcGhRID
4grtOGsBf2ar4w8gZrU8DTbvdpD+FnSQNFJkhPyFXz9EEC0V8vE2iI+73qWRmNp5WCQzaIUthzBz
6jyY7WyeYcLZ12LNZxmQS7R6wSp8TyIdUoVMyCOAkdcdoGLwjI8QCKht1Qnae2+6AM7mjOflJE55
y9ZmMH8yKmERBEEu7X3Fi5YyleHfqGGQcgDEGVNsQjwAcI1O56CMjuVo7fRT0KZxH/L2TDYFyzgy
mY2GDjeGCxYka7xGp0RJ4cM/igBDadJz/ew3sDQBghnKnC5KZupoWhvW29gS5eI2hNuVol+nfZ3m
7JJ4qqT6yfGoSl35oro1M5i4+ux/OfdU1rScrbkd2YoHmx8GQTnUOsBwvG+mi5lvDabQshyYaSX4
xGfX6kqs1rs9u+sapbAf8mcvzNncup2NEUIbtOhYNCPSd3uX/ZQ8si1AJd/jp+zFCmwo5bCfNWjT
2bk=
=3z9p
-----END PGP SIGNATURE-----

--------------35RstSOOJMxeHvujC4iaaxp3--
