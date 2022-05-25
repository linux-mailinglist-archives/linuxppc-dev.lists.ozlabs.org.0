Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB05341AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 18:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7cQd1rpCz3bmH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 02:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MX8frmUl;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5fWOf6Ai;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MX8frmUl; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5fWOf6Ai; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7cPx0S8Vz2ywc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 02:45:41 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01037219CE;
 Wed, 25 May 2022 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653497138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVVB/+rH7yH1+0rwj0OM70hRIVE4xzwxsIpx/Lgni84=;
 b=MX8frmUlflpONPcKVm4nTKLRjt95JwTAWtcjkfR2fCz72hadAHUtDYFNI9aAr87aQu+lEW
 AFxTG4JQmCo2h0SLXavXVm4yw8L83Tfgp6Q+PbzAn6yoibMC/awwHcGRB5jZQN5Y5vxH/p
 BPBW15qH8BOPMqhDTbpdlu5coQ4r8nA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653497138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yVVB/+rH7yH1+0rwj0OM70hRIVE4xzwxsIpx/Lgni84=;
 b=5fWOf6AiMfwo2ey/BVunxRKQJIOx7z5r9+hYPLoVkm8KVjQf3jAyL41reQ/LPh5E7CCBPE
 pt/uZpYlLUGGrcCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E07713487;
 Wed, 25 May 2022 16:45:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6ds4JTFdjmLVLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 25 May 2022 16:45:37 +0000
Message-ID: <a077bc25-03b3-f8bd-0138-a175a2864943@suse.de>
Date: Wed, 25 May 2022 18:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <20220518185156.GJ163591@kunlun.suse.cz>
 <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
 <29a8201d-3c0c-eeed-81af-92b351880702@suse.de>
 <615c93392bee43e92f0400cfa51957cd955091d3.camel@kernel.crashing.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <615c93392bee43e92f0400cfa51957cd955091d3.camel@kernel.crashing.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0YGknDDjrOG6ZMdYagea9Moa"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0YGknDDjrOG6ZMdYagea9Moa
Content-Type: multipart/mixed; boundary="------------SiUHlc8g3ad90M5hlc9fQZal";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <a077bc25-03b3-f8bd-0138-a175a2864943@suse.de>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <20220518185156.GJ163591@kunlun.suse.cz>
 <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
 <29a8201d-3c0c-eeed-81af-92b351880702@suse.de>
 <615c93392bee43e92f0400cfa51957cd955091d3.camel@kernel.crashing.org>
In-Reply-To: <615c93392bee43e92f0400cfa51957cd955091d3.camel@kernel.crashing.org>

--------------SiUHlc8g3ad90M5hlc9fQZal
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDUuMjIgdW0gMDQ6NDkgc2NocmllYiBCZW5qYW1pbiBIZXJyZW5zY2ht
aWR0Og0KPiBPbiBUaHUsIDIwMjItMDUtMTkgYXQgMDk6MjcgKzAyMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPiANCj4+IHRvIGJ1aWxkIHdpdGhvdXQgUENJIHRvIHNlZSB3aGF0
IGhhcHBlbnMuDQo+IA0KPiBJZiB5b3UgYnJpbmcgYW55IG9mIHRoZSAiaGV1cmlzdGljIiBh
bmQgcGFsZXR0ZSBzdXBwb3J0IGNvZGUgaW4sIHlvdQ0KPiBuZWVkIFBDSS4gSSBkb24ndCBz
ZWUgYW55IHJlYXNvbiB0byB0YWtlIGl0IG91dC4NCj4gDQo+PiBUaG9zZSBvbGQgTWFjcyB1
c2UgQm9vdFgsIHJpZ2h0PyBCb290WCBpcyBub3Qgc3VwcG9ydGVkIEFUTSwgYXMgSSBkb24n
dA0KPj4gaGF2ZSB0aGUgSFcgdG8gdGVzdC4gSXMgdGhlcmUgYW4gZW11bGF0b3IgZm9yIGl0
Pw0KPiANCj4gSXQgaXNuJ3QgPyBXaGVuIGRpZCBpdCBicmVhayA/IDotKQ0KDQpJIG1lYW50
IHRoYXQgQm9vdFggaXMgbm90ICh5ZXQpIHN1cHBvcnRlZCBieSB0aGlzIG5ldyBkcml2ZXIu
IFRoZSBMaW51eCANCmtlcm5lbCBvdmVyYWxsIHByb2JhYmx5IHN1cHBvcnRzIGl0Lg0KDQoN
Cj4gDQo+PiBJZiBhbnlvbmUgd2hhdCdzIHRvIG1ha2UgcGF0Y2hlcyBmb3IgQm9vdFgsIEkn
ZCBiZSBoYXBweSB0byBhZGQgdGhlbS4NCj4+IFRoZSBvZmZiIGRyaXZlciBhbHNvIHN1cHBv
cnRzIGEgbnVtYmVyIG9mIHNwZWNpYWwgY2FzZXMgZm9yIHBhbGV0dGUNCj4+IGhhbmRsaW5n
LiBUaGF0IG1pZ2h0IGJlIG5lY2Vzc2FyeSBmb3Igb2Zkcm0gYXMgd2VsbC4NCj4gDQo+IFRo
ZSBwYWxldHRlIGhhbmRsaW5nIGlzIHVzZWZ1bCB3aGVuIHVzaW5nIGEgcmVhbCBPcGVuIEZp
cm13YXJlDQo+IGltcGxlbWVudGF0aW9uIHdoaWNoIHRlbmRzIHRvIGJvb3QgaW4gOC1iaXQg
bW9kZSwgc28gd2l0aG91dCBwYWxldHRlDQo+IHRoaW5ncyB3aWxsIGxvb2sgLi4uIGJhZC4N
Cj4gDQo+IEl0J3Mgbm90IG5lY2Vzc2FyeSB3aGVuIHVzaW5nIDE2LzMyIGJwcCBmcmFtZWJ1
ZmZlcnMgd2hpY2ggaXMgdHlwaWNhbGx5DQo+IC4uLiB3aGF0IEJvb3RYIHByb3ZpZGVzIDot
KQ0KDQpNYXliZSB0aGUgb2RkIGNvbG9yIGZvcm1hdHMgY2FuIGJlIHRlc3RlZCB2aWEgcWVt
dS4NCg0KSSBkb24ndCBtaW5kIGFkZGluZyBEUk0gc3VwcG9ydCBmb3IgQm9vdFggZGlzcGxh
eXMsIGJ1dCBnZXR0aW5nIHRoZSANCm5lY2Vzc2FyeSB0ZXN0IEhXIHdpdGggYSBzdWl0YWJs
ZSBMaW51eCBzZWVtcyB0byBiZSBsYWJvcmlvdXMuIFdvdWxkIGEgDQpHNCBQb3dlcmJvb2sg
d29yaz8NCg0KQmVzdCByZWdhcmQNClRob21hcw0KDQo+IA0KPiBDaGVlcnMsDQo+IEJlbi4N
Cj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+PiBHcntvZXRqZSxlZXRp
bmd9cywNCj4+Pg0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4+Pg0K
Pj4+IC0tDQo+Pj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPj4+DQo+Pj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dA0KPj4+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCj4+
DQo+PiAtLSANCj4+IFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------SiUHlc8g3ad90M5hlc9fQZal--

--------------0YGknDDjrOG6ZMdYagea9Moa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKOXTAFAwAAAAAACgkQlh/E3EQov+Dg
YhAAjdFxfDzzhYj85qmHzjGzOZlSJUOZoijRh4THFo/6wlXHtUl9oX1Z1NF8pPvcR1IbaNxDE+Mi
gW/R5wRYKvlQ+QXcYq83uaAHRNk1PG6A30+XVzp/01OeIVnOydddX7eX1KVYuUEP9PLQxqJ2ObKi
vn8Rrgi3XSMM/qya31hzs8L0BBS1H2DvafvnxfB4H31Cawi7sxChDiWnwAEPHQsxsCJz/m9CuHwL
vM+IxX6lRw4bCfBf24S5M6DK8dqksP9OA9OXi5hYAu2Xl+bI4GzKX8tPoMxy/aBGLX+4nSuRwHks
jPl1pN8w7fg4mtcQgrf5AwHFId+GA6Eyv5PHJY5srshdsl/9M6RttvbUdByOmLQupAJcPRzF9n7Q
vL+2j/EPUEWByMqsehyDgFfHp9PdKstBFQoOlk3rgpw+/toPxb9AFmVbD8Ngo+S2PZN8tbzaWluc
pMgqKc5xFGeD/QTuS12EHFmvGbSCfDz53wK5JYZwYdGnkOeW3tenUWanQhIcPOagXzsBnVIFI331
L4pOq8OoHLogR/Ylm4bGQY5dVaKahX1IqNdmvDOdPmCXFz0cvNwd4sXAzSk4Zz30sDrLUq3vjgUF
CGJwXhvNMgcvvRVmmh/V58c/7Kgimb401GTltX1KNjgu/alJUmlOSez7JrMU3wbq/OsakcAUD6GV
JRk=
=cPHh
-----END PGP SIGNATURE-----

--------------0YGknDDjrOG6ZMdYagea9Moa--
