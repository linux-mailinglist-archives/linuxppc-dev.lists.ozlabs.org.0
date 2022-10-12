Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC35E5FC0E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 08:47:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnNVh55yjz3bjj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 17:47:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1AJ0yEmI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=izWIyL+k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1AJ0yEmI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=izWIyL+k;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnNTj44s2z2xf4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 17:46:17 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 965FF2252C;
	Wed, 12 Oct 2022 06:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665557168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z23jc5a3Sq4ugnENrm8thRFqd6dG7f5FS4wDzPqyovE=;
	b=1AJ0yEmIwMCUPB0Z4cg2EotyX3kH6OUKgzf06TuYE2yBCeYXM2O6flFgOwFPF5G5wNNSmm
	doYXHh+7ajhM90VE3rGDsoEQ3MzaowQjict1SEhl1MWs8b1YOTTNLaQuwhKBMrbRONAq5A
	WfApW/zBzchIxlaxHv3+kcR7QvNFcWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665557168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z23jc5a3Sq4ugnENrm8thRFqd6dG7f5FS4wDzPqyovE=;
	b=izWIyL+kajMnNCkOAjXz7IW3irkb/rPCV+cSqmvR9rAzUKxsRdcf5w0auuZL0xX9sYO9Ul
	U4mwRCth4GDQEqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37C0713A5C;
	Wed, 12 Oct 2022 06:46:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6UxRDLBiRmMGLQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 12 Oct 2022 06:46:08 +0000
Message-ID: <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
Date: Wed, 12 Oct 2022 08:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, maxime@cerno.tech, sam@ravnborg.org,
 Michal Suchanek <msuchanek@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B8laPcs2O1N5259HlwVPqlqJ"
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
--------------B8laPcs2O1N5259HlwVPqlqJ
Content-Type: multipart/mixed; boundary="------------QIh76Ae0ySmHbeVgLDQvt1w0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, maxime@cerno.tech, sam@ravnborg.org,
 Michal Suchanek <msuchanek@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
In-Reply-To: <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>

--------------QIh76Ae0ySmHbeVgLDQvt1w0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTAuMjIgdW0gMjI6MDYgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBUdWUsIE9jdCAxMSwgMjAyMiwgYXQgMTozMCBQTSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+PiBBbSAxMS4xMC4yMiB1bSAwOTo0NiBzY2hyaWViIEphdmllciBNYXJ0aW5leiBD
YW5pbGxhczoNCj4+Pj4gK3N0YXRpYyBib29sIGRpc3BsYXlfZ2V0X2JpZ19lbmRpYW5fb2Yo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2RlKQ0K
Pj4+PiArew0KPj4+PiArCWJvb2wgYmlnX2VuZGlhbjsNCj4+Pj4gKw0KPj4+PiArI2lmZGVm
IF9fQklHX0VORElBTg0KPj4+PiArCWJpZ19lbmRpYW4gPSB0cnVlOw0KPj4+PiArCWlmIChv
Zl9nZXRfcHJvcGVydHkob2Zfbm9kZSwgImxpdHRsZS1lbmRpYW4iLCBOVUxMKSkNCj4+Pj4g
KwkJYmlnX2VuZGlhbiA9IGZhbHNlOw0KPj4+PiArI2Vsc2UNCj4+Pj4gKwliaWdfZW5kaWFu
ID0gZmFsc2U7DQo+Pj4+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShvZl9ub2RlLCAiYmlnLWVu
ZGlhbiIsIE5VTEwpKQ0KPj4+PiArCQliaWdfZW5kaWFuID0gdHJ1ZTsNCj4+Pj4gKyNlbmRp
Zg0KPj4+PiArDQo+Pj4+ICsJcmV0dXJuIGJpZ19lbmRpYW47DQo+Pj4+ICt9DQo+Pj4+ICsN
Cj4+Pg0KPj4+IEFoLCBJIHNlZS4gVGhlIGhldXJpc3RpYyB0aGVuIGlzIHdoZXRoZXIgdGhl
IGJ1aWxkIGlzIEJFIG9yIExFIG9yIGlmIHRoZSBEZXZpY2UNCj4+PiBUcmVlIGhhcyBhbiBl
eHBsaWNpdCBub2RlIGRlZmluaW5nIHRoZSBlbmRpYW5lc3MuIFRoZSBwYXRjaCBsb29rcyBn
b29kIHRvIG1lOg0KPj4NCj4+IFllcy4gSSB0b29rIHRoaXMgdGVzdCBmcm9tIG9mZmIuDQo+
IA0KPiBIYXMgdGhlIGRyaXZlciBiZWVuIHRlc3RlZCB3aXRoIGxpdHRsZS1lbmRpYW4ga2Vy
bmVscyB0aG91Z2g/IFdoaWxlDQo+IHBwYzMyIGtlcm5lbHMgYXJlIGFsd2F5cyBCRSwgeW91
IGNhbiBidWlsZCBrZXJuZWxzIGFzIGVpdGhlciBiaWctZW5kaWFuDQo+IG9yIGxpdHRsZS1l
bmRpYW4gZm9yIG1vc3QgKG1vZGVybikgcG93ZXJwYzY0IGFuZCBhcm0vYXJtNjQgaGFyZHdh
cmUsDQo+IGFuZCBJIGRvbid0IHNlZSB3aHkgdGhhdCBzaG91bGQgY2hhbmdlIHRoZSBkZWZh
dWx0cyBvZiB0aGUgZHJpdmVyDQo+IHdoZW4gZGVzY3JpYmluZyB0aGUgc2FtZSBmcmFtZWJ1
ZmZlciBoYXJkd2FyZS4NCg0KWWVzLCBJIHRlc3RlZCB0aGlzIG9uIHFlbXUncyBwcGM2NGxl
IGFuZCBwcGM2NC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gSSBjb3VsZCB1
bmRlcnN0YW5kIGhhdmluZyBhIGRlZmF1bHQgdG8gZS5nLiBiaWctZW5kaWFuIG9uIGFsbCBw
b3dlcnBjIGFuZA0KPiBhIGRlZmF1bHQgZm9yIGxpdHRsZS1lbmRpYW4gb24gYWxsIGFybSwg
YnV0IGhhdmluZyBpdCB0aWVkIHRvIHRoZQ0KPiB3YXkgdGhlIGtlcm5lbCBpcyBidWlsdCBz
ZWVtcyB3cm9uZywgYW5kIGRvZXNuJ3QgbWFrZSBzZW5zZSBpbiBhDQo+IERUIGJpbmRpbmcg
ZWl0aGVyLg0KPiANCj4gICAgICAgIEFybmQNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------QIh76Ae0ySmHbeVgLDQvt1w0--

--------------B8laPcs2O1N5259HlwVPqlqJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNGYq8FAwAAAAAACgkQlh/E3EQov+AS
fw/+Onoj40Vwl1oJ3yZl3U6w37d4FFfR0dOTZzCclf8+PaIsVzMGgq2dtiwMBUvReFDl2jAQAsZn
jGPTaUGxQjYZkYx8IaY78i0116LVKaiQZ9YfYipchieuUDAGnsdseWcUIgkQ7k7slvr7Y97br2at
ZGdv4fKtuCVjOX3N4dDwoUd5SKyOauNo5Lx+tAuPuziTGQGstIS736atsG+2y7lNNqTh/0n37+0d
jOjYE5wtQNraaqh8hKH3oSzPSfWxz5vOI4TpsXBQ+AHegz21inpsFJ42qdak8GajEtd3Y6PeueE0
vFSEdQaKOZcMC7Pa2ULS3MR2GhoH3qIccYPMFYXSeOgBeoMAdiS1n8KI5ykQ+XyC51ZBuJ1+9HW7
Ypqnp/gSVWSHnlHzNASxBtSd0IPVold6B12YfybV0XltHu2uLGq7xukpi2hl0wsUgzVwOdimVuC3
39QaJItvWSN06fzKFoiHUdlbOVcX/MHKgTvQqZXguV+/UdgsmAYOWMhS2pfXsHGbf5rQEth1Vy+8
WGlKjMuCOVaL+ncCHXNCOzfYa0Tr7NNMrtv6192/W9yQgSgh9QDoFmtVnyT3Uga8bcIGbjoEtTlp
eRSrBgYjlLuPNIaVvoiDxrhz9JUJuOlR+Dh+4sh1/EqQESykcNsG/xCeMgwK/m3nXAjcX1/nqJwU
wDU=
=aAOf
-----END PGP SIGNATURE-----

--------------B8laPcs2O1N5259HlwVPqlqJ--
