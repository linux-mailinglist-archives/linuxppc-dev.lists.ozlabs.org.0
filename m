Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CEC5FC764
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 16:32:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnZqF0GCHz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 01:32:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=J00tJCRO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SGNLjf0j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=J00tJCRO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SGNLjf0j;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnZpG3fm8z3bhg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 01:31:18 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9810C1F45F;
	Wed, 12 Oct 2022 14:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665585075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmI2glnzNa+rLfgcRlQLUn9RCIkJH3QGtB0EhuzOQ64=;
	b=J00tJCRODQL1W4mCFm6NVWfPlO3uKKuSXAz32OjMOVpAqhFwVAz9MuPuG9HNckgQRGUArs
	q5rSIzbUpYHbYOCiRNfjiGpbcYUqb8wdnu1v2Pez2sXO4uUfpdc0vWnqExNp3IiOQh3Jld
	FLL8YN7x7uI7C3DpZGRxKGxh362XaSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665585075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmI2glnzNa+rLfgcRlQLUn9RCIkJH3QGtB0EhuzOQ64=;
	b=SGNLjf0jcnxyGKqpvb/IwcehziZCySQLebc3+29ybC0WmI6ew5k4NKfHuon7FpLe5831nh
	wyzMbVByrND8GFBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31C6413A5C;
	Wed, 12 Oct 2022 14:31:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ARAbC7PPRmPdIQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 12 Oct 2022 14:31:15 +0000
Message-ID: <a81e1acf-64dd-f69d-d97f-4a1af534e8e6@suse.de>
Date: Wed, 12 Oct 2022 16:31:14 +0200
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
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gaUEgT2KtnHXOqRK1eItgq27"
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
--------------gaUEgT2KtnHXOqRK1eItgq27
Content-Type: multipart/mixed; boundary="------------A5i4gih9Y4tk4061dxDdMyg7";
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
Message-ID: <a81e1acf-64dd-f69d-d97f-4a1af534e8e6@suse.de>
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
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
In-Reply-To: <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>

--------------A5i4gih9Y4tk4061dxDdMyg7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTAuMjIgdW0gMTU6MTIgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBXZWQsIE9jdCAxMiwgMjAyMiwgYXQgMjowMCBQTSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+Pg0KPj4gQ291bGQgd2VsbCBiZS4gQnV0IG9mZHJtIGludGVudHMgdG8gcmVwbGFj
ZSBvZmZiIGFuZCB0aGlzIHRlc3QgaGFzDQo+PiB3b3JrZWQgd2VsbCBpbiBvZmZiIGZvciBh
bG1vc3QgMTUgeXJzLiBJZiB0aGVyZSBhcmUgYnVnIHJlcG9ydHMsIEknbQ0KPj4gaGFwcHkg
dG8gdGFrZSBwYXRjaGVzLCBidXQgdW50aWwgdGhlbiBJIHNlZSBubyByZWFzb24gdG8gY2hh
bmdlIGl0Lg0KPiANCj4gSSB3b3VsZG4ndCBjaGFuZ2UgdGhlIGNvZGUgaW4gb2ZmYiB1bmxl
c3MgYSB1c2VyIHJlcG9ydHMgYSBidWcsDQo+IGJ1dCBJIGRvbid0IHNlZSBhIHBvaW50IGlu
IGFkZGluZyB0aGUgc2FtZSBtaXN0YWtlIHRvIG9mZHJtIGlmIHdlDQo+IGtub3cgaXQgY2Fu
J3Qgd29yayBvbiByZWFsIGhhcmR3YXJlLg0KDQpBcyBJIHNhaWQsIHRoaXMgaGFzIHdvcmtl
ZCB3aXRoIG9mZmIgYW5kIGFwcGFyZW50bHkgb24gcmVhbCBoYXJkd2FyZS4gDQpGb3IgYWxs
IEkga25vdywgQVRJIGhhcmR3YXJlIChiZWZvcmUgaXQgYmVjYW1lIEFNRCkgd2FzIHVzZWQg
aW4gUFBDIA0KTWFjaW50b3NocyBhbmQgYXNzdW1lZCBiaWctZW5kaWFuIGFjY2VzcyBvbiB0
aG9zZSBtYWNoaW5lcy4NCg0KPiBJIHRyaWVkIHRvIGZpbmQgb3V0IHdoZXJlIHRoaXMgaXMg
Y29uZmlndXJlZCBpbiBxZW11LCBidXQgaXQgc2VlbXMNCj4gdG8gZGVwZW5kIG9uIHRoZSBm
cmFtZWJ1ZmZlciBiYWNrZW5kIHRoZXJlOiBtb3N0IGFyZSBhbHdheXMgbGl0dGxlLWVuZGlh
biwNCj4gYXRpL2JvY2hzL3ZnYS1wY2kvdmlydGlvLXZnYSBhcmUgY29uZmlndXJhYmxlIGZy
b20gdGhlIGd1ZXN0IHRocm91Z2gNCj4gc29tZSByZWdpc3RlciBzZXR0aW5nLCBidXQgdmdh
LmMgcGlja3MgYSBkZWZhdWx0IGZyb20gdGhlDQo+ICdUQVJHRVRfV09SRFNfQklHRU5ESUFO
JyBtYWNybywgd2hpY2ggSSB0aGluayBpcyBzZXQgZGlmZmVyZW50bHkNCj4gYmV0d2VlbiBx
ZW11LXN5c3RlbS1wcGM2NGxlIGFuZCBxZW11LXN5c3RlbS1wcGM2NC4NCj4gDQo+IElmIHlv
dSBhcmUgdXNpbmcgdGhlIGZyYW1lYnVmZmVyIGNvZGUgZnJvbSB2Z2EuYywgSSB3b3VsZCBn
dWVzcyB0aGF0DQo+IHRoYXQgeW91IGNhbiBydW4gYSBiaWctZW5kaWFuIGtlcm5lbCB3aXRo
IHFlbXUtc3lzdGVtLXBwYzY0LA0KPiBvciBhIGxpdHRsZS1lbmRpYW4ga2VybmVsIHdpdGgg
cWVtdS1zeXN0ZW0tcHBjNjRsZSBhbmQgZ2V0IHRoZQ0KPiBjb3JyZWN0IGNvbG9ycywgd2hp
bGUgcnVubmluZyBhIGxpdHRsZS1lbmRpYW4ga2VybmVsIHdpdGgNCj4gcWVtdS1zeXN0ZW0t
cHBjNjQgYW5kIHZnYS5jLCBvciB1c2luZyBhIGRpZmZlcmVudCBmcmFtZWJ1ZmZlcg0KPiBl
bXVsYXRpb24gb24gYSBiaWctZW5kaWFuIGtlcm5lbCB3b3VsZCBnaXZlIHlvdSB0aGUgd3Jv
bmcgY29sb3JzLg0KDQpJZiBxZW11IGRvZXNuJ3QgZ2l2ZSB1cyB0aGUgbmVjZXNzYXJ5IERU
IHByb3BlcnR5LCBpdCdzIGEgcWVtdSBidWcuIEluIA0KaW4gdGhlIGFic2VuY2Ugb2YgdGhl
IHByb3BlcnR5LCBwaWNraW5nIHRoZSBrZXJuZWwncyBlbmRpYW5lc3MgaXMgYSANCnNlbnNp
YmxlIGNob2ljZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gV2hpY2ggY29t
YmluYXRpb25zIGRpZCB5b3UgYWN0dWFsbHkgdGVzdD8NCj4gDQo+ICAgICAgIEFybmQNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------A5i4gih9Y4tk4061dxDdMyg7--

--------------gaUEgT2KtnHXOqRK1eItgq27
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNGz7IFAwAAAAAACgkQlh/E3EQov+DE
rRAAsFjxzeOC/m16aMr6Hhcte91odTXSPvmjZW1AC6kA1WJtgShy3r5Q39Z4b9y8+QctQOcfuzWn
fAUu6S3ykpLVgjBmREvuRorxHeqSNDo4cyctOBZbq6V57debmHastoVUBIsy7nppBhaEunqWX2K9
X3+dbpHlOooU6BtWePcYHbziPTpPanL1vFsy8xCO8BBwz4GbOc/u89HEn7jBqGFP6a3gT7dfljJV
Dnn2zwbEm0ejMRjANaoWRgmUl71YQnFGkAOJaSSRoC8JOdP0n2pQyxpXLpE37fT+iGGiiDtPne6R
8gogOX2RQwk/gUOSsj+xodvl8EkZU3UPxkUd6mpXqDh3fX0bMejApfxhOCm7W14o6QkGTFZtQSXE
hGnhSIUIjrFrqOjVUnYtrfnsZ9VImqGbacmyWpfsIgVIFDb5o0PwQrZm/CcEVQEcRfF1WpLEfcOV
KODahtgis9IGSBeLLzcP6J9tjVUlUWlL1B5+zmnXkOeTw/ghsRawur2rcxh1jAVWrr79DrNxupnB
p7j6jKErLnV+Gc/ccDWESrFLaR34fpzxCl++UiJUBdhWT64H/Aiy9FEBlLcAkQe7oj+F+6IcAetT
nIZNOyf4mq+dmIjHoHlyKHdE4CPRp62Z81D9AcqDPPgeIf53hVtpdTdXw79MwzzhdEtZ0PhgNuIi
uso=
=28Ag
-----END PGP SIGNATURE-----

--------------gaUEgT2KtnHXOqRK1eItgq27--
