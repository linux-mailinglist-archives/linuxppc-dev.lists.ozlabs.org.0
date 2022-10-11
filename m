Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C24155FB17E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 13:31:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmtsk4vsKz30Dp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 22:31:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pje89pNA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hpr17gkF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pje89pNA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hpr17gkF;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmtrk71vKz2xnb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 22:31:02 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E12491FA43;
	Tue, 11 Oct 2022 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665487858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f9intEkFK9HBfypvIMvZx+baNZRvrKWRgMWBHPWVDRM=;
	b=pje89pNAb8Obf1D6GqudYMeyYC7i3Tn2twJqqYFHXjCtwaGc6H8ZAmRuABxasJXjmAc0m7
	x3bhN2R/7lNNMTo072je00UcZycP8dLcnINclHLFyVC9/VujNJLGxgkilhT3r0eKVc4ppl
	vH4bF9WWzgrKcVqO7pi6zz2FeD3/THU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665487858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f9intEkFK9HBfypvIMvZx+baNZRvrKWRgMWBHPWVDRM=;
	b=Hpr17gkF3i4GObuJIoliJ4uRSd3tOK/0Oa2Cn4fdATOo6D0ahYsTquFyiJanxmVR5jMbag
	hC2qGnzR8xQaXhDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18BDA13AAC;
	Tue, 11 Oct 2022 11:30:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Q/XSAPJTRWM1NQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 11:30:58 +0000
Message-ID: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
Date: Tue, 11 Oct 2022 13:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z67b2h1GUXzI1QV9zeZbvoeR"
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
--------------z67b2h1GUXzI1QV9zeZbvoeR
Content-Type: multipart/mixed; boundary="------------Oqk3qfWxcaTz9vKaDSlPvR0s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
In-Reply-To: <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>

--------------Oqk3qfWxcaTz9vKaDSlPvR0s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTAuMjIgdW0gMDk6NDYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDkvMjgvMjIgMTI6NTAsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQWxsIERSTSBmb3JtYXRzIGFzc3VtZSBsaXR0bGUt
ZW5kaWFuIGJ5dGUgb3JkZXIuIE9uIGJpZy1lbmRpYW4gc3lzdGVtcywNCj4+IGl0IGlzIGxp
a2VseSB0aGF0IHRoZSBzY2Fub3V0IGJ1ZmZlciBpcyBpbiBiaWcgZW5kaWFuIGFzIHdlbGwu
IFVwZGF0ZQ0KPiANCj4gWW91IHNheSBpdCBpcyBsaWtlbHksIG5vdCBhbHdheXMgdGhlbj8g
RG9lcyBpdCBkZXBlbmQgb24gd2hldGhlciB0aGUgT3Blbg0KPiBGaXJtd2FyZSBpcyBCRSBv
ciBMRSA/DQoNCkl0J3MgdGhlIGVuZGlhbmVzcyBvZiB0aGUgZnJhbWVidWZmZXIuIFRoZXJl
J3MgZ3JhcGhpY3MgaGFyZHdhcmUgdGhhdCANCmNhbiBzd2l0Y2ggYmV0d2VlbiB0aGUgdHdv
IG9yIGV2ZW4gc3VwcG9ydCBib3RoIGF0IHRoZSBzYW1lIHRpbWUgDQooZGVwZW5kaW5nIG9u
IHRoZSBhcGVydHVyZSByYW5nZSkuIEkgZG9uJ3Qga25vdyB0aGUgZXhhY3Qgc2VtYW50aWNz
IHdoZW4gDQplYWNoIGlzIGJlaW5nIHVzZWQsIGJ1dCBJIHN1c3BlY3QgdGhhdCBpdCBjb3Jy
ZXNwb25kcyB0byBob3N0IGVuZGlhbmVzcy4NCg0KPiANCj4gWy4uLl0NCj4gDQo+PiArc3Rh
dGljIGJvb2wgZGlzcGxheV9nZXRfYmlnX2VuZGlhbl9vZihzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX25vZGUpDQo+PiArew0KPj4gKwlib29sIGJp
Z19lbmRpYW47DQo+PiArDQo+PiArI2lmZGVmIF9fQklHX0VORElBTg0KPj4gKwliaWdfZW5k
aWFuID0gdHJ1ZTsNCj4+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShvZl9ub2RlLCAibGl0dGxl
LWVuZGlhbiIsIE5VTEwpKQ0KPj4gKwkJYmlnX2VuZGlhbiA9IGZhbHNlOw0KPj4gKyNlbHNl
DQo+PiArCWJpZ19lbmRpYW4gPSBmYWxzZTsNCj4+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShv
Zl9ub2RlLCAiYmlnLWVuZGlhbiIsIE5VTEwpKQ0KPj4gKwkJYmlnX2VuZGlhbiA9IHRydWU7
DQo+PiArI2VuZGlmDQo+PiArDQo+PiArCXJldHVybiBiaWdfZW5kaWFuOw0KPj4gK30NCj4+
ICsNCj4gDQo+IEFoLCBJIHNlZS4gVGhlIGhldXJpc3RpYyB0aGVuIGlzIHdoZXRoZXIgdGhl
IGJ1aWxkIGlzIEJFIG9yIExFIG9yIGlmIHRoZSBEZXZpY2UNCj4gVHJlZSBoYXMgYW4gZXhw
bGljaXQgbm9kZSBkZWZpbmluZyB0aGUgZW5kaWFuZXNzLiBUaGUgcGF0Y2ggbG9va3MgZ29v
ZCB0byBtZToNCg0KWWVzLiBJIHRvb2sgdGhpcyB0ZXN0IGZyb20gb2ZmYi4NCg0KPiANCj4g
UmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQu
Y29tPg0KPiANCg0KVGhhbmtzDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------Oqk3qfWxcaTz9vKaDSlPvR0s--

--------------z67b2h1GUXzI1QV9zeZbvoeR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNFU/EFAwAAAAAACgkQlh/E3EQov+D/
KA/+OZqaJ1VgN6d2ZIUdhmxm+5T9VeqJfB/cgS7ROyvhdsSn5weMImXdMCqLrJ77FxnI8EC2rCfQ
uzXo7sego4A6ITYy41T1mU7bA6PZ+UI5imZXAh3qhr7QCdsL8UXqbF2tm97xTJi9rHdJAYVba68I
fie7gu+CHXCWTs7UggPUWvvqoyhTO7jGXqWM91GBgKGzq10ZnuvlmXOIrUcCJloZbUjjOlz02CoU
DTJwFvOrPjIcHq6ERW4waEkIxLWbDkibeEsJKEtr1Il05Q4/K5YCTjpNwZJ+jfTBr3BGh5R+zNAs
4+CQI7VX5EkFUDizTV/+Xt3iXWI4L8hMTY4h8odgavvlmCiKaiySdJcffQFxpxZmiao2aHeUDwtg
xqmjpWB8EpKwKZHMiX77CoVQP74oK1YLI3AR3IgGfFido81lRLHeMaoIusfzWvQNV960fDoowsS2
5pv1cG9sheRsW3hGG1A758x/KtNIN4yg8Sp7SbuhP3PSvVnuuQl050LOrS2duqmG21YkSTyaPORs
MmVZkGM0WnyrP+D91o9LruzBehgOnOngdDNPnKQOeZ/29oWscWHa3+KpZ8veemwOITlLPfPy2M3d
4XugQrdfU/2zjAfOgT9dXg1GclsGEB+Fd72+JgFiISCDlvbRLXOyqB3BJbO0+WWG/yUOAycZuInK
ecg=
=GL47
-----END PGP SIGNATURE-----

--------------z67b2h1GUXzI1QV9zeZbvoeR--
