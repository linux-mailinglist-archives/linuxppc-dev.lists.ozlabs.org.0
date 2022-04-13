Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A481F4FFD82
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 20:09:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdrGC42Smz3bXg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 04:09:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GHT6yjiL;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PH+Ba93k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GHT6yjiL; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PH+Ba93k; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdrFY1C05z2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 04:09:04 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D27642160D;
 Wed, 13 Apr 2022 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649873341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/xSqIm15UUHBxwwqMSdhCX8Bdk86MUM3KIMa8CaDG6o=;
 b=GHT6yjiL6oakbG0GDeZiJW4qlUvmJSY3TwhqfEgC2Dz+JFlZuoWRlT3A3MopCWeRd6pnFn
 eejn6y3Od93dT/I2iuxaVz4LHIMzGDi4tkCeLw9No26T9CUtBXdwXyVbTjpuarC6kS6TpA
 xuyVE1JGM8fnpxQr1CqtHgFnxPsy6Bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649873341;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/xSqIm15UUHBxwwqMSdhCX8Bdk86MUM3KIMa8CaDG6o=;
 b=PH+Ba93kHiNgLZ5NuQlHIApJMDAoFGIAuXnDb4knpTfa8d0yhISaibOc1O3e4jLw38OgtT
 /y7g66r1j7jCVWCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AA0713AB8;
 Wed, 13 Apr 2022 18:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Dt58IL0RV2ILbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Apr 2022 18:09:01 +0000
Message-ID: <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
Date: Wed, 13 Apr 2022 20:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
 <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
 <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xBs0UgV8K6Ld1iE06EpBr7qw"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, sam@ravnborg.org,
 frowand.list@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xBs0UgV8K6Ld1iE06EpBr7qw
Content-Type: multipart/mixed; boundary="------------XNH9RfXI1PyYuHJ0PkMtgwSX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 frowand.list@gmail.com, deller@gmx.de, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, paulus@samba.org,
 mpe@ellerman.id.au, sam@ravnborg.org, linux@roeck-us.net
Message-ID: <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
 <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
 <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
In-Reply-To: <Ylb0316ABOhOe1Rb@phenom.ffwll.local>

--------------XNH9RfXI1PyYuHJ0PkMtgwSX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDQuMjIgdW0gMTg6MDUgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBXZWQsIEFwciAxMywgMjAyMiBhdCAxMjo1MDo1MFBNICswMjAwLCBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgd3JvdGU6DQo+PiBPbiA0LzEzLzIyIDExOjI0LCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+PiBBIHdvcmthcm91bmQgbWFrZXMgZmJkZXYgaG90LXVucGx1Z2dp
bmcgd29yayBmb3IgZnJhbWVidWZmZXJzIHdpdGhvdXQNCj4+PiBkZXZpY2UuIFRoZSBvbmx5
IHVzZXIgZm9yIHRoaXMgZmVhdHVyZSB3YXMgb2ZmYi4gQXMgZWFjaCBPRiBmcmFtZWJ1ZmZl
cg0KPj4+IG5vdyBoYXMgYW4gYXNzb2NpYXRlZCBwbGF0Zm9ybSBkZXZpY2UsIHRoZSB3b3Jr
YXJvdW5kIGlzIG5vIGxvbmdlcg0KPj4+IG5lZWRlZC4gUmVtb3ZlIGl0LiBFZmZlY3RpdmVs
eSByZXZlcnRzIGNvbW1pdCAwZjUyNTI4OWZmMGQgKCJmYmRldjogRml4DQo+Pj4gdW5yZWdp
c3RlcmluZyBvZiBmcmFtZWJ1ZmZlcnMgd2l0aG91dCBkZXZpY2UiKS4NCj4+Pg0KPj4+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
Pj4+IC0tLQ0KPj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCA5ICst
LS0tLS0tLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4+PiBpbmRl
eCBiYzZlZDc1MGU5MTUuLmJkZDAwZDM4MWJiYyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jDQo+Pj4gQEAgLTE1NzksMTQgKzE1NzksNyBAQCBzdGF0aWMgdm9p
ZCBkb19yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHN0cnVjdCBhcGVydHVyZXNf
c3RydWN0ICphLA0KPj4+ICAgCQkJICogSWYgaXQncyBub3QgYSBwbGF0Zm9ybSBkZXZpY2Us
IGF0IGxlYXN0IHByaW50IGEgd2FybmluZy4gQQ0KPj4+ICAgCQkJICogZml4IHdvdWxkIGFk
ZCBjb2RlIHRvIHJlbW92ZSB0aGUgZGV2aWNlIGZyb20gdGhlIHN5c3RlbS4NCj4+PiAgIAkJ
CSAqLw0KPj4+IC0JCQlpZiAoIWRldmljZSkgew0KPj4+IC0JCQkJLyogVE9ETzogUmVwcmVz
ZW50IGVhY2ggT0YgZnJhbWVidWZmZXIgYXMgaXRzIG93bg0KPj4+IC0JCQkJICogZGV2aWNl
IGluIHRoZSBkZXZpY2UgaGllcmFyY2h5LiBGb3Igbm93LCBvZmZiDQo+Pj4gLQkJCQkgKiBk
b2Vzbid0IGhhdmUgc3VjaCBhIGRldmljZSwgc28gdW5yZWdpc3RlciB0aGUNCj4+PiAtCQkJ
CSAqIGZyYW1lYnVmZmVyIGFzIGJlZm9yZSB3aXRob3V0IHdhcm5pbmcuDQo+Pj4gLQkJCQkg
Ki8NCj4+PiAtCQkJCWRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIocmVnaXN0ZXJlZF9mYltp
XSk7DQo+Pg0KPj4gTWF5YmUgd2UgY291bGQgc3RpbGwga2VlcCB0aGlzIGZvciBhIGNvdXBs
ZSBvZiByZWxlYXNlcyBidXQgd2l0aCBhIGJpZw0KPj4gd2FybmluZyB0aGF0J3Mgbm90IHN1
cHBvcnRlZCBpbiBjYXNlIHRoZXJlIGFyZSBvdXQtb2YtdHJlZSBkcml2ZXJzIG91dA0KPj4g
dGhlcmUgdGhhdCBzdGlsbCBkbyB0aGlzID8NCj4+DQo+PiBPciBhdCBsZWFzdCBhIHdhcm5p
bmcgaWYgdGhlIGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoKSBjYWxsIGlzIHJlbW92ZWQu
DQo+IA0KPiBZZWFoIGR5aW5nIHdoaWxlIGhvbGRpbmcgY29uc29sZV9sb2NrIGlzbid0IGZ1
biwgYW5kIG5vdCBoYXZpbmcgYSBXQVJOX09ODQo+ICsgYmFpbC1vdXQgY29kZSBwcmV0dHkg
bXVjaCBmb3JjZXMgYnVnIHJlcG9ydGVycyB0byBkbyBhIGJpc2VjdCBoZXJlIHRvDQo+IGdp
dmUgdXMgc29tZXRoaW5nIG1vcmUgdGhhbiAibWFjaGluZSBkaWVzIGF0IGJvb3Qgd2l0aCBu
byBtZXNzYWdlcyIuDQo+IA0KPiBJJ2QganVzdCBvdXRyaWdodCBrZWVwIHRoZSBXQVJOX09O
IGhlcmUgZm9yIDEtMiB5ZWFycyBldmVuIHRvIHJlYWxseSBtYWtlDQo+IHN1cmUgd2UgZ290
IGFsbCB0aGUgYnVnIHJlcG9ydHMsIHNpbmNlIG9mdGVuIHRoZXNlIG9sZGVyIG1hY2hpbmVz
IG9ubHkNCj4gdXBkYXRlIG9udG8gTFRTIHJlbGVhc2VzLg0KDQpJZiB0aGF0J3Mgd2hhdCB0
aGUgY29uc2VudCBpcywgSSdsbCBnbyB3aXRoIGl0Lg0KDQpJJ20ganVzdCBub3Qgc3VyZSBp
ZiB3ZSB0YWxrIGFib3V0IHRoZSBzYW1lIHByb2JsZW0uIG9mZmIgZGlkbid0IGhhdmUgYSAN
CnBsYXRmb3JtIGRldmljZSwgc28gd2UgcmVjZW50bHkgYWRkZWQgdGhpcyB3b3JrYXJvdW5k
IHdpdGggJ2lmIA0KKCFkZXZpY2UpJy4gIEFsbCB0aGUgb3RoZXIgZmJkZXYgZHJpdmVycyBo
YXZlIGEgcGxhdGZvcm0gZGV2aWNlOyBhbmQgDQphbnl0aGluZyBlbHNlIHRoYXQgY291bGQg
ZmFpbCBpcyBvdXQtb2YtdHJlZS4gV2UgZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQgDQp0aG9z
ZSBBRkFJSy4NCg0KV2l0aCBvZmZiIGNvbnZlcnRlZCwgd2UgY291bGQgcHJhY3RpY2FsbHkg
cmVtb3ZlIGFsbCBvZiB0aGUgY2hlY2tzIGhlcmUgDQphbmQgY2FsbCBwbGF0Zm9ybV9kZXZp
Y2VfdW5yZWdpc3RlcigpIHVuY29uZGl0aW9uYWxseS4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gQW5kIGl0IG5lZWRzIHRvIGJlIGEgV0FSTl9PTiArIGJhaWwgb3V0IHNp
bmNlIEJVR19PTiBpcyBhcyBiYWQgYXMganVzdA0KPiBvb3BzaW5nLg0KPiAtRGFuaWVsDQo+
IA0KPj4NCj4+IFJlZ2FyZGxlc3Mgb2Ygd2hhdCB5b3UgY2hvc2UgdG8gZG8sIHRoZSBwYXRj
aCBsb29rcyBnb29kIHRvIG1lLg0KPj4NCj4+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+DQo+PiAtLSANCj4+IEJlc3Qg
cmVnYXJkcywNCj4+DQo+PiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMNCj4+IExpbnV4IEVu
Z2luZWVyaW5nDQo+PiBSZWQgSGF0DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------XNH9RfXI1PyYuHJ0PkMtgwSX--

--------------xBs0UgV8K6Ld1iE06EpBr7qw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJXEbwFAwAAAAAACgkQlh/E3EQov+BV
7g//WLLPfVRsElxV0IpWC9EUSq2GXnKoXHDzuulQ5/3zyJLkgpx0aJUX3K3HFc5fxkISlCIYJQcO
WgmT6r0Y7L5PqhHlIhocHuZgKUPRnKOsEfD0xhifyL5Cv7QGFhtdMBb85JEkeU2V3q/MNQ7BrLQV
JaG5dl0xyE+FFcE7jSK0aLsLJTediZdxWZ27fiO3W54lPG7IEgwPKIRuUjMscWudISg/kDZ5h6Ez
uoIdittCO3HUp0SUFoScEfpj2OwODYYfcTHy/B6BZEEI1NccWFPknwLAjyeTRxvpdj5EYthlGyKF
gMOTABOCPWlCoWR7l9F6xtoaZzlEXSAmy7qEOPJzt2Dt2c69bOUJVDEE2nEiSaBZU1L52KfSIxEz
9Dxy1F6isKBl+Vcy35alEJOPKuy9kgn3e05ptmb/kRSiHQulGq3rbyHSz3bovJcx8rHEutimfvpE
IRK+7H+BsJWKkx3ChW2+wm23Wb3E5TqqizM1KR1Gu2VTFCLaiOy1ys7wBZAbd+RwYN0nB8NQlQ5I
gznMTE6+NCugEsle+2KL41TUBKbRjGhFuuA3IkCnPQ0ShJB52QC9XwHqG9ePnYQGRJ2R0S7oCui3
dAnQnR1sV4jvtRoE5Q/h6U71lC28Nzm7JAz+YfZWfwpBdRoFLnLuAJS77yxOgdIaQrG6BASANg3r
EeM=
=QIWW
-----END PGP SIGNATURE-----

--------------xBs0UgV8K6Ld1iE06EpBr7qw--
