Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 017301F6F6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 23:25:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jcNG3XwkzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:25:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=2001:df5:b000:5::4;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=pBN66u9Z; 
 dkim-atps=neutral
X-Greylist: delayed 572 seconds by postgrey-1.36 at bilbo;
 Fri, 12 Jun 2020 07:24:15 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jcLR1FlhzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 07:24:14 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B73038066C;
 Fri, 12 Jun 2020 09:14:39 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1591910079;
 bh=gnWZOIGjj8uxjcxUa9qLsZsnfaNKGQItVqVlx322Hlw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=pBN66u9ZEJJr0Kes6F7JMsCQdMA5uU0dLv8pSJmbakizxssJzSYuBomcct8CSdCnt
 2CVuUL5QFx/q0lsdsM/9p7e287POfLVvolrPyvPjzoj/q+rtNoenqS7/4P32y1XgDK
 LP4MRa387qeIZiqkdUew6iO4qpUoa3SzMkv+BcU7lQIOel9iLHoqQwguG5vILjzjfC
 NXasZBtc272cXBKF02y2JdtVhA4ffXc6bfWpHYfVlioUYCrel+HGW/Ld/bKm+5ENws
 OIms4SD+B7PiOhpEBmZ52m3jSaJ+4U6m2sEn8HA0vmtXn4JidbG1Noga0NcMdXOUZ3
 Q5dwfXPGPfzgA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ee29ec00000>; Fri, 12 Jun 2020 09:14:40 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Jun 2020 09:14:39 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Fri, 12 Jun 2020 09:14:39 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>, "christophe.leroy@c-s.fr"
 <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2] powerpc: Remove inaccessible CMDLINE default
Thread-Topic: [PATCH v2] powerpc: Remove inaccessible CMDLINE default
Thread-Index: AQHWP6I/tXmW8ZPpE0iYl1XQldsjyajSHuIAgAEDTwA=
Date: Thu, 11 Jun 2020 21:14:38 +0000
Message-ID: <ab4db077-ae04-ada3-5bb0-79bfb0c94137@alliedtelesis.co.nz>
References: <20200611034140.9133-1-chris.packham@alliedtelesis.co.nz>
 <34bb20ad-8522-6071-7a36-9f615204561f@csgroup.eu>
In-Reply-To: <34bb20ad-8522-6071-7a36-9f615204561f@csgroup.eu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF0974C74629824FB29421077D9A1B0F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiAxMS8wNi8yMCA1OjQ2IHBtLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPg0KPg0KPiBM
ZSAxMS8wNi8yMDIwIMOgIDA1OjQxLCBDaHJpcyBQYWNraGFtIGEgw6ljcml0wqA6DQo+PiBTaW5j
ZSBjb21taXQgY2JlNDZiZDRmNTEwICgicG93ZXJwYzogcmVtb3ZlIENPTkZJR19DTURMSU5FICNp
ZmRlZiBtZXNzIikNCj4+IENPTkZJR19DTURMSU5FIGhhcyBhbHdheXMgaGFkIGEgdmFsdWUgcmVn
YXJkbGVzcyBvZiBDT05GSUdfQ01ETElORV9CT09MLg0KPj4NCj4+IEZvciBleGFtcGxlOg0KPj4N
Cj4+IMKgICQgbWFrZSBBUkNIPXBvd2VycGMgZGVmY29uZmlnDQo+PiDCoCAkIGNhdCAuY29uZmln
DQo+PiDCoCAjIENPTkZJR19DTURMSU5FX0JPT0wgaXMgbm90IHNldA0KPj4gwqAgQ09ORklHX0NN
RExJTkU9IiINCj4+DQo+PiBXaGVuIGVuYWJsaW5nIENPTkZJR19DTURMSU5FX0JPT0wgdGhpcyB2
YWx1ZSBpcyBrZXB0IG1ha2luZyB0aGUgJ2RlZmF1bHQNCj4+ICIuLi4iIGlmIENPTkZJR19DTURM
SU5FX0JPT0wnIGluZWZmZWN0aXZlLg0KPj4NCj4+IMKgICQgLi9zY3JpcHRzL2NvbmZpZyAtLWVu
YWJsZSBDT05GSUdfQ01ETElORV9CT09MDQo+PiDCoCAkIGNhdCAuY29uZmlnDQo+PiDCoCBDT05G
SUdfQ01ETElORV9CT09MPXkNCj4+IMKgIENPTkZJR19DTURMSU5FPSIiDQo+Pg0KPj4gUmVtb3Zl
IENPTkZJR19DTURMSU5FX0JPT0wgYW5kIHRoZSBpbmFjY2Vzc2libGUgZGVmYXVsdC4NCj4NCj4g
WW91IGFsc28gaGF2ZSB0byByZW1vdmUgYWxsIENPTkZJR19DTURMSU5FX0JPT0wgZnJvbSB0aGUg
ZGVmY29uZmlncw0KDQpPSy4gSSdsbCBkbyBzbyBhcyBhIGZvbGxvdy11cCBwYXRjaCBhbmQgc2Vu
ZCBhIHYzLg0KDQo+DQo+IENocmlzdG9waGUNCj4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
cyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+PiBSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQo+PiAtLS0N
Cj4+IEl0IHRvb2sgbWUgYSB3aGlsZSB0byBnZXQgcm91bmQgdG8gc2VuZGluZyBhIHYyLCBmb3Ig
YSByZWZyZXNoZXIgdjEgDQo+PiBjYW4gYmUgZm91bmQgaGVyZToNCj4+DQo+PiBodHRwOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAxOTA4MDIwNTAy
MzIuMjI5NzgtMS1jaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnovIA0KPj4NCj4+DQo+
PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBSZWJhc2Ugb24gdG9wIG9mIExpbnVzJ3MgdHJlZQ0KPj4g
LSBGaXggc29tZSB0eXBvcyBpbiBjb21taXQgbWVzc2FnZQ0KPj4gLSBBZGQgcmV2aWV3IGZyb20g
Q2hyaXN0b3BoZQ0KPj4gLSBSZW1vdmUgQ09ORklHX0NNRExJTkVfQk9PTA0KPj4NCj4+IMKgIGFy
Y2gvcG93ZXJwYy9LY29uZmlnIHwgNiArLS0tLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPj4gaW5kZXggOWZhMjNlYjMyMGZm
Li41MWFiYzU5YzMzMzQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPj4g
KysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4+IEBAIC04NTksMTIgKzg1OSw4IEBAIGNvbmZp
ZyBQUENfREVOT1JNQUxJU0FUSU9ODQo+PiDCoMKgwqDCoMKgwqDCoCBBZGQgc3VwcG9ydCBmb3Ig
aGFuZGxpbmcgZGVub3JtYWxpc2F0aW9uIG9mIHNpbmdsZSBwcmVjaXNpb24NCj4+IMKgwqDCoMKg
wqDCoMKgIHZhbHVlcy7CoCBVc2VmdWwgZm9yIGJhcmUgbWV0YWwgb25seS7CoCBJZiB1bnN1cmUg
c2F5IFkgaGVyZS4NCj4+IMKgIC1jb25maWcgQ01ETElORV9CT09MDQo+PiAtwqDCoMKgIGJvb2wg
IkRlZmF1bHQgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIg0KPj4gLQ0KPj4gwqAgY29uZmln
IENNRExJTkUNCj4+IC3CoMKgwqAgc3RyaW5nICJJbml0aWFsIGtlcm5lbCBjb21tYW5kIHN0cmlu
ZyIgaWYgQ01ETElORV9CT09MDQo+PiAtwqDCoMKgIGRlZmF1bHQgImNvbnNvbGU9dHR5UzAsOTYw
MCBjb25zb2xlPXR0eTAgcm9vdD0vZGV2L3NkYTIiIGlmIA0KPj4gQ01ETElORV9CT09MDQo+PiAr
wqDCoMKgIHN0cmluZyAiSW5pdGlhbCBrZXJuZWwgY29tbWFuZCBzdHJpbmciDQo+PiDCoMKgwqDC
oMKgIGRlZmF1bHQgIiINCj4+IMKgwqDCoMKgwqAgaGVscA0KPj4gwqDCoMKgwqDCoMKgwqAgT24g
c29tZSBwbGF0Zm9ybXMsIHRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkgZm9yIHRoZSBib290IA0K
Pj4gbG9hZGVyIHRvDQo+Pg==
