Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E569448C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 12:30:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFhwl6qW0z3cBX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 22:30:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cNjcr7RQ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SHfPB0jC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cNjcr7RQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SHfPB0jC;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFhvk5dT0z3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 22:29:54 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6BD9E1FDD0;
	Mon, 13 Feb 2023 11:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676287788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=duqsYYc06i4gLX3sYLYkIx0tFuQmGy6/uxJD+3QoXL0=;
	b=cNjcr7RQamlxjuJE/F3p6ItNZws4ctn1w5WqugE3bQawd5TvVo7qedXrXV9tXTI1l6tY3m
	WUyGsw+4+jetwrfhC9SWyj0SlmE31uWLAujMRKuGGKLIsfvMvE72KIAWXH6g9ugkBKrGx0
	qh8OBPbcsvSJWJ1q+2zSIVQO8/f2HXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676287788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=duqsYYc06i4gLX3sYLYkIx0tFuQmGy6/uxJD+3QoXL0=;
	b=SHfPB0jCw8jgCo98m6k1Ogov2+P8PJ8u9As/Z/pl+cGMnZNnQxZ7QQsM+/j+vzFpp0mVVg
	RKt4vKvs87RkctBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 280FF1391B;
	Mon, 13 Feb 2023 11:29:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id bbCqCCwf6mPGHgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Feb 2023 11:29:48 +0000
Message-ID: <fedc746f-1685-a5a1-b847-7031b66c1fd2@suse.de>
Date: Mon, 13 Feb 2023 12:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 04/11] drivers/ps3: Read video= option with
 fb_get_option()
To: Geoff Levand <geoff@infradead.org>, daniel@ffwll.ch, airlied@gmail.com,
 deller@gmx.de, javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-5-tzimmermann@suse.de>
 <06917dd0-c4f1-c80a-16a7-f2baac47027d@infradead.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <06917dd0-c4f1-c80a-16a7-f2baac47027d@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yCCWD0exDdL5H6rPLKNTYS0G"
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
--------------yCCWD0exDdL5H6rPLKNTYS0G
Content-Type: multipart/mixed; boundary="------------W5mLJmvS7RAua9GDKVebrBjK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geoff Levand <geoff@infradead.org>, daniel@ffwll.ch, airlied@gmail.com,
 deller@gmx.de, javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <fedc746f-1685-a5a1-b847-7031b66c1fd2@suse.de>
Subject: Re: [PATCH 04/11] drivers/ps3: Read video= option with
 fb_get_option()
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-5-tzimmermann@suse.de>
 <06917dd0-c4f1-c80a-16a7-f2baac47027d@infradead.org>
In-Reply-To: <06917dd0-c4f1-c80a-16a7-f2baac47027d@infradead.org>

--------------W5mLJmvS7RAua9GDKVebrBjK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDIuMjMgdW0gMTc6NTMgc2NocmllYiBHZW9mZiBMZXZhbmQ6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIDIvOS8yMyAwNTo1NSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+PiBHZXQgdGhlIGtlcm5lbCdzIGdsb2JhbCB2aWRlbz0gcGFyYW1ldGVyIHdpdGgg
ZmJfZ2V0X29wdGlvbigpLiBEb25lDQo+PiB0byB1bmV4cG9ydCB0aGUgaW50ZXJuYWwgZmJk
ZXYgc3RhdGUgZmJfbW9kZV9jb25maWcuIE5vIGZ1bmN0aW9uYWwNCj4+IGNoYW5nZXMuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9wczMvcHMzYXYuYyB8IDExICsrKysrKysr
Ky0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBJIHdhbnRlZCB0byB0ZXN0IHRoZXNlIGNoYW5nZXMgb24gdGhlIFBTMywg
YnV0IGdvdCB0aGlzDQo+IGVycm9yIHdoZW4gdHJ5aW5nIHRvIGFwcGx5IHRoaXMgcGF0Y2gg
c2V0IHRvIExpbnV4LTYuMi1yYzc6DQo+IA0KPiAgICBBcHBseWluZzogZmJkZXY6IEhhbmRs
ZSB2aWRlbz0gcGFyYW1ldGVyIGluIHZpZGVvL2NtZGxpbmUuYw0KPiAgICBlcnJvcjogcGF0
Y2ggZmFpbGVkOiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZzoxMA0KPiAgICBlcnJvcjogZHJp
dmVycy9ncHUvZHJtL0tjb25maWc6IHBhdGNoIGRvZXMgbm90IGFwcGx5DQo+IA0KPiBJcyB0
aGVyZSBhIExpbnV4IGtlcm5lbCByZXZpc2lvbiB0aGF0IHRoZXNlIHdpbGwgYXBwbHkgdG8s
DQo+IG9yIGlzIHRoZXJlIGEgZ2l0IHJlcG9zaXRvcnkgSSBjYW4gcHVsbCB0aGVtIGZyb20/
DQoNClRoYW5rcyBmb3IgdGVzdGluZy4gIE15IGJhc2UgdmVyc2lvbiBpcyBhIHJlY2VudCBE
Uk0gZGV2ZWxvcG1lbnQgdHJlZS4gDQpUaGUgcmVwbyBpcyBhdCBodHRwczovL2NnaXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0tdGlwLywgdGhlIGJyYW5jaCBpcyANCmRybS10aXAuDQoN
CklmIGFjY2VwdGFibGUsIEknZCBsYXRlciBsaWtlIHRvIG1lcmdlIHRoZSBQUzMgcGF0Y2hl
cyB0aHJvdWdoIERSTSB0cmVlcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4g
LUdlb2ZmDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------W5mLJmvS7RAua9GDKVebrBjK--

--------------yCCWD0exDdL5H6rPLKNTYS0G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPqHysFAwAAAAAACgkQlh/E3EQov+AP
Xg/7Bct0gFS5T/lwv2UFvbQi5YiJYvvh3fp69WF5uEkgrxCBYT+/YjtZQhU51PS26gf1EIG/dVKj
as3D+QDCgKR4UmsD8LpT1tJE17ccywfhDYseymqSaVAuwQB9W14svzkRmpBpJlXqYBf4JKDwTaSu
sijzqXGeM6bpL+gmIpHpmp3Ef8axbP9ENzt+7hafhFHMFx/Hly3le1R6uVS+WQ2W4KqfJ39CTo7K
e21VlTXbAvYbRzjES4znpD082tVKHvq5LcCksrJeCjxwrOiPCHV/zFQYR+91+DMHg3Ux6fiWQqBH
V4pF9bO8dx4/UfioGZ92XpJzi5tCuYn1UkJhjMFpA1D7wV7PNB70IFSy05HeV1oPMilujOkz7bsK
KSZeP+nRHIrhm2cznV6X23FdMJjPXJ7ClqSgV+0UgV3/3zJj8UAM38nTf3sTgfeM4j/iaKJiEJRw
yb+FxELAg+9A0NYh2flM5jbmq0lZRMe0aocdYIJl8OLYqgXteLey9HjcOaULLVW6ztHBcJ/hEeLX
f+DBAKy75nlr9YW4XHHFSaSinxy4TVOsI66+r6bCPcubDce5n2NqWqmcaQK57gslWxUl7kzXtKGD
MRZ0izcT3w+DTSKTZGlxZYH+BJzMH9GemKeAu4MRw11vhfhmLHEFXCIybabEYCrWZKMWK2naINZN
J/o=
=hcCu
-----END PGP SIGNATURE-----

--------------yCCWD0exDdL5H6rPLKNTYS0G--
