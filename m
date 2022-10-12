Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D47605FC4A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 14:01:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnWTg5dJzz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 23:01:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lRalhBr5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AtVKGWDq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lRalhBr5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AtVKGWDq;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnWSh14BHz2yPN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 23:00:51 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E7F61F381;
	Wed, 12 Oct 2022 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665576047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5W/juWcNn6zVLX+Qf9rEIXxhn3m6mPG7JS8jJgRODc=;
	b=lRalhBr56Jj52rOKz98js3alFZh+V+5Y0XCkfQXVgdmaYV9zUr8meHdDJJJBT0wq3AwYiN
	bfPvr0L/vhu7mmV5pQ+6uKzC4MCm3s5EB8/WD4YTSC6VsTTeptVjIXhwJcopCqYr2u9WMA
	U6DRbYK2RJPMKIPXdbo6D4rBFMiCQyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665576047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5W/juWcNn6zVLX+Qf9rEIXxhn3m6mPG7JS8jJgRODc=;
	b=AtVKGWDqZI9wSvbq+BKOuGm2Obf0ILm30XlKOE4YHahuKRnoBgE133VSHiQVnBBg3vUJHL
	Q+KQVSt78xMZpDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B19E13A5C;
	Wed, 12 Oct 2022 12:00:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EwIeHW6sRmPLSQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 12 Oct 2022 12:00:46 +0000
Message-ID: <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
Date: Wed, 12 Oct 2022 14:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Maxime Ripard <maxime@cerno.tech>,
 sam@ravnborg.org, Michal Suchanek <msuchanek@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 Paul Mackerras <paulus@samba.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g0hx0H82lsMIhtkbCA86eqA6"
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
--------------g0hx0H82lsMIhtkbCA86eqA6
Content-Type: multipart/mixed; boundary="------------zmbyAkcgyF60LwO1cjbNgFYf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Maxime Ripard <maxime@cerno.tech>,
 sam@ravnborg.org, Michal Suchanek <msuchanek@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 Paul Mackerras <paulus@samba.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
In-Reply-To: <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>

--------------zmbyAkcgyF60LwO1cjbNgFYf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTAuMjIgdW0gMTA6Mzggc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBXZWQsIE9jdCAxMiwgMjAyMiwgYXQgMTA6MjcgQU0sIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gQW0gMTIuMTAuMjIgdW0gMDk6NDQgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0K
Pj4+IE9uIFdlZCwgT2N0IDEyLCAyMDIyLCBhdCA5OjQwIEFNLCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToNCj4+Pj4gQW0gMTIuMTAuMjIgdW0gMDk6MTcgc2NocmllYiBBcm5kIEJlcmdt
YW5uOg0KPj4+Pj4gT24gV2VkLCBPY3QgMTIsIDIwMjIsIGF0IDg6NDYgQU0sIFRob21hcyBa
aW1tZXJtYW5uIHdyb3RlOg0KPj4+Pg0KPj4+Pj4gRG9lcyBxZW11IG1hcmsgdGhlIGRldmlj
ZSBoYXMgaGF2aW5nIGEgcGFydGljdWxhciBlbmRpYW5lc3MgdGhlbiwgb3INCj4+Pj4+IGRv
ZXMgaXQgc3dpdGNoIHRoZSBsYXlvdXQgb2YgdGhlIGZyYW1lYnVmZmVyIHRvIG1hdGNoIHdo
YXQgdGhlIENQVQ0KPj4+Pj4gZG9lcz8NCj4+Pj4NCj4+Pj4gVGhlIGxhdHRlci4gT24gbmVp
dGhlciBhcmNoaXRlY3R1cmUgZG9lcyBxZW11IGV4cG9zZSB0aGlzIGZsYWcuIFRoZQ0KPj4+
PiBkZWZhdWx0IGVuZGlhbmVzcyBjb3JyZXNwb25kcyB0byB0aGUgaG9zdC4NCj4+Pg0KPj4+
ICJob3N0IiBhcyBpbiB0aGUgbWFjaGluZSB0aGF0IHFlbXUgcnVucyBvbiwgb3IgdGhlIG1h
Y2hpbmUgdGhhdCBpcw0KPj4+IGJlaW5nIGVtdWxhdGVkPyBJIHN1cHBvc2UgaXQgd291bGQg
YmUgYnJva2VuIGVpdGhlciB3YXksIGJ1dCBpbiB0aGUNCj4+PiBsYXR0ZXIgY2FzZSwgd2Ug
Y291bGQgZ2V0IGF3YXkgd2l0aCBkZXRlY3RpbmcgdGhhdCB0aGUgbWFjaGluZSBpcw0KPj4+
IHJ1bm5pbmcgdW5kZXIgcWVtdS4NCj4+DQo+PiBTb3JyeSwgbXkgbWlzdGFrZS4gSSBtZWFu
dCAiZ3Vlc3QiOiB0aGUgZW5kaWFuZXNzIG9mIHRoZSBmcmFtZWJ1ZmZlcg0KPj4gY29ycmVz
cG9uZHMgdG8gdGhlIGVuZGlhbmVzcyBvZiB0aGUgZW11bGF0ZWQgbWFjaGluZS4gIEdpdmVu
IHRoYXQgbWFueQ0KPj4gZ3JhcGhpY3MgY2FyZHMgc3VwcG9ydCBMRSBhbmQgQkUgbW9kZXMs
IEkgYXNzdW1lIHRoYXQgdGhpcyBiZWhhdmlvcg0KPj4gbWltaWNzIHJlYWwtaGFyZHdhcmUg
c3lzdGVtcy4NCj4gDQo+IE5vdCByZWFsbHk6IFdoaWxlIHRoZSBoYXJkd2FyZSBtYXkgYmUg
YWJsZSB0byBzd2l0Y2ggYmV0d2Vlbg0KPiB0aGUgbW9kZXMsIHNvbWV0aGluZyBoYXMgdG8g
YWN0aXZlbHkgc2V0IHNvbWUgaGFyZHdhcmUgcmVnaXN0ZXJzIHVwDQo+IHRoYXQgd2F5LCBi
dXQgdGhlIG9mZmIvb2Zkcm0gZHJpdmVyIGhhcyBubyBpbnRlcmZhY2UgZm9yIGludGVyYWN0
aW5nDQo+IHdpdGggdGhhdCByZWdpc3RlciwgYW5kIHRoZSBib290bG9hZGVyIG9yIGZpcm13
YXJlIGNvZGUgdGhhdCBrbm93cw0KPiBhYm91dCB0aGUgcmVnaXN0ZXIgaGFzIG5vIGluZm9y
bWF0aW9uIGFib3V0IHdoYXQga2VybmVsIGl0IHdpbGwNCj4gZXZlbnR1YWxseSBydW4uIFRo
aXMgaXMgYSBiaXQgYXJjaGl0ZWN0dXJlIGRlcGVuZGVudCwgYXMgZS5nLiBvbg0KPiBNSVBT
LCBhIGJpLWVuZGlhbiBoYXJkd2FyZSBwbGF0Zm9ybSBoYXMgdG8gcnVuIGEgYm9vdGxvYWRl
ciB3aXRoIHRoZQ0KPiBzYW1lIGVuZGlhbm5lc3MgYXMgdGhlIGtlcm5lbCwgYnV0IG9uIGFy
bSBhbmQgcG93ZXJwYyB0aGUgYm9vdGxvYWRlcg0KPiBpcyB1c3VhbGx5IGZpeGVkIGFuZCB0
aGUga2VybmVsIHN3aXRjaGVzIHRvIGl0cyBjb25maWd1cmVkIGVuZGlhbm5lc3MNCj4gaW4g
dGhlIGZpcnN0IGZldyBpbnN0cnVjdGlvbnMgYWZ0ZXIgaXQgZ2V0cyBlbnRlcmVkLg0KDQpD
b3VsZCB3ZWxsIGJlLiBCdXQgb2Zkcm0gaW50ZW50cyB0byByZXBsYWNlIG9mZmIgYW5kIHRo
aXMgdGVzdCBoYXMgDQp3b3JrZWQgd2VsbCBpbiBvZmZiIGZvciBhbG1vc3QgMTUgeXJzLiBJ
ZiB0aGVyZSBhcmUgYnVnIHJlcG9ydHMsIEknbSANCmhhcHB5IHRvIHRha2UgcGF0Y2hlcywg
YnV0IHVudGlsIHRoZW4gSSBzZWUgbm8gcmVhc29uIHRvIGNoYW5nZSBpdC4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gICAgICAgQXJuZA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------zmbyAkcgyF60LwO1cjbNgFYf--

--------------g0hx0H82lsMIhtkbCA86eqA6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNGrG4FAwAAAAAACgkQlh/E3EQov+Cl
RA//SPRS/MkRORfotptVf3tzTvjMiTTf3rj3uaf9SBBMMlfWhx/C/LfLlyX/DIRLQeQ66hlDFe46
9XPMtxZhSHVZKbLwJ8iC7ru0WqsgXv03kRtFAvdBiWAD7Y8CoGA35IJCDIJPAIaO5nBPKDMeLv7j
WcvGm/K4Q+iv0JiK7ERvAtFFnl+PH2AwBOlX6vFiSl6cwGOZaD25FO7G56GtoXyL9jL0ihSNIoTY
UKiST57h3NvHPJOEz73eTi5uz9U9QiJUX5vMG+0P9j3ZbFEAH7hqwI68RKYZpHdymIQxkGBBSvYe
0rPQRz7+1CnHQ9UNT2ZXoZMDuVHMVxxnUZrZFDrnLUo3L1j3kDBfqI0btQpPLc0JQd9b3lU89zh5
8ktwvxpfS3m3b3CHXVci0R5hlPgATWc2ETX8pZlY6fmPIzMBTcSGX44bJqJErPsrvMC1vj7p5joM
oX4vb+G0j9rrrO6Y+A86kh2QxtrKgZ1Bz1/AKM/UxifDXVSTAiN2/7PHilx/ceFeTw43IRLcxLcj
vl9sfxzSHjj890xdLIKxJWqePChzcimTH40/i2CawkobgIID40YimusJSDkJFTiW5FFuW7ej1vBO
uFWEgcy6VZNEmuAAs70jXwYwgfJfhE4p0v+1yC4MFvmq9m8/H08HeYtuAbpZYFQ8ExvTwLDLBaou
Xo8=
=bhvs
-----END PGP SIGNATURE-----

--------------g0hx0H82lsMIhtkbCA86eqA6--
