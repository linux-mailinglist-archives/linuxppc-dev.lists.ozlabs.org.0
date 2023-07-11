Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336C74E742
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 08:25:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kY8IJQi5;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mBrGbWs9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0W8C21kcz3bnw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 16:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kY8IJQi5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mBrGbWs9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0W7J5XrBz3bXl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 16:24:44 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 514E3203BA;
	Tue, 11 Jul 2023 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689056681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9UTTOR73oFSTJb3AbCxsf/F9LdMKM9PZMaPQ/y7iNe8=;
	b=kY8IJQi52EAVSaT9ihZdWh9AIenGqqZW7o/VDyXKIo95sEj0zTocTTbZ5oqRKUhZ7ttiAb
	AL5duw/r4GZa1Ru0oA3tKwkrwxRbRq1J2ZaWw2Nco0R99OaW1BO3q4ejrbuQOJh0bXbYzp
	1oc+CPRVF4Ih0rdJoFwEsGalxINRdl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689056681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9UTTOR73oFSTJb3AbCxsf/F9LdMKM9PZMaPQ/y7iNe8=;
	b=mBrGbWs91Pszsd5aoyT8MQRVbY/AEmZfCCJn2mneDCk4xuW4EAJkuRBEh8pfBtPp4mzC0g
	Vrfx9S5JE1dymjDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF5D91390F;
	Tue, 11 Jul 2023 06:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VlmOOaj1rGSTDQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Jul 2023 06:24:40 +0000
Message-ID: <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de>
Date: Tue, 11 Jul 2023 08:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710171903.GA14712@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230710171903.GA14712@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N0aJus0T6gb70e5IfP9AME4R"
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
Cc: linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N0aJus0T6gb70e5IfP9AME4R
Content-Type: multipart/mixed; boundary="------------rTbcb6wQVBeV2BUB8IDvgzl0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: deller@gmx.de, javierm@redhat.com, linux-fbdev@vger.kernel.org,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Message-ID: <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de>
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710171903.GA14712@ravnborg.org>
In-Reply-To: <20230710171903.GA14712@ravnborg.org>

--------------rTbcb6wQVBeV2BUB8IDvgzl0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDEwLjA3LjIzIHVtIDE5OjE5IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBNb24sIEp1bCAxMCwgMjAyMyBhdCAwMjo1MDowNFBN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IFJlbW92ZSB0aGUgdW51c2Vk
IGZsYWdzIEZCSU5GT19ERUZBVUxUIGFuZCBGQklORk9fRkxBR19ERUZBVUxUIGZyb20NCj4+
IGZiZGV2IGFuZCBkcml2ZXJzLCBhcyBicmllZmx5IGRpc2N1c3NlZCBhdCBbMV0uIEJvdGgg
ZmxhZ3Mgd2VyZSBtYXliZQ0KPj4gdXNlZnVsIHdoZW4gZmJkZXYgaGFkIHNwZWNpYWwgaGFu
ZGxpbmcgZm9yIGRyaXZlciBtb2R1bGVzLiBXaXRoDQo+PiBjb21taXQgMzc2YjNmZjU0Yzlh
ICgiZmJkZXY6IE51a2UgRkJJTkZPX01PRFVMRSIpLCB0aGV5IGFyZSBib3RoIDANCj4+IGFu
ZCBoYXZlIG5vIGZ1cnRoZXIgZWZmZWN0Lg0KPj4NCj4+IFBhdGNoZXMgMSB0byA3IHJlbW92
ZSBGQklORk9fREVGQVVMVCBmcm9tIGRyaXZlcnMuIFBhdGNoZXMgMiB0byA1DQo+PiBzcGxp
dCB0aGlzIGJ5IHRoZSB3YXkgdGhlIGZiX2luZm8gc3RydWN0IGlzIGJlaW5nIGFsbG9jYXRl
ZC4gQWxsIGZsYWdzDQo+PiBhcmUgY2xlYXJlZCB0byB6ZXJvIGR1cmluZyB0aGUgYWxsb2Nh
dGlvbi4NCj4+DQo+PiBQYXRjaGVzIDggdG8gMTYgZG8gdGhlIHNhbWUgZm9yIEZCSU5GT19G
TEFHX0RFRkFVTFQuIFBhdGNoIDggZml4ZXMNCj4+IGFuIGFjdHVhbCBidWcgaW4gaG93IGFy
Y2gvc2ggdXNlcyB0aGUgdG9rbmUgZm9yIHN0cnVjdCBmYl92aWRlb21vZGUsDQo+PiB3aGlj
aCBpcyB1bnJlbGF0ZWQuDQo+Pg0KPj4gUGF0Y2ggMTcgcmVtb3ZlcyBib3RoIGZsYWcgY29u
c3RhbnRzIGZyb20gPGxpbnV4L2ZiLmg+DQo+IA0KPiBXZSBoYXZlIGEgZmV3IG1vcmUgZmxh
Z3MgdGhhdCBhcmUgdW51c2VkIC0gc2hvdWxkIHRoZXkgYmUgbnVrZWQgdG9vPw0KPiBGQklO
Rk9fSFdBQ0NFTF9GSUxMUkVDVA0KPiBGQklORk9fSFdBQ0NFTF9ST1RBVEUNCj4gRkJJTkZP
X0hXQUNDRUxfWFBBTg0KDQpJdCBzZWVtcyB0aG9zZSBhcmUgdGhlcmUgZm9yIGNvbXBsZXRl
bmVzcy4gTm90aGluZyBzZXRzIF9ST1RBVEUsIHRoZSANCm90aGVycyBhcmUgc2ltcGx5IG5l
dmVyIGNoZWNrZWQuIEFjY29yZGluZyB0byB0aGUgY29tbWVudHMsIHNvbWUgYXJlIA0KcmVx
dWlyZWQsIHNvbWUgYXJlIG9wdGlvbmFsLiBJIGRvbid0IGtub3cgd2hhdCB0aGF0IG1lYW5z
Lg0KDQpJSVJDIHRoZXJlIHdlcmUgY29tcGxhaW5zIGFib3V0IHBlcmZvcm1hbmNlIHdoZW4g
RGFuaWVsIHRyaWVkIHRvIHJlbW92ZSANCmZiY29uIGFjY2VsZXJhdGlvbiwgc28gbm90IGFs
bCBfSFdBQ0NFTF8gZmxhZ3MgYXJlIHVubmVlZGVkLg0KDQpMZWF2aW5nIHRoZW0gaW4gZm9y
IHJlZmVyZW5jZS9jb21wbGV0ZW5lc3MgbWlnaHQgYmUgYW4gb3B0aW9uOyBvciBub3QuIEkg
DQpoYXZlIG5vIHN0cm9uZyBmZWVsaW5ncyBhYm91dCB0aG9zZSBmbGFncy4NCg0KPiANCj4g
VW51c2VkIGFzIGluIG5vIHJlZmVyZW5jZXMgZnJvbSBmYmRldi9jb3JlLyoNCj4gDQo+IEkg
d291bGQgcmF0aGVyIHNlZSBvbmUgc2VyaWVzIG51a2UgYWxsIHVudXNlZCBGQklORk8gZmxh
Z3MgaW4gb25lIGdvLg0KPiBBc3N1bWluZyBteSBxdWljayBncmVwIGFyZSByaWdodCBhbmQg
dGhlIGFib3ZlIGNhbiBiZSBkcm9wcGVkLg0KDQpJIHdvdWxkIG5vdCB3YW50IHRvIGV4dGVu
ZCB0aGlzIHNlcmllcy4gSSdtIHJlbW92aW5nIF9ERUZBVUxUIGFzIGl0J3MgDQphYnNvbHV0
ZWx5IHBvaW50bGVzcyBhbmQgY29uZnVzaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KPiAJU2FtDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJh
bmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90
ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhS
QiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------rTbcb6wQVBeV2BUB8IDvgzl0--

--------------N0aJus0T6gb70e5IfP9AME4R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSs9agFAwAAAAAACgkQlh/E3EQov+AA
FBAAjEgZXRfNoPCjdkqDPZ9chxzmBV6i2k8QgPiwpivUyCN4sbTShTC2sd08UmqKeXqfcHV0P8qX
q2NMiTtOfyBZuLqTlMRPbztbYOJIbkUfmc/SI1q+SIj8nYi3SzvE/+TI4TM1jmV8RvykfdN4y9tv
z4C7BQhfVarR4AERMeSCuI+zicQ/WjGi9XmkKU1LPJq9sz20/9BonVFG3XYGwrH+wxRKQH51em7r
U/rN+cWCG0/q/mHGzsXc4RfqK140jAczQS4SbY0tCBStdmvoKG6Ps7xdeJnHwXKGn6gnKmCGmstK
W5QWG2q8UU+X1eppqvQ3t0zYdRkCDvETlHoTlsfHkSgjkf+EyFPP2hf9QpIyOFChPDRmo7vXFero
XEdAojaSKM037GABmhkXl64d0LgOGy3YHmRPAMNhwMgkfESyQtok89ygiAR3mol9Sk+VH1lmIAiy
t6iIBhSJG8FRb4k9MRtU+nmCVKwWeu6cI/gYnYk23ENEdErvo12aT79WuoWGJbXp4KyW81n8j6Dx
ducg1+wueRxDVWQsz1iAbcm4Gdt94VirZ5/FL6Ds/s7D7GumFCtd394TazkGz32fIyL5csJljH+I
ooEtrvaAJO+jmP7TPAxh1rXcKkIhn2rUPuhutzvOguAikyxcBL/TShsJUv572OYGUcd67xOnfcbM
+14=
=3Opk
-----END PGP SIGNATURE-----

--------------N0aJus0T6gb70e5IfP9AME4R--
