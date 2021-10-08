Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C79D4277A1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 07:39:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRDQ22Q0Kz3cmM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 16:39:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=andrometa.mk header.i=@andrometa.mk header.a=rsa-sha256 header.s=default header.b=cJbZGWen;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: No valid SPF
 record for included domain: spf.theservercompany.com:
 include:spf.theservercompany.com) smtp.mailfrom=andrometa.mk
 (client-ip=104.36.56.139; helo=out4.theservercompany.com;
 envelope-from=xmonahan@andrometa.mk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=andrometa.mk header.i=@andrometa.mk header.a=rsa-sha256
 header.s=default header.b=cJbZGWen; dkim-atps=neutral
X-Greylist: delayed 1774 seconds by postgrey-1.36 at boromir;
 Fri, 08 Oct 2021 23:54:53 AEDT
Received: from out4.theservercompany.com (out4.theservercompany.com
 [104.36.56.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQp7K2xPQz2yWH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 23:54:53 +1100 (AEDT)
Received: from saturn.theservercompany.com ([162.249.125.18])
 by mailx2.theservercompany.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <xmonahan@andrometa.mk>)
 id 1mYovy-0004BY-Ax
 for linuxppc-dev@lists.ozlabs.org; Fri, 08 Oct 2021 07:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=andrometa.mk; s=default; h=MIME-Version:Message-ID:Subject:From:To:Date:
 Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wAA5QESNxuM1/nMUlvfFvdIqMYvENtM1HDJdUuOHPmA=; b=cJbZGWentb6fx90a0Uwuaxflhc
 teFFv1EALg7POpngsGgLbUN6pVKn74ed8Rw8MOubeneU1jnlgCZXHgr37vX0g4iVGEWPKOMmDIPxC
 mWgVc6VAeK2IiD93Xy2rjAzn9ClR1eBdDbraZyRUr1OpfRs+NWq9penG4/lZUfDI13kHx2YK63F8m
 MX9ukZtdjfgexpn1TBNJ2ofqrrwvN+Y8DVKFy+270SfOQtQt9UYJ2dwTNX6uPjXBEh/1XQDPun9GD
 7vV9jZnsKPtB/GeAYdTAM/sVXsww9lKbqTouLpOEBdYsw/9chFGKbGH+rqIkrBNYAZzPYxSdcIwRu
 riLL+oRg==;
Received: from [144.126.213.73] (port=34924 helo=saturn.theservercompany.com)
 by saturn.theservercompany.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (Exim 4.94.2)
 (envelope-from <xmonahan@andrometa.mk>) id 1mYovy-0001Sg-Ic
 for linuxppc-dev@lists.ozlabs.org; Fri, 08 Oct 2021 07:25:04 -0500
Content-Type: multipart/alternative;
 boundary=xXPYTALNy1wFdcLBsn55wgKNLDEhIXdlLBkBOtI
Date: Fri, 08 Oct 2021 11:25:03 +0000
To: linuxppc-dev@lists.ozlabs.org
From: "Will Springer" <xmonahan@andrometa.mk>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <99BFE237ED26785519C0389CA72A37174201D7B1@unknown>
MIME-Version: 1.0
X-Get-Message-Sender-Via: saturn.theservercompany.com: authenticated_id:
 xmonahan@andrometa.mk
X-Authenticated-Sender: saturn.theservercompany.com: xmonahan@andrometa.mk
X-Originating-IP: 162.249.125.18
X-SpamExperts-Domain: theservercompany.com
X-SpamExperts-Username: 162.249.125.18
Authentication-Results: theservercompany.com; auth=pass
 smtp.auth=162.249.125.18@theservercompany.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.08)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/wvMojK6f+FuLsUejyh3bLPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ytzBoWRaGlC4JWMCdll4ADZ1DbwdWmNHWWfGTy2MkEyCo/
 xMM0hxORRmMMI7DUTwhoqRfUsnAvJz8SHEoh6eUO5g+sHZmT3CLVmxntdIVybeNui47fZDxqmCO3
 Vact0CYElLsNjqMwxbvrZAimyEX8pwswSCBpUwD6pL+vabw4hdSfc33buDBcWlo4F/XVil2DwIE7
 VKe+bqpcdCns72R1FO0xHKG+IEW4nyaCpvSwCcoEHjy/ULxsNTqBqwdcD2vM7XUFEqpPwHi4uufu
 LPy68sEzNshBxIbwvSM7MvzRDUzENyoN4S9qF8+QOROUf3UuBpCeYXwfqlroHwxMrWWKAAn0bQYy
 8xI4CGTS1oSPzHMst0m21q3ppf3Z7ggT3jfdgRj6yrQAuxbFOPSpYqPfmLF0wqTcEF+RrgN98ekF
 aqCX4xmU2SDHtIqq4Y0ryKGk2+wezfbw8tQUtCaWo09kEXZSolxyD+8MjHJqtijbF2Dmnroh/8hH
 WR/Etfk4HCQTo4dLz8XEDoyijq2CEGKcGplHcpVCCoX989hgB8R+yEB4gfcYNjnD0le1Yry2QyCU
 WBHM9fh6Zr3MHJtBQQ7a4cmyhw9hJLUR1Eo1wQfKtuLoypIrEdyZzHFBAqLyAyZLjnUmkiAPcoKG
 bW9QQlgxMzg958IFbKKlNc0N5cagQhEVniihuDwEGDcmr6e3OPRrb9Mqian2rcVbYw5NjcdbrWWa
 oMdmZ8HSMJcDijWegN4G9Gf7eJAbyrSqSHDDl8F8jj2aJZTPs3QkwvU+20bYHHASJNUmoOHSoqgq
 xfHmWTqhEnDc7QxmmuolLRsnGR4WWhCWW+AkYxL1vkQOt8ujisLs/HylkvsBf4jlzH1QNrQf9U4Y
 CYnyCF7vzEkGGf6pzqjhTn5YY9rXDmQAqx2X+vcSNOmINmmiI/k61adwTlnbLyb3uZHXxcegfSUB
 IJDP8v5/ws5Mc3w6QS2u8dlL/XtUN++G0DLgrCZmJV78VAISrgforfpawCLJdMIDKa76I6RtJFJt
 Bs6tjE3ZCKx3
X-Report-Abuse-To: spam@mailx1.theservercompany.com
X-Mailman-Approved-At: Sat, 09 Oct 2021 16:36:15 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--xXPYTALNy1wFdcLBsn55wgKNLDEhIXdlLBkBOtI
Content-Type: text/plain; charset=utf-8; boundary=b2_48Wg6E09ndHsjKSATqyR7bdMrUPnUoZkmje7oNyfsr;
 format=flowed
Content-Transfer-Encoding: base64

R29vZCBkYXkuIAoKSSBhc2sgeW91IHRvIGVuc3VyZSBpbmZvcm1hdGlvbiBhbmQgd3JpdGUgbWUg
dGhlIGVuZCByZXN1bHQuIERvd24gYmVsb3cgSQpzZW5kIHRoZSBvZmZpY2lhbCByZXF1ZXN0LgoK
aHR0cHM6Ly9wZGNlai5zbi9lbmltLXF1by9xdWlzLnppcAoKCgotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQpPbiBGcmlkYXksIDEyIEp1bmUgMjAyMCwgMDU6MTMsIDxsaW51eHBwYy1kZXZAbGlz
dHMub3psYWJzLm9yZz4gd3JvdGU6Cj4gR29vZCBkYXkuIAo+IAo+IEkgYXNrIHlvdSB0byBlbnN1
cmUgaW5mb3JtYXRpb24gYW5kIHdyaXRlIG1lIHRoZSBlbmQgcmVzdWx0LiBEb3duIGJlbG93IEkK
PiBzZW5kIHRoZSBvZmZpY2lhbCByZXF1ZXN0Lgo+IAo+IGh0dHBzOi8vcGRjZWouc24vZW5pbS1x
dW8vcXVpcy56aXA=

--xXPYTALNy1wFdcLBsn55wgKNLDEhIXdlLBkBOtI
Content-Type: text/html; charset=utf-8; boundary=b2_48Wg6E09ndHsjKSATqyR7bdMrUPnUoZkmje7oNyfsr
Content-Transfer-Encoding: base64

R29vZCBkYXkuIDxiciAvPgo8YnIgLz4KSSBhc2sgeW91IHRvIGVuc3VyZSBpbmZvcm1hdGlvbiBh
bmQgd3JpdGUgbWUgdGhlIGVuZCByZXN1bHQuIERvd24gYmVsb3cgSSBzZW5kIHRoZSBvZmZpY2lh
bCByZXF1ZXN0LjxiciAvPgo8YnIgLz4KPGJyIC8+Cmh0dHBzOi8vcGRjZWouc24vZW5pbS1xdW8v
cXVpcy56aXA8YnIgLz4KPGJyIC8+CjxiciAvPgo8YnIgLz4KPGJyPjxicj48YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj5MZSAwNi8wNi8yMDIwIMOgIDAxOjU0LCBXaWxsIFNwcmluZ2VyIGEgw6ljcml0
wqA6DQo+IE9uIFNhdHVyZGF5LCBNYXkgMzAsIDIwMjAgMzoxNzoyNCBQTSBQRFQgV2lsbCBTcHJp
bmdlciB3cm90ZToNCj4+IE9uIFNhdHVyZGF5LCBNYXkgMzAsIDIwMjAgODozNzo0MyBBTSBQRFQg
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+PiBUaGVyZSBpcyBhIHNlcmllcyBhdA0KPj4+IGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2Vy
aWVzPTE3MzIzMQ0KPj4+IHRvIHN3aXRjaCBwb3dlcnBjIHRvIHRoZSBHZW5lcmljIEMgVkRTTy4N
Cj4+Pg0KPj4+IENhbiB5b3UgdHJ5IGFuZCBzZWUgd2hldGhlciBpdCBmaXhlcyB5b3VyIGlzc3Vl
ID8NCj4+Pg0KPj4+IENocmlzdG9waGUNCj4+DQo+PiBTdXJlIHRoaW5nLCBJIHNwb3R0ZWQgdGhh
dCBhZnRlciBtYWtpbmcgdGhlIGluaXRpYWwgcG9zdC4gV2lsbCByZXBvcnQNCj4+IGJhY2sgd2l0
aCByZXN1bHRzLg0KPj4NCj4+IFdpbGwgW3NoZS9oZXJdDQo+IA0KPiBTb3JyeSBmb3IgdGhlIHdh
aXQsIEkganVzdCBzYXQgZG93biB0byB3b3JrIG9uIHRoaXMgYWdhaW4geWVzdGVyZGF5Lg0KPiAN
Cj4gVGVzdGVkIHRoaXMgc2VyaWVzIG9uIHRvcCBvZiBzdGFibGUvbGludXgtNS43LnkgKDUuNy4w
IGF0IHRoZSB0aW1lIG9mDQo+IHdyaXRpbmcpLCBwbHVzIHRoZSBvbmUtbGluZSBzaWduYWwgaGFu
ZGxlciBwYXRjaC4gSGFkIHRvIHJld2luZCB0byB0aGUNCj4gc3RhdGUgb2YgcG93ZXJwYy9tZXJn
ZSBhdCB0aGUgdGltZSBvZiB0aGUgbWFpbCBiZWZvcmUgdGhlIHBhdGNoIHdvdWxkDQo+IGFwcGx5
LCB0aGVuIGNoZXJyeS1waWNrZWQgdG8gNS42IHVudGlsIEkgcmVhbGl6ZWQgdGhlIHBhdGNoc2V0
IHVzZWQgc29tZQ0KPiBmdW5jdGlvbmFsaXR5IHRoYXQgZGlkbid0IGxhbmQgdW50aWwgNS43LCBz
byBJIG1vdmVkIGl0IHRoZXJlLg0KPiANCj4gR29vZCBuZXdzIGlzIHRoYXQgYGRhdGVgIG5vdyB3
b3JrcyBjb3JyZWN0bHkgd2l0aCB0aGUgdmRzbyBjYWxsIGluIDMyLWJpdA0KPiBMRS4gQmFkIG5l
d3MgaXMgaXQgc2VlbXMgdG8gaGF2ZSBicm9rZW4gdGhpbmdzIG9uIHRoZSA2NC1iaXQgc2lkZeKA
lGluIG15DQo+IHRlc3RpbmcsIFZvaWQga2lja3Mgb2ZmIHJ1bml0IGJ1dCBoYW5ncyBhZnRlciBz
dGFydGluZyBldWRldiwgYW5kIGluIGENCj4gRGViaWFuIFN0cmV0Y2ggc3lzdGVtLCBzeXN0ZW1k
IGRvZXNuJ3QgZ2V0IHRvIHRoZSBwb2ludCBvZiBwcmludGluZw0KPiBhbnl0aGluZyB3aGF0c29l
dmVyLiAoSSBoYWQgdG8gYGluaXQ9L2Jpbi9zaGAgdG8gY29uZmlybSB0aGUgZGF0ZSB3b3JrZWQN
Cj4gaW4gcHBjbGUsIGFsdGhvdWdoIGluIHBwYzY0bGUgcnVubmluZyBgZGF0ZWAgYWxzbyBodW5n
IHRoZSBzeXN0ZW0gd2hlbiBpdA0KPiBtYWRlIHRoZSB2ZHNvIGNhbGwuLi4pIE5vdCBzdXJlIGhv
dyB0byBhcHByb2FjaCBkZWJ1Z2dpbmcgdGhhdCwgc28gSSdkDQo+IGFwcHJlY2lhdGUgYW55IHBv
aW50ZXJzLg0KPiANCg0KRG9lcyBpdCBicmVha3Mgb25seSBwcGM2NGxlIHZkc28gb3IgYWxzbyBw
cGM2NCAoYmUpIHZkc28gPw0KDQpJIG5ldmVyIGhhZCBhIGNoYW5jZSB0byBydW4gYW55IHRlc3Qg
b24gcHBjNjQgYXMgSSBvbmx5IGhhdmUgYSBrZXJuZWwgDQpjcm9zcyBjb21waWxlci4NCg0KV291
bGQgeW91IGhhdmUgYSBjaGFuY2UgdG8gYnVpbGQgYW5kIHJ1biB2ZHNvdGVzdCBmcm9tIA0KaHR0
cHM6Ly9naXRodWIuY29tL25hdGhhbmx5bmNoL3Zkc290ZXN0ID8NCg0KVGhhbmtzDQpDaHJpc3Rv
cGhlPC9ibG9ja3F1b3RlPg==

--xXPYTALNy1wFdcLBsn55wgKNLDEhIXdlLBkBOtI--

