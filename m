Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01E80C9C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2019 22:34:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461t0p6fPZzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 06:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=202.36.163.20; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="zJokoDCE"; dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461syr6yTnzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 06:32:36 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 02B0E806B6;
 Mon,  5 Aug 2019 08:32:32 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1564950752;
 bh=tegd89vFijqIdzQ79b+Q5otg8XB6JewNAHl+LPZxs3c=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=zJokoDCE2lcUhCqwcSEoDKECNj2ns65Q+tYzjHGiF8BlUTjSvXs/vbiL01duVCCnD
 TC/g/FMDGWhXIjq8VPu+UwnLTIVMp7Te25fW2B/mCByrx6ZgB58GMG5Txm9kgqOFoC
 vKQ+x9YLajFWOfaZhPjHQvAMHE1kf5HZg4PjGiyb3Pm5uROAT/SaYI91rSPHgQmjY9
 MbtC/VzMim6SgKzKk4jU9s0jr8287ytrwA85Fm6Pl+W+6YM4T0BZb6THrXzYtxoSJU
 uGDPaNF7N44/GM/C6vdsqnwZAPTlBfgcHdQ4BglKOdZNRiG1X6kxbkFhTmfZDgXXWG
 IvxUFb8iMt/NQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d4740da0000>; Mon, 05 Aug 2019 08:32:31 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Mon, 5 Aug 2019 08:32:26 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Mon, 5 Aug 2019 08:32:26 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Remove inaccessible CMDLINE default
Thread-Topic: [PATCH] powerpc: Remove inaccessible CMDLINE default
Thread-Index: AQHVSO+BYedDSPkTQUuUDGl4P2DrBqbmiHsAgAQj8AA=
Date: Sun, 4 Aug 2019 20:32:26 +0000
Message-ID: <1564950746.27215.3.camel@alliedtelesis.co.nz>
References: <20190802050232.22978-1-chris.packham@alliedtelesis.co.nz>
 <43422528-c2fc-a2c8-49e6-0f6b2c791648@c-s.fr>
In-Reply-To: <43422528-c2fc-a2c8-49e6-0f6b2c791648@c-s.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D07377008B989F47A25F2C2948D1A0FB@atlnz.lc>
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

T24gRnJpLCAyMDE5LTA4LTAyIGF0IDA3OjE4ICswMjAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiANCj4gTGUgMDIvMDgvMjAxOSDDoCAwNzowMiwgQ2hyaXMgUGFja2hhbSBhIMOpY3JpdMKg
Og0KPiA+IA0KPiA+IFNpbmNlIGNvbW1pdCBjYmU0NmJkNGY1MTAgKCJwb3dlcnBjOiByZW1vdmUg
Q09ORklHX0NNRExJTkUgI2lmZGVmDQo+ID4gbWVzcyIpDQo+ID4gQ09ORklHX0NNRExJTkUgaGFz
IGFsd2F5cyBoYWQgYSB2YWx1ZSByZWdhcmRsZXNzIG9mDQo+ID4gQ09OTklHX0NNRExJTkVfQk9P
TC4NCj4gcy9DT05OSUcvQ09ORklHLw0KPiANCj4gPiANCj4gPiANCj4gPiBGb3IgZXhhbXBsZToN
Cj4gPiANCj4gPiDCoCAkIG1ha2UgQVJDSD1wb3dlcnBjIGRlZmNvbmZpZw0KPiA+IMKgICQgY2F0
IC5jb25maWcNCj4gPiDCoCAjIENPTkZJR19DTURMSU5FX0JPT0wgaXMgbm90IHNldA0KPiA+IMKg
IENPTkZJR19DTURMSU5FPSIiDQo+ID4gDQo+ID4gV2hlbiBlbmFibGluZyBDT05OSUdfQ01ETElO
RV9CT09MIHRoaXMgdmFsdWUgaXMga2VwdCBtYWtpbmcgdGhlDQo+ID4gJ2RlZmF1bHQNCj4gPiAi
Li4uIiBpZiBDT05OSUdfQ01ETElORV9CT09MJyBpbmVmZmVjdGl2ZS4NCj4gcy9DT05OSUcvQ09O
RklHLw0KPiANCg0KV2lsbCBmaXggaW4gdjIuDQoNCj4gPiANCj4gPiANCj4gPiDCoCAkIC4vc2Ny
aXB0cy9jb25maWcgLS1lbmFibGUgQ09ORklHX0NNRExJTkVfQk9PTA0KPiA+IMKgICQgY2F0IC5j
b25maWcNCj4gPiDCoCBDT05GSUdfQ01ETElORV9CT09MPXkNCj4gPiDCoCBDT05GSUdfQ01ETElO
RT0iIg0KPiA+IA0KPiA+IEFkZGl0aW9uYWxseSBhbGwgdGhlIGluLXRyZWUgcG93ZXJwYyBkZWZj
b25maWdzIHRoYXQgc2V0DQo+ID4gQ09ORklHX0NNRExJTkVfQk9PTD15IGFsc28gc2V0IENPTkZJ
R19DTURMSU5FIHRvIHNvbWV0aGluZyBlbHNlLg0KPiA+IEZvcg0KPiA+IHRoZXNlIHJlYXNvbnMg
cmVtb3ZlIHRoZSBpbmFjY2Vzc2libGUgZGVmYXVsdC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+IFJl
dmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4NCj4g
DQo+ID4gDQo+ID4gLS0tDQo+ID4gVGhpcyBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgaHR0cDov
L3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzExNA0KPiA+IDA4MTEvIGJ1dA0KPiA+IEkndmUg
Z2VuZXJhdGVkIHRoaXMgcGF0Y2ggb24gYSBzdHJlYW0gdGhhdCBoYXMgaXQgYXBwbGllZCBsb2Nh
bGx5Lg0KPiA+IA0KPiA+IMKgIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgMSAtDQo+ID4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiA+IGluZGV4IGQ0MTNmZTFi
NDA1OC4uNmZjYTZlYmE2YWVlIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmln
DQo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gPiBAQCAtODQ0LDcgKzg0NCw2IEBA
IGNvbmZpZyBDTURMSU5FX0JPT0wNCj4gPiDCoMKgDQo+ID4gwqAgY29uZmlnIENNRExJTkUNCj4g
PiDCoMKgCXN0cmluZyAiSW5pdGlhbCBrZXJuZWwgY29tbWFuZCBzdHJpbmciIGlmIENNRExJTkVf
Qk9PTA0KPiA+IC0JZGVmYXVsdCAiY29uc29sZT10dHlTMCw5NjAwIGNvbnNvbGU9dHR5MCByb290
PS9kZXYvc2RhMiINCj4gPiBpZiBDTURMSU5FX0JPT0wNCj4gPiDCoMKgCWRlZmF1bHQgIiINCj4g
PiDCoMKgCWhlbHANCj4gPiDCoMKgCcKgwqBPbiBzb21lIHBsYXRmb3JtcywgdGhlcmUgaXMgY3Vy
cmVudGx5IG5vIHdheSBmb3IgdGhlDQo+ID4gYm9vdCBsb2FkZXIgdG8NCj4gPiANCj4gSSB0aGlu
ayB3ZSBjb3VsZCBhbHNvIGdldCByaWQgb2YgQ01ETElORV9CT09MIHRvdGFsbHkgYW5kIHVzZSBD
TURMSU5FDQo+ICE9wqANCj4gIiIgaW5zdGVhZC4NCg0KVGhlIG9ubHkgcmVhc29uIEkgY2FuIHNl
ZSB0byBrZWVwIENNRExJTkVfQk9PTCBpcyB0aGF0IGl0IGhpZGVzIHRoZQ0KdGV4dCBpbnB1dCBm
b3LCoENNRExJTkUgd2hpY2ggc2VlbXMgdG8gYmUgYSBwYXR0ZXJuIGluIEtjb25maWcuIEhhcHB5
IHRvDQpyZW1vdmUgaXQgaWYgdGhhdCdzIHRoZSBjb25zZW5zdXMuwqANCg0KSSdsbCB3YWl0IGZv
ciB0aGUgZHVzdCB0byBzZXR0bGUgb24gbXkgb3RoZXIgcGF0Y2ggYmVmb3JlIHNlbmRpbmcgYSB2
Mg0Kb2YgdGhpcyBvbmUuDQoNCj4gDQo+IENocmlzdG9waGU=
