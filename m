Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83679582192
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 09:54:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt5dQ3grmz3cfG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 17:54:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pU6sPxbU;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RBBwUkUc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pU6sPxbU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RBBwUkUc;
	dkim-atps=neutral
X-Greylist: delayed 142 seconds by postgrey-1.36 at boromir; Wed, 27 Jul 2022 17:53:28 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt5cm6r93z3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 17:53:28 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE20D2048D;
	Wed, 27 Jul 2022 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658908405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TPRrum7C0GADnunmZQXrzRvNUeJ3NKuqlmtzcR5HzTs=;
	b=pU6sPxbUQ/2W9sDOeMnc4NGqmLO4+dFk68FC7v720uKPuRevbh330aTOrBG9zeZIbne2s+
	XsppHHs6IJ2SEOdBDTf+HGjXOKe/06bLMTCQXyq1UOzEhT2XMTyWr1SSz37CEVdwqgyxhA
	CDyasmKp39aKBbwbdKtDoLJQel9EQko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658908405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TPRrum7C0GADnunmZQXrzRvNUeJ3NKuqlmtzcR5HzTs=;
	b=RBBwUkUcNDjqldV7IW/lWiZP9JL2ostffV73g/ujkQGu9cZkuHoM0KgqCmHE4+AGXWOzh9
	jP5I3dXq6IlYRDDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9EA0813AD7;
	Wed, 27 Jul 2022 07:53:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SYzdJfXu4GJTHQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 07:53:25 +0000
Message-ID: <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
Date: Wed, 27 Jul 2022 09:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iYBsinc0RYF8EfTtX1kKdCtN"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, DRI Development <dri-devel@lists.freedesktop.org>, Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iYBsinc0RYF8EfTtX1kKdCtN
Content-Type: multipart/mixed; boundary="------------sILgBXHDfeWHFmPh013FeHLZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Michal Suchanek <msuchanek@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
In-Reply-To: <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>

--------------sILgBXHDfeWHFmPh013FeHLZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjIgdW0gMTc6MTMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIEdlZXJ0LA0KPiANCj4gT24gNy8yMS8yMiAxNjo0NiwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOg0KPj4gSGkgVGhvbWFzLA0KPj4NCj4+IE9uIFdlZCwgSnVs
IDIwLCAyMDIyIGF0IDQ6MjcgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+IHdyb3RlOg0KPj4+IENvbXB1dGUgdGhlIGZyYW1lYnVmZmVyJ3Mgc2NhbmxpbmUg
c3RyaWRlIGxlbmd0aCBpZiBub3QgZ2l2ZW4gYnkNCj4+PiB0aGUgc2ltcGxlZmIgZGF0YS4N
Cj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPj4NCj4+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4+DQo+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4+IEBAIC03NDMsNiArNzQzLDkgQEAgc3Rh
dGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShz
dHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPj4+ICAgICAgICAgICAgICAgICAgZHJtX2Vycihk
ZXYsICJubyBzaW1wbGVmYiBjb25maWd1cmF0aW9uIGZvdW5kXG4iKTsNCj4+PiAgICAgICAg
ICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOw0KPj4+ICAgICAgICAgIH0NCj4+
PiArICAgICAgIGlmICghc3RyaWRlKQ0KPj4+ICsgICAgICAgICAgICAgICBzdHJpZGUgPSBm
b3JtYXQtPmNwcFswXSAqIHdpZHRoOw0KPj4NCj4+IERJVl9ST1VORF9VUChkcm1fZm9ybWF0
X2luZm9fYnBwKGZvcm1hdCkgKiB3aWR0aCwgOCkNCj4+DQo+IA0KPiBJIHRoaW5rIHlvdSBt
ZWFudCBoZXJlOg0KPiANCj4gRElWX1JPVU5EX1VQKGRybV9mb3JtYXRfaW5mb19icHAoZm9y
bWF0LCAwKSAqIHdpZHRoLCA4KSA/DQoNCkkgZ3Vlc3MsIHRoYXQncyB0aGUgcmlnaHQgZnVu
Y3Rpb24uIE15IG9yaWdpbmFsIGNvZGUgaXMgY29ycmVjdCwgYnV0IGNwcCANCmlzIGFsc28g
ZGVwcmVjYXRlZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIA0KPiBXaXRoIHRo
YXQgY2hhbmdlLA0KPiANCj4gQWNrZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8
amF2aWVybUByZWRoYXQuY29tPg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------sILgBXHDfeWHFmPh013FeHLZ--

--------------iYBsinc0RYF8EfTtX1kKdCtN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg7vUFAwAAAAAACgkQlh/E3EQov+B7
Xg//T0xNBZU6P9TF+4Y2HwkbevwCwqvWS0nvoQxbn4Kr7CnOOhNsUlelFf0RkUN+xBUlX8RY7E+H
x+dF5VLQ3jHSNWYywwSYY6ZGdKQlG5LWdwjXA3PYsqr3xG0H0TBNZmMEacIrC0dVqLh2PB4/qFSy
g/x207IlDYoxAZkQOeI2XkBiFDfY2nd92ZXyXMfivyCq88s8Wwl3KFGY6RNew14TePXTi49FLMJ1
awFMEJGZqs6R1ExKokwd/ruP3asvucwPQcGpvHu4n0SnhAIP5frJRc4zR2EzYPx4ddFW1VSCe3PM
2TwXNyT3mk5TkXn4nUBq39NK6BHM/n0j8JEiNfT2JTX7J9zIqIuEFSpfG65ralbmpkuAj6gSFSM/
6uaoipvFjQfTgaPCct+4zG89uzcC8+Z48WJ/qxZE0CQfQYbsRaizcU4N8ubL5F0K3zBTol6oxF1I
0rKmRpE4So5NubwZwPXclh2YoQLajBQsvePAUPrFWjQenvECgznPTYVcXSpFbY2dwMBQw+gnWFqp
puaBiH2IHfnDAr1IIsbUq4L5KCWabt1TjUiqgLSF/NBO5sCWen30mVOvhNwfHxgOG8XBZ+S3NzZi
e8ZF7M7Eu2uWrvdm84H8vhvrq/MQQ9ThWCI9e/hHsGCTzqUjWOsNwvGCiKIfAkUQ92Xyd81KNbXm
O+Q=
=Q2G6
-----END PGP SIGNATURE-----

--------------iYBsinc0RYF8EfTtX1kKdCtN--
