Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DA283EC5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 03:26:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463DPJ61HDzDr7q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 11:26:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=2001:df5:b000:5::4; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="udSYYdfx"; dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463DMP0dQSzDqZn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 11:25:04 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DB4D5806B6;
 Wed,  7 Aug 2019 13:24:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1565141098;
 bh=NFlLBn2JV7v8pBHBLSUcdS03HMSv57kUh8u63eTX6YU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=udSYYdfxXX1IdM2ZDF8A5i4jz3jUVTi5IOg/7VyIInW0plVCb+nTVgKAFnArmARqT
 yD3B6+ipmXGy8nesQlwDvUE4LSd4GJxqeAmuWG3w+rMJ4VL+gI9dn15DTENNZ9b4nV
 4Hz7yVxYoZVygO9YOWqv5PYRsNYxUOG4wngvbAKyr7MNaEKuLsfQFyd2puv2n/9vg1
 cN7GNVzK+QaAYPYixEy6wFhkSjU1VZbAjQnNjC5vy8mSnjwjRrKQA+PBltYAwHwjxB
 cm3IrgKEVMi6YggQf4y+ftrbuEX9MzzrK5fHnBhzJzhxaNKeuVwcltGafQZM9iWSvh
 TAFFA18w4uOog==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d4a28680000>; Wed, 07 Aug 2019 13:24:57 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Wed, 7 Aug 2019 13:24:57 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Wed, 7 Aug 2019 13:24:57 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: SMP lockup at boot on Freescale/NXP T2080 (powerpc 64)
Thread-Topic: SMP lockup at boot on Freescale/NXP T2080 (powerpc 64)
Thread-Index: AQHVSzJiQ9f053Ig/kuwEclH36qTsqbrdSqAgAHAlICAAM4IAIAAF2MAgAADIIA=
Date: Wed, 7 Aug 2019 01:24:57 +0000
Message-ID: <1565141097.19352.12.camel@alliedtelesis.co.nz>
References: <1564970785.27215.29.camel@alliedtelesis.co.nz>
 <4525a16cd3e65f89741b50daf2ec259b6baaab78.camel@alliedtelesis.co.nz>
 <87wofqv8a0.fsf@concordia.ellerman.id.au>
 <1565135404.16914.5.camel@alliedtelesis.co.nz>
 <87o911vktx.fsf@concordia.ellerman.id.au>
In-Reply-To: <87o911vktx.fsf@concordia.ellerman.id.au>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2FF9D2D5CDF084E904DF44AE39C536E@atlnz.lc>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant
 McEwan <grant.mcewan@alliedtelesis.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDE5LTA4LTA3IGF0IDExOjEzICsxMDAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Og0KPiBDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+IHdy
aXRlczoNCj4gPiANCj4gPiBPbiBUdWUsIDIwMTktMDgtMDYgYXQgMjE6MzIgKzEwMDAsIE1pY2hh
ZWwgRWxsZXJtYW4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IENocmlzIFBhY2toYW0gPENocmlzLlBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JpdGVzOg0KPiA+ID4gPiANCj4gPiA+ID4gT24g
TW9uLCAyMDE5LTA4LTA1IGF0IDE0OjA2ICsxMjAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhpIEFsbCwNCj4gPiA+ID4gPiANCj4gPiA+
ID4gPiBJIGhhdmUgYSBjdXN0b20gYm9hcmQgdGhhdCB1c2VzIHRoZSBGcmVlc2NhbGUvTlhQIFQy
MDgwIFNvQy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGUgYm9hcmQgYm9vdHMgZmluZSB1c2lu
ZyB2NC4xOS42MCBidXQgd2hlbiBJIHVzZSB2NS4xLjIxIGl0DQo+ID4gPiA+ID4gbG9ja3MNCj4g
PiA+ID4gPiB1cA0KPiA+ID4gPiA+IHdhaXRpbmcgZm9yIHRoZSBvdGhlciBDUFVzIHRvIGNvbWUg
b25saW5lIChlYXJseXByaW50ayBvdXRwdXQNCj4gPiA+ID4gPiBiZWxvdykuDQo+ID4gPiA+ID4g
SWYgSSBzZXQgbWF4Y3B1cz0wIHRoZW4gdGhlIHN5c3RlbSBib290cyBhbGwgdGhlIHdheSB0aHJv
dWdoDQo+ID4gPiA+ID4gdG8NCj4gPiA+ID4gPiB1c2VybGFuZC4gVGhlIHNhbWUgdGhpbmcgaGFw
cGVucyB3aXRoIDUuMy1yYzIuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhlIGRlZmNvbmZpZyBJ
J20gdXNpbmcgaXPCoA0KPiA+ID4gPiA+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2NwYWNraGFt
L2YyNGQwYjQyNmYzDQo+ID4gPiA+ID4gZGUwZWFhYmExN2I4MmMzNTI4YTlkIGl0IHdhcyB1cGRh
dGVkIGZyb20gdGhlIHdvcmtpbmcNCj4gPiA+ID4gPiB2NC4xOS42MA0KPiA+ID4gPiA+IGRlZmNv
bmZpZyB1c2luZyBtYWtlIG9sZGRlZmNvbmZpZy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBEb2Vz
IHRoaXMgcmluZyBhbnkgYmVsbHMgZm9yIGFueW9uZT8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJ
IGhhdmVuJ3QgZHVnIGludG8gdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHdvcmtpbmcgYW4N
Cj4gPiA+ID4gPiBub24tDQo+ID4gPiA+ID4gd29ya2luZw0KPiA+ID4gPiA+IHZlcnNpb25zIHll
dC4gSSdsbCBzdGFydCBsb29raW5nIG5vdy4NCj4gPiA+ID4gSSd2ZSBiaXNlY3RlZCB0aGlzIHRv
IHRoZSBmb2xsb3dpbmcgY29tbWl0DQo+ID4gPiBUaGFua3MgdGhhdCdzIHN1cGVyIGhlbHBmdWwu
DQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBjb21taXQgZWQxY2Q2ZGViMDEz
YTExOTU5ZDE3YTk0ZTM1Y2UxNTkxOTc2MzJkYQ0KPiA+ID4gPiBBdXRob3I6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPg0KPiA+ID4gPiBEYXRlOsKgwqDCoFRodSBK
YW4gMzEgMTA6MDg6NTggMjAxOSArMDAwMA0KPiA+ID4gPiANCj4gPiA+ID4gwqDCoMKgwqBwb3dl
cnBjOiBBY3RpdmF0ZSBDT05GSUdfVEhSRUFEX0lORk9fSU5fVEFTSw0KPiA+ID4gPiDCoMKgwqDC
oA0KPiA+ID4gPiDCoMKgwqDCoFRoaXMgcGF0Y2ggYWN0aXZhdGVzIENPTkZJR19USFJFQURfSU5G
T19JTl9UQVNLIHdoaWNoDQo+ID4gPiA+IMKgwqDCoMKgbW92ZXMgdGhlIHRocmVhZF9pbmZvIGlu
dG8gdGFza19zdHJ1Y3QuDQo+ID4gPiA+IA0KPiA+ID4gPiBJJ2xsIGJlIHRoZSBmaXJzdCB0byBh
ZG1pdCB0aGlzIGlzIHdlbGwgYmV5b25kIG15IGFyZWEgb2YNCj4gPiA+ID4ga25vd2xlZGdlDQo+
ID4gPiA+IHNvDQo+ID4gPiA+IEknbSB1bnN1cmUgd2hhdCBhYm91dCB0aGlzIHBhdGNoIGlzIHBy
b2JsZW1hdGljIGJ1dCBJIGNhbiBiZQ0KPiA+ID4gPiBmYWlybHkNCj4gPiA+ID4gc3VyZSB0aGF0
IGEgYnVpbGQgaW1tZWRpYXRlbHkgYmVmb3JlIHRoaXMgcGF0Y2ggd29ya3Mgd2hpbGUgYQ0KPiA+
ID4gPiBidWlsZA0KPiA+ID4gPiB3aXRoIHRoaXMgcGF0Y2ggaGFuZ3MuDQo+ID4gPiBJdCBtYWtl
cyBhIHByZXR0eSBmdW5kYW1lbnRhbCBjaGFuZ2UgdG8gdGhlIHdheSB0aGUga2VybmVsIHN0b3Jl
cw0KPiA+ID4gc29tZQ0KPiA+ID4gaW5mb3JtYXRpb24gYWJvdXQgZWFjaCB0YXNrLCBtb3Zpbmcg
aXQgb2ZmIHRoZSBzdGFjayBhbmQgaW50byB0aGUNCj4gPiA+IHRhc2sNCj4gPiA+IHN0cnVjdC4N
Cj4gPiA+IA0KPiA+ID4gSXQgZGVmaW5pdGVseSBoYXMgdGhlIHBvdGVudGlhbCB0byBicmVhayB0
aGluZ3MsIGJ1dCBJIHRob3VnaHQgd2UNCj4gPiA+IGhhZA0KPiA+ID4gcmVhc29uYWJsZSB0ZXN0
IGNvdmVyYWdlIG9mIHRoZSBCb29rM0UgcGxhdGZvcm1zLCBJIGhhdmUgYQ0KPiA+ID4gcDUwMjBk
cw0KPiA+ID4gKGU1NTAwKSB0aGF0IEkgYm9vdCBhcyBwYXJ0IG9mIG15IENJLg0KPiA+ID4gDQo+
ID4gPiBBaGEuIElmIEkgdGFrZSB5b3VyIGNvbmZpZyBhbmQgdHJ5IHRvIGJvb3QgaXQgb24gbXkg
cDUwMjBkcyBJIGdldA0KPiA+ID4gdGhlDQo+ID4gPiBzYW1lIGJlaGF2aW91ciwgc3R1Y2sgYXQg
U01QIGJyaW5ndXAuIFNvIGl0IHNlZW1zIGl0J3Mgc29tZXRoaW5nDQo+ID4gPiBpbg0KPiA+ID4g
eW91cg0KPiA+ID4gY29uZmlnIHZzIGNvcmVuZXQ2NF9zbXBfZGVmY29uZmlnIHRoYXQgaXMgdHJp
Z2dlcmluZyB0aGUgYnVnLg0KPiA+ID4gDQo+ID4gPiBDYW4geW91IHRyeSBiaXNlY3Rpbmcgd2hh
dCBpbiB0aGUgY29uZmlnIHRyaWdnZXJzIGl0Pw0KPiA+ID4gDQo+ID4gPiBUbyBkbyB0aGF0IHlv
dSBjaGVja291dCBlZDFjZDZkZWIwMTNhMTE5NTlkMTdhOTRlMzVjZTE1OTE5NzYzMmRhLA0KPiA+
ID4gdGhlbg0KPiA+ID4geW91IGJ1aWxkL2Jvb3Qgd2l0aCBjb3JlbmV0NjRfc21wX2RlZmNvbmZp
ZyB0byBjb25maXJtIGl0IHdvcmtzLg0KPiA+ID4gVGhlbg0KPiA+ID4geW91IHVzZSB0b29scy90
ZXN0aW5nL2t0ZXN0L2NvbmZpZy1iaXNlY3QucGwgdG8gYmlzZWN0IHRoZQ0KPiA+ID4gY2hhbmdl
cyBpbg0KPiA+ID4gdGhlIC5jb25maWcuDQo+ID4gPiANCj4gPiBUaGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIGEgd29ya2luZyBhbmQgbm9uIHdvcmtpbmcgZGVmY29uZmlnIGlzDQo+ID4gQ09ORklHX1BS
RUVNUFQgc3BlY2lmaWNhbGx5IENPTkZJR19QUkVFTVBUPXkgbWFrZXMgbXkgc3lzdGVtIGhhbmcN
Cj4gPiBhdA0KPiA+IGJvb3QuDQo+ID4gDQo+ID4gSXMgdGhhdCBub3cgaW50ZW50aW9uYWxseSBw
cm9oaWJpdGVkIG9uIDY0LWJpdCBwb3dlcnBjPw0KPiBJdCdzIG5vdCBwcm9oaWJpdGllZCwgYnV0
IGl0IHByb2JhYmx5IHNob3VsZCBiZSBiZWNhdXNlIG5vIG9uZSByZWFsbHkNCj4gdGVzdHMgaXQg
cHJvcGVybHkuIEkgaGF2ZSBhIGhhbmRmdWwgb2YgSUJNIG1hY2hpbmVzIHdoZXJlIEkgYm9vdCBh
DQo+IFBSRUVNUFQga2VybmVsIGJ1dCB0aGF0J3MgYWJvdXQgaXQuDQo+IA0KPiBUaGUgY29yZW5l
dCBjb25maWdzIGRvbid0IGhhdmUgUFJFRU1QVCBlbmFibGVkLCB3aGljaCBzdWdnZXN0cyBpdCB3
YXMNCj4gbmV2ZXIgcmVhbGx5IHN1cHBvcnRlZCBvbiB0aG9zZSBtYWNoaW5lcy4NCj4gDQo+IEJ1
dCBtYXliZSBzb21lb25lIGZyb20gTlhQIGNhbiB0ZWxsIG1lIG90aGVyd2lzZS4NCj4gDQoNCkkg
dGhpbmsgb3VyIHdvcmtsb2FkcyBuZWVkwqBDT05GSUdfUFJFRU1QVD15IGJlY2F1c2Ugb3VyIHN5
c3RlbXMgaGF2ZQ0Kc3dpdGNoIEFTSUMgZHJpdmVycyBpbXBsZW1lbnRlZCBpbiB1c2VybGFuZCBh
bmQgd2UgbmVlZCB0byBiZSBhYmxlIHRvDQpyZWFjdCBxdWlja2x5IHRvIG5ldHdvcmsgZXZlbnRz
IGluIG9yZGVyIHRvIHByZXZlbnQgbG9vcHMuIFdlIGhhdmUgc2Vlbg0KaW5zdGFuY2VzIG9mIHRo
aXMgbm90IGhhcHBlbmluZyBzaW1wbHkgYmVjYXVzZSBzb21lIG90aGVyIHByb2Nlc3MgaXMgaW4N
CnRoZSBtaWRkbGUgb2YgYSBzeXNjYWxsLg0KDQpPbmUgdGhpbmcgSSBhbSB3b3JraW5nIG9uIGhl
cmUgaXMgYSBzZXR1cCB3aXRoIGEgZmV3IHZlbmRvciBib2FyZHMgYW5kDQpzb21lIG9mIG91ciBv
d24ga2l0IHRoYXQgd2UgY2FuIHRlc3QgdGhlIHVwc3RyZWFtIGtlcm5lbHMgb24uIEhvcGVmdWxs
eQ0KdGhhdCdkIG1ha2UgdGhlc2Uga2luZHMgb2YgcmVwb3J0cyBtb3JlIHRpbWVseSByYXRoZXIg
dGhhbiBqdXN0DQp3aGVuZXZlciB3ZSBkZWNpZGUgdG8gbW92ZSB0byBhIG5ldyBrZXJuZWwgdmVy
c2lvbi4NCg0KDQo=
