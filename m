Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FE6351CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 09:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHDCt1znpz3dwd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 19:03:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IzY1vKro;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UoHUNYkQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IzY1vKro;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UoHUNYkQ;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHDBw6vcVz3c9B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 19:03:04 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D1BB220F0;
	Wed, 23 Nov 2022 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1669190575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03tcPO94ZEegZlsNvO5LRFo4aWuTLCAMrDWq8k2jupg=;
	b=IzY1vKrohL6R90nWatrmTsrnp8Fe6ekQbGaKdm/K9QWZ+IK4mygXFdr8ZT8ZJhD4aqo0et
	/Y/HDQFV1cQuVyVJW8ho4t+7T4mIZcZyAbf5cat6r4Iujc6/l1WPfMVBHfgnvOfqWtVnRk
	j7VaAfL1kW2ELUEsn1ulUbg+Lj14fqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1669190575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03tcPO94ZEegZlsNvO5LRFo4aWuTLCAMrDWq8k2jupg=;
	b=UoHUNYkQehO79aCvNSx/9PTR1PDxJFrCzGJRwmztczGC38za2POM0IyN81Rh32Dmwx9bg8
	VzfOdHzEixX4OzAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE47313AE7;
	Wed, 23 Nov 2022 08:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gXgZNa7TfWMVZQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 08:02:54 +0000
Message-ID: <fd0d1d30-3210-77f5-8cd7-b62f59dc3c20@suse.de>
Date: Wed, 23 Nov 2022 09:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221123031605.16680-1-rdunlap@infradead.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221123031605.16680-1-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x0zN6JmSPWLxOD0lUqmn3QnD"
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
Cc: linux-fbdev@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x0zN6JmSPWLxOD0lUqmn3QnD
Content-Type: multipart/mixed; boundary="------------FEAIra68HOPNZ5dhIh0uccQd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <fd0d1d30-3210-77f5-8cd7-b62f59dc3c20@suse.de>
Subject: Re: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
References: <20221123031605.16680-1-rdunlap@infradead.org>
In-Reply-To: <20221123031605.16680-1-rdunlap@infradead.org>

--------------FEAIra68HOPNZ5dhIh0uccQd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpBbSAyMy4xMS4yMiB1bSAwNDoxNiBzY2hyaWViIFJhbmR5IER1bmxhcDoNCj4gRml4IGJ1
aWxkIHdoZW4gQ09ORklHX0ZCX09GPXkgYW5kIENPTkZJR19EUk1fT0ZEUk09bS4NCj4gV2hl
biB0aGUgbGF0dGVyIHN5bWJvbCBpcyA9bSwga2NvbmZpZyBkb3duZ3JhZGVzIChsaW1pdHMp
IHRoZSAnc2VsZWN0J3MNCj4gdW5kZXIgRkJfT0YgdG8gbW9kdWxhciAoPW0pLiBUaGlzIGNh
dXNlcyB1bmRlZmluZWQgc3ltYm9sIHJlZmVyZW5jZXM6DQo+IA0KPiBwb3dlcnBjNjQtbGlu
dXgtbGQ6IGRyaXZlcnMvdmlkZW8vZmJkZXYvb2ZmYi5vOiguZGF0YS5yZWwucm8rMHg1OCk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGNmYl9maWxscmVjdCcNCj4gcG93ZXJwYzY0LWxp
bnV4LWxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29mZmIubzooLmRhdGEucmVsLnJvKzB4NjAp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjZmJfY29weWFyZWEnDQo+IHBvd2VycGM2NC1s
aW51eC1sZDogZHJpdmVycy92aWRlby9mYmRldi9vZmZiLm86KC5kYXRhLnJlbC5ybysweDY4
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgY2ZiX2ltYWdlYmxpdCcNCj4gDQo+IEZpeCB0
aGlzIGJ5IGFsbG93aW5nIEZCX09GIGFueSB0aW1lIHRoYXQgRFJNX09GRFJNICE9IHkgc28g
dGhhdCB0aGUNCj4gc2VsZWN0ZWQgRkJfQ0ZCXyogc3ltYm9scyB3aWxsIGJlY29tZSA9eSBp
bnN0ZWFkIG9mID1tLg0KPiANCj4gSW4gdHJpc3RhdGUgbG9naWMgKGZvciBEUk1fT0ZEUk0p
LCB0aGlzIGNoYW5nZXMgdGhlIGRlcGVuZGVuY3kgZnJvbQ0KPiAgICAgICFEUk1fT0ZEUk0J
PT0gMiAtIDEgPT0gMSA9PiBtb2R1bGFyIG9ubHkgKG9yIGRpc2FibGVkKQ0KPiB0byAoYm9v
bGVhbikNCj4gICAgICBEUk1fT0ZEUk0gIT0geSA9PSB5LCBhbGxvd2luZyB0aGUgJ3NlbGVj
dCdzIHRvIGNhdXNlIHRoZQ0KPiBGQl9DRkJfKiBzeW1ib2xzIHRvID15IGluc3RlYWQgb2Yg
PW0uDQo+IA0KPiBGaXhlczogYzhhMTc3NTZjNDI1ICgiZHJtL29mZHJtOiBBZGQgb2Zkcm0g
Zm9yIE9wZW4gRmlybXdhcmUgZnJhbWVidWZmZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogUmFu
ZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFN1Z2dlc3RlZC1ieTogTWFz
YWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4NCj4gQ2M6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogTWljaGFsIFN1Y2jDoW5layA8
bXN1Y2hhbmVrQHN1c2UuZGU+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9y
Zw0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogSGVsZ2Ug
RGVsbGVyIDxkZWxsZXJAZ214LmRlPg0KPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwu
b3JnDQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQoNCkFja2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4g
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgfCAgICAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29u
ZmlnDQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPiArKysgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcNCj4gQEAgLTQ1NSw3ICs0NTUsNyBAQCBjb25maWcg
RkJfQVRBUkkNCj4gICBjb25maWcgRkJfT0YNCj4gICAJYm9vbCAiT3BlbiBGaXJtd2FyZSBm
cmFtZSBidWZmZXIgZGV2aWNlIHN1cHBvcnQiDQo+ICAgCWRlcGVuZHMgb24gKEZCID0geSkg
JiYgUFBDICYmICghUFBDX1BTRVJJRVMgfHwgUENJKQ0KPiAtCWRlcGVuZHMgb24gIURSTV9P
RkRSTQ0KPiArCWRlcGVuZHMgb24gRFJNX09GRFJNICE9IHkNCj4gICAJc2VsZWN0IEFQRVJU
VVJFX0hFTFBFUlMNCj4gICAJc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0KPiAgIAlzZWxlY3Qg
RkJfQ0ZCX0NPUFlBUkVBDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------FEAIra68HOPNZ5dhIh0uccQd--

--------------x0zN6JmSPWLxOD0lUqmn3QnD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN9064FAwAAAAAACgkQlh/E3EQov+Dw
HBAAlAs64TF5Xr44hSnDpEWlJk0XyfRog/ww43C1hnTq8cOs7DTQNdL26coDDJQ+W8aXvdi0ZsCl
VjWoRAtD0tWiHvLMvmzaWFY//tWPcjUKnU6B1qCRtp4M/voPQKyG00q+e1BcMf3V5Po1gilAuBN3
ZH18orP4odGFVjcZUVU2c+JRgVfVl8iMFlI936G8ew4khuVv1BWKpxQsAzfySCgoQTvlxE3AGlJU
0vARnlxWy2r+2xp1zjOu8EEVX99rMTSRO81GdMzqqJOKCAxN5ML7HbjvEu2IhxLFL54crEdJlrEL
CSIYY3KWvC+Y84P1T6VuFUg51pnrVxJuIihXgdnr9eX9luWLgGOcsEcy3TD7WH4ecNNdr/lsLT5K
ZUfV7loNokMH9yLU/fsC+2MV7X2APx1mgFDSMKIRVyYfc/ZlgEl6NOqxx8uABkOlkUgonSYlcTlw
mVroXYPMSlQN3MdwEXAJCekVMofaUsVYv/cVplRVmRb53OlJ2B9R+iLf4EoI06NzLPnahL6Z6qp4
oquWBLIHPTWuLbLioJsUKlek5PUnM+nBX1u+EHeYV6FzHCnWzVaWRgxa1iX7ufB3wq8VaobxVE4D
c817Ymjuv7GrOFQ8HPLWgom/nW7BrTJbKKzCUcEmx9nmFHPF4FHuJRQYPxFblb7rcxnqTlUUOSWd
9B4=
=LqxQ
-----END PGP SIGNATURE-----

--------------x0zN6JmSPWLxOD0lUqmn3QnD--
