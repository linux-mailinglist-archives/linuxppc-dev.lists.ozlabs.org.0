Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7E673335
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 09:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyFSz3qgsz3fD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 19:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eFqR5Jtr;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FiuLNX39;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eFqR5Jtr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FiuLNX39;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyFS23711z3c7h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 19:00:49 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1FE05CA89;
	Thu, 19 Jan 2023 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674115245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=59uOrifRDTYBCECf1fwQxGbqBJuSw77rED/xSDf+KMs=;
	b=eFqR5Jtr66gr2NYeIe0qAL2Lizr3SoI3ekiORMkd9ECEDHUDNAaVzuRl84CvskPjG6F8Ee
	wCJXz8px0IahIYedDmN0uKdIbDdJys3+qA6LWXDDr0bGneS5wK3w0Ww9MjPvRxuq5RxYIZ
	Ose+3rudhU07EUGtCsmJPvqpekgdN+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674115245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=59uOrifRDTYBCECf1fwQxGbqBJuSw77rED/xSDf+KMs=;
	b=FiuLNX39Fy7v8zT7K0EcEpRXsdZrAKb14y7XtE9Q7bBdMss/xzTttLCRGl92HW+SZM60mk
	nUOrb3DXOjdG+KCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 881F6139ED;
	Thu, 19 Jan 2023 08:00:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id C19gIK34yGNnSwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Jan 2023 08:00:45 +0000
Message-ID: <f57f29a6-1db3-ab0b-a1f7-77074d1c10e8@suse.de>
Date: Thu, 19 Jan 2023 09:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] of: Make of framebuffer devices unique
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 "Erhard F." <erhard_f@mailbox.org>
References: <20230117165804.18036-1-msuchanek@suse.de>
 <20230118211305.42e50a4a@yea> <20230118214618.GM16547@kitsune.suse.cz>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230118214618.GM16547@kitsune.suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vYwQZLIzQewlERFQlMVyGl2T"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vYwQZLIzQewlERFQlMVyGl2T
Content-Type: multipart/mixed; boundary="------------SelpGfgpoFlxitarI50j1scj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 "Erhard F." <erhard_f@mailbox.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <f57f29a6-1db3-ab0b-a1f7-77074d1c10e8@suse.de>
Subject: Re: [PATCH] of: Make of framebuffer devices unique
References: <20230117165804.18036-1-msuchanek@suse.de>
 <20230118211305.42e50a4a@yea> <20230118214618.GM16547@kitsune.suse.cz>
In-Reply-To: <20230118214618.GM16547@kitsune.suse.cz>

--------------SelpGfgpoFlxitarI50j1scj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWljaGFsLA0KDQp0aGFua3MgZm9yIGZpeGluZyB0aGlzIGlzc3VlLiBCdXQgdGhlIHJl
dmlldyB0aW1lIHdhcyB3YXkgdG9vIHNob3J0LiANClBsZWFzZSBzZWUgbXkgY29tbWVudHMg
YmVsb3cuDQoNCkFtIDE4LjAxLjIzIHVtIDIyOjQ2IHNjaHJpZWIgTWljaGFsIFN1Y2jDoW5l
azoNCj4gT24gV2VkLCBKYW4gMTgsIDIwMjMgYXQgMDk6MTM6MDVQTSArMDEwMCwgRXJoYXJk
IEYuIHdyb3RlOg0KPj4gT24gVHVlLCAxNyBKYW4gMjAyMyAxNzo1ODowNCArMDEwMA0KPj4g
TWljaGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4+IFNp
bmNlIExpbnV4IDUuMTkgdGhpcyBlcnJvciBpcyBvYnNlcnZlZDoNCj4+Pg0KPj4+IHN5c2Zz
OiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFtZSAnL2RldmljZXMvcGxhdGZvcm0v
b2YtZGlzcGxheScNCj4+Pg0KPj4+IFRoaXMgaXMgYmVjYXVzZSBtdWx0aXBsZSBkZXZpY2Vz
IHdpdGggdGhlIHNhbWUgbmFtZSAnb2YtZGlzcGxheScgYXJlDQo+Pj4gY3JlYXRlZCBvbiB0
aGUgc2FtZSBidXMuDQo+Pj4NCj4+PiBVcGRhdGUgdGhlIGNvZGUgdG8gY3JlYXRlIG51bWJl
cmVkIGRldmljZSBuYW1lcyBmb3IgdGhlIG5vbi1ib290DQo+Pj4gZGlzYXBsYXkuDQo+Pj4N
Cj4+PiBjYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4+PiBSZWZlcmVuY2Vz
OiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNjA5NQ0K
Pj4+IEZpeGVzOiA1MmIxYjQ2YzM5YWUgKCJvZjogQ3JlYXRlIHBsYXRmb3JtIGRldmljZXMg
Zm9yIE9GIGZyYW1lYnVmZmVycyIpDQo+Pj4gUmVwb3J0ZWQtYnk6IEVyaGFyZCBGLiA8ZXJo
YXJkX2ZAbWFpbGJveC5vcmc+DQo+Pj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgU3Vj
aGFuZWsgPG1zdWNoYW5la0BzdXNlLmRlPg0KPj4+IC0tLQ0KPj4+ICAgZHJpdmVycy9vZi9w
bGF0Zm9ybS5jIHwgOCArKysrKysrLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
b2YvcGxhdGZvcm0uYyBiL2RyaXZlcnMvb2YvcGxhdGZvcm0uYw0KPj4+IGluZGV4IDgxYzhj
MjI3YWI2Yi4uZjJhNWQ2NzlhMzI0IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvb2YvcGxh
dGZvcm0uYw0KPj4+ICsrKyBiL2RyaXZlcnMvb2YvcGxhdGZvcm0uYw0KPj4+IEBAIC01MjUs
NiArNTI1LDcgQEAgc3RhdGljIGludCBfX2luaXQgb2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1
bGF0ZV9pbml0KHZvaWQpDQo+Pj4gICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQykpIHsN
Cj4+PiAgIAkJc3RydWN0IGRldmljZV9ub2RlICpib290X2Rpc3BsYXkgPSBOVUxMOw0KPj4+
ICAgCQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXY7DQo+Pj4gKwkJaW50IGRpc3BsYXlf
bnVtYmVyID0gMTsNCj4+PiAgIAkJaW50IHJldDsNCj4+PiAgIA0KPj4+ICAgCQkvKiBDaGVj
ayBpZiB3ZSBoYXZlIGEgTWFjT1MgZGlzcGxheSB3aXRob3V0IGEgbm9kZSBzcGVjICovDQo+
Pj4gQEAgLTU2MSwxMCArNTYyLDE1IEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3Jt
X2RlZmF1bHRfcG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4+ICAgCQkJYm9vdF9kaXNwbGF5ID0g
bm9kZTsNCj4+PiAgIAkJCWJyZWFrOw0KPj4+ICAgCQl9DQo+Pj4gKw0KPj4+ICAgCQlmb3Jf
ZWFjaF9ub2RlX2J5X3R5cGUobm9kZSwgImRpc3BsYXkiKSB7DQo+Pj4gKwkJCWNoYXIgKmJ1
ZlsxNF07DQo+Pj4gICAJCQlpZiAoIW9mX2dldF9wcm9wZXJ0eShub2RlLCAibGludXgsb3Bl
bmVkIiwgTlVMTCkgfHwgbm9kZSA9PSBib290X2Rpc3BsYXkpDQo+Pj4gICAJCQkJY29udGlu
dWU7DQo+Pj4gLQkJCW9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobm9kZSwgIm9mLWRpc3Bs
YXkiLCBOVUxMKTsNCj4+PiArCQkJcmV0ID0gc25wcmludGYoYnVmLCAib2YtZGlzcGxheS0l
ZCIsIGRpc3BsYXlfbnVtYmVyKyspOw0KDQpQbGF0Zm9ybSBkZXZpY2VzIHVzZSBhIHNpbmds
ZSBkb3QgKC4pIGFzIHNlcGFyYXRvciBiZWZvcmUgdGhlIGluZGV4LiANCkNvdW50aW5nIHN0
YXJ0cyBhdCB6ZXJvLiBTZWUgL3N5cy9idXMvcGxhdGZvcm0vIGZvciBleGFtcGxlcy4gQ2Fu
IHdlIA0KcGxlYXNlIHN0aWNrIHdpdGggdGhhdCBzY2hlbWU/IEdlbmVyYXRlZCBuYW1lcyB3
b3VsZCB0aGVuIGJlIA0Kb2YtZGlzcGxheS4wLCBvZi1kaXNwbGF5LjEsIGV0Yy4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KDQoNCj4+PiArCQkJaWYgKHJldCA+PSBzaXplb2YoYnVm
KSkNCj4+PiArCQkJCWNvbnRpbnVlOw0KPj4+ICsJCQlvZl9wbGF0Zm9ybV9kZXZpY2VfY3Jl
YXRlKG5vZGUsIGJ1ZiwgTlVMTCk7DQo+Pj4gICAJCX0NCj4+PiAgIA0KPj4+ICAgCX0gZWxz
ZSB7DQo+Pj4gLS0gDQo+Pj4gMi4zNS4zDQo+Pj4NCj4+DQo+PiBUaGFuayB5b3UgZm9yIHRo
ZSBwYXRjaCBNaWNoYWwhDQo+Pg0KPj4gSXQgYXBwbGllcyBvbiA2LjItcmM0IGJ1dCBJIGdl
dCB0aGlzIGJ1aWxkIGVycm9yIHdpdGggbXkgY29uZmlnOg0KPiANCj4gSW5kZWVkLCBpdCdz
IGRvdWJseSBiYWQuDQo+IA0KPiBXaGVyZSBpcyB0aGUga2VybmVsIHRlc3Qgcm9ib3Qgd2hl
biB5b3UgbmVlZCBpdD8NCj4gDQo+IEl0IHNob3VsZCBub3QgYmUgdGhhdCBlYXN5IHRvIG1p
c3MgdGhpcyBmaWxlIGJ1dCBjbGVhcmx5IGl0IGNhbiBoYXBwZW4uDQo+IA0KPiBJIHdpbGwg
c2VuZCBhIGZpeHVwLg0KPiANCj4gU29ycnkgYWJvdXQgdGhlIG1lc3MuDQo+IA0KPiBUaGFu
a3MNCj4gDQo+IE1pY2hhbA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------SelpGfgpoFlxitarI50j1scj--

--------------vYwQZLIzQewlERFQlMVyGl2T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPI+KwFAwAAAAAACgkQlh/E3EQov+B1
dQ/9HvwMsyehcNa73lV+1y+Y/Z9DriFzjFhqKQEyHWfr9+IjWNDc5MFVfm5+C4NedCMlnoQxzpZV
+FyTZYEJiMpQZHEmTRIYsP/NI559FCcMTADWaQh0Hl+RVl7Fb4Y7HyuzQtqiCandy/55MWy9h07g
RgMNuKW/wfnMYTOTPEbpFVhMBPsBPigdazF8w+WL3NBypnTCwfod1ye5xzGb+mbdysVH635NAy1t
CVV5gpgGXgpL8JfsZNAKZiAyuQXr6LkusMhujKy+OiSr64g05BcAeprJ7cEcvw62OT39ZFYYFmqo
+w+44p1IGN1Fr0TsgaRrnMt7RBSw9l5N7/p0baSWeqvnMy8OSosp2TQJDKz26Z2lFmcSN4yFOvhb
hbzXXMZTXFA7N8zXaR03DBtckvGbFo0txMmDC9LkuR59OXhmsD5yR6lLBXeYvRR9uhYzg0bnbH3a
CmvRsAB5iON1HSBWWLN2sHhlAy3Z6f543sgJ03wTjocpU3GLAOA16I+wv9PxQJUax4sim0/Gue+R
vnfeRSe8zTozeTPEbEPE/XgkQBU45CDnOv7hi8TvrmPnDmEnEvXaMWuLIlGamghp2BuJi1T9orRh
+xeIEv6va5Z1l92HtUI2iFOl/66W3i8RooszHc+tDrJq5pimDNORMqz6zOmdmjKzyvl6PqmvP165
ZAE=
=Ize5
-----END PGP SIGNATURE-----

--------------vYwQZLIzQewlERFQlMVyGl2T--
