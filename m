Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BFD74D86C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 16:05:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cI9OrvsJ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RuFoYeRF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R05PF4sGvz3btq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 00:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cI9OrvsJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RuFoYeRF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R05NM3Whvz3bXf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 00:04:35 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0331121AD8;
	Mon, 10 Jul 2023 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688997872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCRhRdz1OKadoLJmuRpjoCU+SwWjeky46OuFPyjsAQ8=;
	b=cI9OrvsJbNNUHZvZkuBSwFD95cfqXmP8rcw0+3DIpwueDSAeQzssdcQ/03nqjS3le8UtGr
	TcdfqT20EHL4OoilPgbbIypyleAH0fmwyBuLm0kolAzI7QSakwwlFpbNxM4W/xWYN0Qrxh
	yYr08vDKuq3Lcl2/8L/ZvSr+dx+Ng7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688997872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCRhRdz1OKadoLJmuRpjoCU+SwWjeky46OuFPyjsAQ8=;
	b=RuFoYeRFKdHe9gxGVmK2QSWo1Sy+jpdRcaMyATH6l2r6bWHCjiZTkLfJgP8MAoXdRhRmVJ
	ISo/rshgpvXe6kCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97F441361C;
	Mon, 10 Jul 2023 14:04:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id G/cGJO8PrGSfNgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 14:04:31 +0000
Message-ID: <b9fe2f32-f4f6-6158-267a-da83b731b794@suse.de>
Date: Mon, 10 Jul 2023 16:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, deller@gmx.de,
 javierm@redhat.com
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-9-tzimmermann@suse.de>
 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
 <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
 <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------epOL8s1E6o0xrA2G07LHRbou"
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------epOL8s1E6o0xrA2G07LHRbou
Content-Type: multipart/mixed; boundary="------------91MPYwppuLkxX3KKLGwaMqgW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, deller@gmx.de,
 javierm@redhat.com
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-nvidia@lists.surfsouth.com, linux-hyperv@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>
Message-ID: <b9fe2f32-f4f6-6158-267a-da83b731b794@suse.de>
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-9-tzimmermann@suse.de>
 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
 <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
 <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
In-Reply-To: <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>

--------------91MPYwppuLkxX3KKLGwaMqgW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTU6NTkgc2NocmllYiBKb2huIFBhdWwgQWRyaWFuIEds
YXViaXR6Og0KPiBIaSBUaG9tYXMhDQo+IA0KPiBPbiBNb24sIDIwMjMtMDctMTAgYXQgMTU6
NTIgKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEkgd291bGQgYXJndWUg
dGhhdCB0aGUgY3VycmVudCBjb2RlIGlzIG1vcmUgcmVhZGFibGUgdGhhdCB5b3VyIHByb3Bv
c2VkIGNoYW5nZS4NCj4+Pg0KPj4+IEkgYWdyZWUgdGhhdCBpdCdzIGEgbm8tb3AsIGJ1dCBj
b2RlIGlzIG5vdCBqdXN0IGFib3V0IGZ1bmN0aW9uYWxpdHkgYnV0IGFsc28NCj4+PiByZWFk
YWJpbGl0eSwgaXNuJ3QgaXQ/DQo+Pg0KPj4gSSB3b24ndCBhcmd1ZSB3aXRoIHRoYXQsIGJ1
dCB0aGUgZmxhZyBpdHNlbGYgaXMgd3JvbmcuDQo+PiBGQklORk9fRkxBR19ERUZBVUxUIGlz
L3dhcyBmb3Igc3RydWN0IGZiX2luZm8uZmxhZ3MuIFlvdSBoYXZlIHN0cnVjdA0KPj4gZmJf
dmlkZW9tb2RlLmZsYWcuIFRoZSB2YWxpZCBmbGFncyBmb3IgdGhpcyBmaWVsZCBhcmUgYXQg
WzFdLiBJZg0KPj4gYW55dGhpbmcsIHRoZSBmaWVsZCBjb3VsZCBiZSBpbml0aWFsaXplZCB0
byBGQl9NT0RFX0lTX1VOS05PV04sIHdoaWNoDQo+PiBoYXMgdGhlIHNhbWUgdmFsdWUuDQo+
Pg0KPj4gWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3Vy
Y2UvaW5jbHVkZS9saW51eC9mYi5oI0w2ODENCj4gDQo+IEZCX01PREVfSVNfVU5LTk9XTiBz
b3VuZHMgdmVyeSByZWFzb25hYmxlIHRvIG1lLiBXb3VsZCB5b3UgYWdyZWUgdXNpbmcgdGhh
dCBpbnN0ZWFkPw0KDQpTdXJlLCBJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2ggYWNjb3JkaW5nbHku
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pj4NCj4+PiBBbHNvLCBJIHByZWZl
ciAic2g6IiBhcyB0aGUgYXJjaGl0ZWN0dXJlIHByZWZpeCwgbm90ICJhcmNoL3NoOiIuDQo+
Pg0KPj4gT2suDQo+IA0KPiBUaGFua3MuDQo+IA0KPiBBZHJpYW4NCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------91MPYwppuLkxX3KKLGwaMqgW--

--------------epOL8s1E6o0xrA2G07LHRbou
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSsD+4FAwAAAAAACgkQlh/E3EQov+Cc
0w//dauT1E8O7E2vRRXc/N5wSZAZ8YaOPezTAxZZ5jMc3fSfHufrNa90plvbnpqkcOHOBRXketvh
0tLWHB8jLOWILDzr6zLuq/GJhaftDQaKGKURm8cE2k6HqV8TTRTpRWADwCaSUYeI/W924iIAzkz+
hMahvURW2SgQNNYossoxPr5nTY0kl4WF1ZnQXt5YGSoJndq25sFduRsx+1i4Sj9g8lI5VdaHxTWw
Rs3dhKf8MUlz2C6MujcN61tpLNKSAtVDXcrZoM/O7C3kDFQVhYSO60aPj1ehzTtlxuvLpR0tq7AN
Djy7A+Zlb9lhjBKycr+LEjadTSlpjhfLvi6eB+pUxc/bfAvbh6XHK/c88S52katpBdqKIUxEIX46
s45RfCujA8YB0ZLIA4BSLaJBmcBBRKgFIw/YPBdKGoAfrjx6j18MP3fTkOxWu23jp477RimmW5Ji
pZ4upNR3AyUO+fL8UtHaRzPmitdhh/Vtx6s786Phoe2hNTBpNR4Hoat9N29IVLd6HiIGdO05cdE9
sMKZD5mc93ob9YEJlOPZ5enxcRVzhEyeuhUi/OoHpsihLSSzeBRDLaUF3b40zFpIRqvJzhuKRZWk
oNNUPkGj4HJg0W9933wRBtfUPyUl9vQoP/GH5Qj+bxvOeQbFrE/qqzgNHY9FRdJXORS9evqxElg6
MTk=
=IOo8
-----END PGP SIGNATURE-----

--------------epOL8s1E6o0xrA2G07LHRbou--
