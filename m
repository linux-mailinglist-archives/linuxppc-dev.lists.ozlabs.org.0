Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4A582251
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 10:41:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt6hb1Mpzz3cBw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 18:41:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Jr9OC5g3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zOG+0RGY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Jr9OC5g3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zOG+0RGY;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt6gw6qkjz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 18:41:16 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E6513406F;
	Wed, 27 Jul 2022 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658911273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fcuIAmB+ZhGsoUAlOMtf4nfGHQr0F+mgPVfNYYmgdsU=;
	b=Jr9OC5g3UrNf0LJ59vkO2ypI3V05Yt+7NzTvpvNSSkqkykGMhaJWxxmC3yK938KMRMLXIg
	2DKZwlR7dCqW+q0nsKDGs07g0R8NMXtJRxRe//TptqnefqYQFcQTxJo/NBqcWtVktDMuYh
	wxGJ5kOIZ3v0CXaWbrUZyNioJ0Z3mW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658911273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fcuIAmB+ZhGsoUAlOMtf4nfGHQr0F+mgPVfNYYmgdsU=;
	b=zOG+0RGYkAJ5xG7UeYoc6ylQc5Ph7E/Mru0P249ekCmCfc+MU+lX/V8j028+erowxtzDiD
	9i6+qUNNexcX/uBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45D6013A8E;
	Wed, 27 Jul 2022 08:41:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5RUhECn64GK7NAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 08:41:13 +0000
Message-ID: <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
Date: Wed, 27 Jul 2022 10:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hbfNLtPbcd8lEiIxN0WezuTE"
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hbfNLtPbcd8lEiIxN0WezuTE
Content-Type: multipart/mixed; boundary="------------07rSau700hy6Q0iRDeERoqnm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
In-Reply-To: <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>

--------------07rSau700hy6Q0iRDeERoqnm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMTU6NDkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDcvMjAvMjIgMTY6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gU3VwcG9ydCB0aGUgQ1JUQydzIGNvbG9yLW1hbmFnZW1lbnQgcHJvcGVydHkgYW5kIGlt
cGxlbWVudCBlYWNoIG1vZGVsJ3MNCj4+IHBhbGV0dGUgc3VwcG9ydC4NCj4+DQo+PiBUaGUg
T0YgaGFyZHdhcmUgaGFzIGRpZmZlcmVudCBtZXRob2RzIG9mIHNldHRpbmcgdGhlIHBhbGV0
dGUuIFRoZQ0KPj4gcmVzcGVjdGl2ZSBjb2RlIGhhcyBiZWVuIHRha2VuIGZyb20gZmJkZXYn
cyBvZmZiIGFuZCByZWZhY3RvcmVkIGludG8NCj4+IHBlci1tb2RlbCBkZXZpY2UgZnVuY3Rp
b25zLiBUaGUgZGV2aWNlIGZ1bmN0aW9ucyBpbnRlZ3JhdGUgdGhpcw0KPj4gZnVuY3Rpb25h
bGl0eSBpbnRvIHRoZSBvdmVyYWxsIG1vZGVzZXR0aW5nLg0KPj4NCj4+IEFzIHBhbGV0dGUg
aGFuZGxpbmcgaXMgYSBDUlRDIHByb3BlcnR5IHRoYXQgZGVwZW5kcyBvbiB0aGUgcHJpbWFy
eQ0KPj4gcGxhbmUncyBjb2xvciBmb3JtYXQsIHRoZSBwbGFuZSdzIGF0b21pY19jaGVjayBo
ZWxwZXIgbm93IHVwZGF0ZXMgdGhlDQo+PiBmb3JtYXQgZmllbGQgaW4gb2Zkcm0ncyBjdXN0
b20gQ1JUQyBzdGF0ZS4gVGhlIENSVEMncyBhdG9taWNfZmx1c2gNCj4+IGhlbHBlciB1cGRh
dGVzIHRoZSBwYWxldHRlIGZvciB0aGUgZm9ybWF0IGFzIG5lZWRlZC4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
IC0tLQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2
aWVybUByZWRoYXQuY29tPg0KPiANCj4gWy4uLl0NCj4gDQo+PiArc3RhdGljIHZvaWQgX19p
b21lbSAqb2Zkcm1fbWFjaDY0X2NtYXBfaW9yZW1hcChzdHJ1Y3Qgb2Zkcm1fZGV2aWNlICpv
ZGV2LA0KPj4gKwkJCQkJICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zfbm9kZSwNCj4+
ICsJCQkJCSAgICAgICB1NjQgZmJfYmFzZSkNCj4+ICt7DQo+PiArCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSAmb2Rldi0+ZGV2Ow0KPj4gKwl1NjQgYWRkcmVzczsNCj4+ICsJdm9pZCBf
X2lvbWVtICpjbWFwX2Jhc2U7DQo+PiArDQo+PiArCWFkZHJlc3MgPSBmYl9iYXNlICYgMHhm
ZjAwMDAwMHVsOw0KPj4gKwlhZGRyZXNzICs9IDB4N2ZmMDAwOw0KPj4gKw0KPiANCj4gSXQg
d291bGQgYmUgZ29vZCB0byBrbm93IHdoZXJlIHRoZXNlIGFkZHJlc3NlcyBhcmUgY29taW5n
IGZyb20uIE1heWJlIHNvbWUNCj4gY29uc3RhbnQgbWFjcm9zIG9yIGEgY29tbWVudCA/IFNh
bWUgZm9yIHRoZSBvdGhlciBwbGFjZXMgd2hlcmUgYWRkcmVzc2VzDQo+IGFuZCBvZmZzZXRz
IGFyZSB1c2VkLg0KDQpJIGhhdmUgbm8gaWRlYSB3aGVyZSB0aGVzZSB2YWx1ZXMgY29tZSBm
cm9tLiBJIHRvb2sgdGhlbSBmcm9tIG9mZmIuIEFuZCANCkkgc3VzcGVjdCB0aGF0IHNvbWUg
b2YgdGhlc2UgQ01BUCBoZWxwZXJzIGNvdWxkIGJlIGZ1cnRoZXIgbWVyZ2VkIGlmIA0Kb25s
eSBpdCB3YXMgY2xlYXIgd2hlcmUgdGhlIG51bWJlcnMgY29tZSBmcm9tLiAgQnV0IGFzIGkg
ZG9uJ3QgaGF2ZSB0aGUgDQplcXVpcG1lbnQgZm9yIHRlc3RpbmcsIEkgdG9vayBtb3N0IG9m
IHRoaXMgbGl0ZXJhbGx5IGFzLWlzIGZyb20gb2ZmYi4NCg0KPiANCj4gWy4uLl0NCj4gDQo+
PiAgIHN0YXRpYyBzdHJ1Y3Qgb2Zkcm1fY3J0Y19zdGF0ZSAqdG9fb2Zkcm1fY3J0Y19zdGF0
ZShzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmJhc2UpDQo+PiBAQCAtMzc2LDEwICs3MzUsMTIg
QEAgc3RhdGljIGludCBvZmRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfY2hlY2so
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAgIAkJCQkJCSAgIHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpuZXdfc3RhdGUpDQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUgKm5ld19wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0
ZShuZXdfc3RhdGUsIHBsYW5lKTsNCj4+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqbmV3
X2ZiID0gbmV3X3BsYW5lX3N0YXRlLT5mYjsNCj4+ICAgCXN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqbmV3X2NydGNfc3RhdGU7DQo+PiArCXN0cnVjdCBvZmRybV9jcnRjX3N0YXRlICpuZXdf
b2Zkcm1fY3J0Y19zdGF0ZTsNCj4+ICAgCWludCByZXQ7DQo+PiAgIA0KPj4gLQlpZiAoIW5l
d19wbGFuZV9zdGF0ZS0+ZmIpDQo+PiArCWlmICghbmV3X2ZiKQ0KPj4gICAJCXJldHVybiAw
Ow0KPj4gICANCj4+ICAgCW5ld19jcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2Ny
dGNfc3RhdGUobmV3X3N0YXRlLCBuZXdfcGxhbmVfc3RhdGUtPmNydGMpOw0KPj4gQEAgLTM5
MSw2ICs3NTIsMTQgQEAgc3RhdGljIGludCBvZmRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAgIAlpZiAocmV0KQ0K
Pj4gICAJCXJldHVybiByZXQ7DQo+PiAgIA0KPj4gKwlpZiAoIW5ld19wbGFuZV9zdGF0ZS0+
dmlzaWJsZSkNCj4+ICsJCXJldHVybiAwOw0KPj4gKw0KPj4gKwluZXdfY3J0Y19zdGF0ZSA9
IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKG5ld19zdGF0ZSwgbmV3X3BsYW5lX3N0
YXRlLT5jcnRjKTsNCj4+ICsNCj4+ICsJbmV3X29mZHJtX2NydGNfc3RhdGUgPSB0b19vZmRy
bV9jcnRjX3N0YXRlKG5ld19jcnRjX3N0YXRlKTsNCj4+ICsJbmV3X29mZHJtX2NydGNfc3Rh
dGUtPmZvcm1hdCA9IG5ld19mYi0+Zm9ybWF0Ow0KPj4gKw0KPiANCj4gQWgsIEkgdW5kZXJz
dGFuZCBub3cgd2h5IHlvdSBkaWRuJ3QgZmFjdG9yIG91dCB0aGUgLmF0b21pY19jaGVjayBj
YWxsYmFja3MNCj4gZm9yIHRoZSB0d28gZHJpdmVycyBpbiBhIGZ3ZmIgaGVscGVyLiBNYXli
ZSB5b3UgY2FuIGFsc28gYWRkIGEgY29tbWVudCB0bw0KPiBtZW50aW9uIHRoYXQgdGhpcyB1
cGRhdGVzIHRoZSBmb3JtYXQgc28gdGhlIENSVEMgcGFsZXR0ZSBjYW4gYmUgYXBwbGllZCBp
bg0KPiB0aGUgLmF0b21pY19mbHVzaCBjYWxsYmFjayA/DQoNClllYWgsIHRoaXMgY29kZSBp
cyBvbmUgcmVhc29uIGZvciBub3Qgc2hhcmluZyBhdG9taWNfY2hlY2sgaW4gZndmYi4gIFRo
ZSANCm90aGVyIHJlYXNvbiBpcyB0aGF0IHRoZSBmd2ZiIGNvZGUgaXMgb25seSBhIHdyYXBw
ZXIgYXJvdW5kIHRoZSBhdG9taWMgDQpoZWxwZXJzIHdpdGggbGl0dGxlIGV4dHJhIHZhbHVl
LiAgSSBkaWQgaGF2ZSBzdWNoIGZ3ZmIgaGVscGVycyBhIHNvbWUgDQpwb2ludCwgYnV0IHJl
bW92ZWQgdGhlbS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------07rSau700hy6Q0iRDeERoqnm--

--------------hbfNLtPbcd8lEiIxN0WezuTE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg+igFAwAAAAAACgkQlh/E3EQov+BU
9RAArR4STwj0wWoKEYGH5fW+cciaeJq+3YSZEy2njm7SwFx8uPMAdDj4ysus4nwyPTz3/n/giY+1
mxjJewjKRv+iUMQB2RwmYt6b/5UD0WWmEln2BFVhMDCOHBaRY6da1A9x5THavaQu3xXFeDcexsbi
0ho07AjpooDYtfVyee6bM573tuZR/NWbkot2FKy1040/oOwVDRZs6LGcyK4jHg28hr3buZJHHWnb
+VEYvJhWovL3Y8SNeShzolTagGFoSIeO/r3xOQ8EeRsVZ7K9NjQioh3oaqhpNaFDlusnoBjecthE
I2R9coUTBQ2QTeqsTTu8C/SP+s5Z0FXkbX+aNnz0ThhwmE8DbF9XKV2qwPW2bdJyo0nR0Z2jGu2i
/XLXH430ft8g2r570CX+/uO9FjHbFWnLzKKr3lukrffhDaztcjUddBBnCmY+XBN3dj3oYIJ7agSu
97G/jt91QzWuX6j/sCAKNso9Wt0Sm0b21MsjvzQDVUhohlJ/TicDowej9S/JJSs2dTE/+qZEbjgR
ZvDweZYFMp7zDCU5Y+jb21KzpJy8Uonb10/6IKuFyEY2S6gE1rwjGjcaVvDADKKLDzvK2oV/BeGY
tGI8JAr7JtLVbFu3kqBRC365bvdYEXTkEbZOZvFlG5E3sicktMzfJ8gJzmGNR0ddw480iMwDLCRI
Llw=
=zRL4
-----END PGP SIGNATURE-----

--------------hbfNLtPbcd8lEiIxN0WezuTE--
