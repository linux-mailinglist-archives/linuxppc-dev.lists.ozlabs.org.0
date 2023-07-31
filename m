Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385347698E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 16:02:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=izT7z9kj;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9dhqslck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF0LN0wkQz304b
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 00:02:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=izT7z9kj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9dhqslck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF0KT65J9z2yVx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 00:01:48 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23D3D1F854;
	Mon, 31 Jul 2023 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1690812100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b4Ospd9tdJ/9LVp9GV33x9w2ee0DMxOY/R8DWILwyoQ=;
	b=izT7z9kjtwxOBd9ghqMUp1UFv1IzvxxuGghUc5FGEFkHNFKlE5V//FQpLnrmQJp7FlPSJp
	Xuv4Ke6C1VYJnbjifSu0kjIbNHReHlmW4psqMnLlfrx0so82ocMYQELlVseeW7BXqVyatk
	Sd41VkUZqY6vCaNeqNz7XCn6Yx6s3oU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690812100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b4Ospd9tdJ/9LVp9GV33x9w2ee0DMxOY/R8DWILwyoQ=;
	b=9dhqslck7oayWZRDdaD/VpUlVPqR61Ngeng4Mcn2EZ7M7Oi2f75cwTVe/DkwsGLS7lWFfO
	IxxsbHMZt8eUFnDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E978C1322C;
	Mon, 31 Jul 2023 14:01:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id p8sAOMO+x2QSSgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 31 Jul 2023 14:01:39 +0000
Message-ID: <13748adb-1e0f-d492-d2ca-66f2c6be33d0@suse.de>
Date: Mon, 31 Jul 2023 16:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yn6IudZAIQmkHUvoB83qGyX8"
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
Cc: Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yn6IudZAIQmkHUvoB83qGyX8
Content-Type: multipart/mixed; boundary="------------lFs1kHQPQJKWrh5RcffCHU8U";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <13748adb-1e0f-d492-d2ca-66f2c6be33d0@suse.de>
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
In-Reply-To: <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>

--------------lFs1kHQPQJKWrh5RcffCHU8U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkFtIDEzLjA3LjIzIHVtIDE4OjExIHNjaHJpZWIgUmFuZHkgRHVubGFwOg0KPiAN
Cj4gDQo+IE9uIDcvMTIvMjMgMTk6MzcsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+PiBI
aSBhbGwsDQoNCnNvcnJ5LCBJJ3ZlIGJlZW4gQUZLIGZvciBhIGJpdC4gSSdsbCBzZW5kIGEg
Zml4IHNvb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4+DQo+PiBDaGFuZ2VzIHNp
bmNlIDIwMjMwNzEyOg0KPj4NCj4gDQo+IG9uIHBwYzY0Og0KPiANCj4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC4uL2luY2x1ZGUvbGludXgvZGV2aWNlLmg6MTUsDQo+ICAgICAgICAgICAg
ICAgICAgIGZyb20gLi4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lvLmg6MjIsDQo+ICAg
ICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9saW51eC9pby5oOjEzLA0KPiAgICAg
ICAgICAgICAgICAgICBmcm9tIC4uL2luY2x1ZGUvbGludXgvaXJxLmg6MjAsDQo+ICAgICAg
ICAgICAgICAgICAgIGZyb20gLi4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2hhcmRpcnEu
aDo2LA0KPiAgICAgICAgICAgICAgICAgICBmcm9tIC4uL2luY2x1ZGUvbGludXgvaGFyZGly
cS5oOjExLA0KPiAgICAgICAgICAgICAgICAgICBmcm9tIC4uL2luY2x1ZGUvbGludXgvaW50
ZXJydXB0Lmg6MTEsDQo+ICAgICAgICAgICAgICAgICAgIGZyb20gLi4vZHJpdmVycy92aWRl
by9mYmRldi9wczNmYi5jOjI1Og0KPiAuLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3BzM2ZiLmM6
IEluIGZ1bmN0aW9uICdwczNmYl9wcm9iZSc6DQo+IC4uL2RyaXZlcnMvdmlkZW8vZmJkZXYv
cHMzZmIuYzoxMTcyOjQwOiBlcnJvcjogJ3N0cnVjdCBmYl9pbmZvJyBoYXMgbm8gbWVtYmVy
IG5hbWVkICdkZXYnDQo+ICAgMTE3MiB8ICAgICAgICAgICAgICAgICAgZGV2X2RyaXZlcl9z
dHJpbmcoaW5mby0+ZGV2KSwgZGV2X25hbWUoaW5mby0+ZGV2KSwNCj4gICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4NCj4gLi4vaW5jbHVkZS9s
aW51eC9kZXZfcHJpbnRrLmg6MTEwOjM3OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3Jv
ICdkZXZfcHJpbnRrX2luZGV4X3dyYXAnDQo+ICAgIDExMCB8ICAgICAgICAgICAgICAgICBf
cF9mdW5jKGRldiwgZm10LCAjI19fVkFfQVJHU19fKTsgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn4NCj4gLi4vZHJpdmVycy92aWRlby9mYmRldi9wczNmYi5jOjExNzE6OTogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdkZXZfaW5mbycNCj4gICAxMTcxIHwgICAgICAg
ICBkZXZfaW5mbyhpbmZvLT5kZXZpY2UsICIlcyAlcywgdXNpbmcgJXUgS2lCIG9mIHZpZGVv
IG1lbW9yeVxuIiwNCj4gICAgICAgIHwgICAgICAgICBefn5+fn5+fg0KPiAuLi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3BzM2ZiLmM6MTE3Mjo2MTogZXJyb3I6ICdzdHJ1Y3QgZmJfaW5mbycg
aGFzIG5vIG1lbWJlciBuYW1lZCAnZGV2Jw0KPiAgIDExNzIgfCAgICAgICAgICAgICAgICAg
IGRldl9kcml2ZXJfc3RyaW5nKGluZm8tPmRldiksIGRldl9uYW1lKGluZm8tPmRldiksDQo+
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+DQo+IC4uL2luY2x1ZGUvbGludXgvZGV2X3ByaW50ay5oOjEx
MDozNzogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyAnZGV2X3ByaW50a19pbmRleF93
cmFwJw0KPiAgICAxMTAgfCAgICAgICAgICAgICAgICAgX3BfZnVuYyhkZXYsIGZtdCwgIyNf
X1ZBX0FSR1NfXyk7ICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+DQo+IC4uL2RyaXZl
cnMvdmlkZW8vZmJkZXYvcHMzZmIuYzoxMTcxOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyAnZGV2X2luZm8nDQo+ICAgMTE3MSB8ICAgICAgICAgZGV2X2luZm8oaW5mby0+ZGV2
aWNlLCAiJXMgJXMsIHVzaW5nICV1IEtpQiBvZiB2aWRlbyBtZW1vcnlcbiIsDQo+ICAgICAg
ICB8ICAgICAgICAgXn5+fn5+fn4NCj4gDQo+IA0KPiBGdWxsIHJhbmRjb25maWcgZmlsZSBp
cyBhdHRhY2hlZC4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------lFs1kHQPQJKWrh5RcffCHU8U--

--------------yn6IudZAIQmkHUvoB83qGyX8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTHvsMFAwAAAAAACgkQlh/E3EQov+CV
ABAAlQIWYmZpcCipgTuWePaqwW4zZGtdDJz9h/7Kr7WHaJiyGLrreCarEryqWKawzv/JoT4MzMLH
+N6RLDF+bLE1BPQ4ZFvAGzAcCF0ygR+AuzQEWn10/a8CUWY6/s7sCVinKWA71BuJdgkvSa2rbBl5
xHqFjLPSAAF1tmV0qctbWXgPGFq+DbNAbje5PbLU2lxmbigEQ59DSVhOiMH0oS4Opyxw//R5zzEe
jHDnL1hraznsJJlY9Rb+i2OYu5XP9Huat8jvzRH6TR7TnzOboGd+rMcULq5Ohoibb5uIceZ/7D/c
4Z/bI9LHv2Q6Y01n48JmOb0vO/tf1o8VxdvpfJT+MOBpaBsKSMCoDKVm+aYLe/G1xFcOlOPs+ivR
Hdfy9qcq80JXMdb5hDdi21UzQNz9VNnlm3irVK4PNgU15s19p1XlyxYni1EkxAkcvhviFvUUzvYX
kAv5nqXLPcTJebQUKvZnmHpTVhlgXNVR5Ap9gt451JoA9MLSGMqfXqSGKMjLEgaYqPkgLc8WYr3u
7SrQPwb3QfV779hi9fYPFVRPFlWqyZCfxMtn0IDqDUJKIH/Knb8nlHZzWmjTr6aeCZEWgsGYpQHf
ATIL24aQDi0YZmR8OM+qIQkw2IL4/63cb+ctVmH63rcD2OG1IGelNxFAFyo+3k+6j2qizt5ksZJG
nrU=
=h8pD
-----END PGP SIGNATURE-----

--------------yn6IudZAIQmkHUvoB83qGyX8--
