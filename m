Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC417E5B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 00:34:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4604pT2nR3zDqnx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 08:34:09 +1000 (AEST)
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
 header.b="EC5cKgN/"; dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4604md1S4nzDqnw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 08:32:32 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 50ED0886BF;
 Fri,  2 Aug 2019 10:32:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1564698750;
 bh=8qWL9NaUIJ/SgjySjJWNgrXG4lk9lFh5S9UjWCecd8k=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=EC5cKgN/XlASh17HvzQgJi/AlqNjPJ81pDiIVBuoA3Xdm8wb1U3cw0o5GZGgGgsR4
 EhaC1NaB06K7BtT3U6Nh2SRNYEySjHIjWDb7p96lX5/piFOBHa3hVSOXCKeImIEFpZ
 dZuJ4aPg+7QULwxEdzJWP5ARCwU1D8MFonsoW4FaUY7Ecbt1MKVYGiXMaLeEvavUHq
 CAqF1cBtutVroyJ0pufLJgGXHG5LGXbwiI6sDa9OVGDYcuUCQKBBUQDYg7iSkbtgLc
 3RuZWrcj2KO48EY9FiXgBQp3wzA455J31Pcb2zdyXvTe46/ad27PMhya8Fol5pVMvO
 9g4vuyHqxzKVg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d4368790000>; Fri, 02 Aug 2019 10:32:29 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Fri, 2 Aug 2019 10:32:26 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 2 Aug 2019 10:32:26 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "malat@debian.org"
 <malat@debian.org>
Subject: Re: [PATCH v2] powerpc: Support CMDLINE_EXTEND
Thread-Topic: [PATCH v2] powerpc: Support CMDLINE_EXTEND
Thread-Index: AQHVSA6Sthwti05MCUCRzXUJc8LL2KblB3mAgAERO4A=
Date: Thu, 1 Aug 2019 22:32:25 +0000
Message-ID: <1564698745.4914.14.camel@alliedtelesis.co.nz>
References: <20190801021206.26799-1-chris.packham@alliedtelesis.co.nz>
 <0a47ab71-d968-5aaa-6b5f-bd255d2565dd@c-s.fr>
In-Reply-To: <0a47ab71-d968-5aaa-6b5f-bd255d2565dd@c-s.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE440E8A97DA6143A7B4B7D3D60EB727@atlnz.lc>
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

T24gVGh1LCAyMDE5LTA4LTAxIGF0IDA4OjE0ICswMjAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiANCj4gTGUgMDEvMDgvMjAxOSDDoCAwNDoxMiwgQ2hyaXMgUGFja2hhbSBhIMOpY3JpdMKg
Og0KPiA+IA0KPiA+IEJyaW5nIHBvd2VycGMgaW4gbGluZSB3aXRoIG90aGVyIGFyY2hpdGVjdHVy
ZXMgdGhhdCBzdXBwb3J0DQo+ID4gZXh0ZW5kaW5nIG9yDQo+ID4gb3ZlcnJpZGluZyB0aGUgYm9v
dGxvYWRlciBwcm92aWRlZCBjb21tYW5kIGxpbmUuDQo+ID4gDQo+ID4gVGhlIGN1cnJlbnQgYmVo
YXZpb3VyIGlzIG1vc3QgbGlrZSBDTURMSU5FX0ZST01fQk9PVExPQURFUiB3aGVyZQ0KPiA+IHRo
ZQ0KPiA+IGJvb3Rsb2FkZXIgY29tbWFuZCBsaW5lIGlzIHByZWZlcnJlZCBidXQgdGhlIGtlcm5l
bCBjb25maWcgY2FuDQo+ID4gcHJvdmlkZSBhDQo+ID4gZmFsbGJhY2sgc28gQ01ETElORV9GUk9N
X0JPT1RMT0FERVIgaXMgdGhlIGRlZmF1bHQuIENNRExJTkVfRVhURU5EDQo+ID4gY2FuDQo+ID4g
YmUgdXNlZCB0byBhcHBlbmQgdGhlIENNRExJTkUgZnJvbSB0aGUga2VybmVsIGNvbmZpZyB0byB0
aGUgb25lDQo+ID4gcHJvdmlkZWQNCj4gPiBieSB0aGUgYm9vdGxvYWRlci4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMu
Y28ubno+DQo+ID4gLS0tDQo+ID4gV2hpbGUgSSdtIGF0IGl0IGRvZXMgYW55b25lIHRoaW5rIGl0
J3Mgd29ydGggZ2V0dGluZyByaWQgb2YgdGhlDQo+ID4gZGVmYXVsdCBDTURMSU5FDQo+ID4gdmFs
dWUgaWYgQ01ETElORV9CT09MIGFuZCBtYXliZSBDTURMSU5FX0JPT0w/IEV2ZXJ5IGRlZmNvbmZp
ZyBpbg0KPiA+IHRoZSBrZXJuZWwNCj4gPiB0aGF0IHNldHMgQ01ETElORV9CT09MPXkgYWxzbyBz
ZXRzIENNRExJTkUgdG8gc29tZXRoaW5nIG90aGVyIHRoYW4NCj4gPiAiY29uc29sZT10dHlTMCw5
NjAwIGNvbnNvbGU9dHR5MCByb290PS9kZXYvc2RhMiIuIFJlbW92aW5nDQo+ID4gQ01ETElORV9C
T09MIGFuZA0KPiA+IHVuY29uZGl0aW9uYWxseSBzZXR0aW5nIHRoZSBkZWZhdWx0IHZhbHVlIG9m
IENNRExJTkUgdG8gIiIgd291bGQNCj4gPiBjbGVhbiB1cCB0aGUNCj4gPiBLY29uZmlnIGV2ZW4g
bW9yZS4NCj4gTm90ZcKgDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jbw0KPiBtbWl0Lz9pZD1jYmU0NmJkNGY1MTA0
NTUyYjYxMjUwNWI3M2QzNjZmNjZlZmMyMzQxwqANCj4gd2hpY2ggaXMgYWxyZWFkeSBhIHN0ZXAg
Zm9yd2FyZC4NCj4gDQo+IEkgZ3Vlc3MgdGhhdCBkZWZhdWx0IGlzIGZvciB1c2VycyBzZWxlY3Rp
bmcgdGhpcyBvcHRpb24gbWFudWFsbHkgdG8NCj4gZ2V0wqANCj4gYSBmaXJzdCBzZW5zaXRpdmUg
Q01ETElORS4gQnV0IGlzIGl0IHJlYWxseSB3b3J0aCBpdCA/DQo+IA0KDQpJJ20gbm90IGV2ZW4g
c3VyZSBpZiBpdCBpcyB3b3JraW5nIGFzIGludGVuZGVkIHJpZ2h0IG5vdy4gRXZlbiB3aXRob3V0
DQpteSBjaGFuZ2VzIGlmIEkgdXNlIG1lbnVjb25maWcgYW5kIHNlbGVjdCBDTURMSU5FX0JPT0wg
SSBlbmQgdXAgd2l0aMKgDQpDT05GSUdfQ01ETElORT0iIiBpbiB0aGUgcmVzdWx0aW5nIC5jb25m
aWcuDQoNCj4gPiANCj4gPiANCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gaW5jb3Jwb3JhdGUg
aWRlYXMgZnJvbSBDaHJpc3RvcGUncyBwYXRjaCBodHRwczovL3BhdGNod29yay5vemxhYnMNCj4g
PiAub3JnL3BhdGNoLzEwNzQxMjYvDQo+ID4gDQo+ID4gwqAgYXJjaC9wb3dlcnBjL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB8IDIwICsrKysrKysrKysrKysrKysrKystDQo+ID4gwqAg
YXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KysrKystDQo+ID4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2Fy
Y2gvcG93ZXJwYy9LY29uZmlnDQo+ID4gaW5kZXggNzdmNmViZjk3MTEzLi5kNDEzZmUxYjQwNTgg
MTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gPiArKysgYi9hcmNoL3Bv
d2VycGMvS2NvbmZpZw0KPiA+IEBAIC04NTIsMTUgKzg1MiwzMyBAQCBjb25maWcgQ01ETElORQ0K
PiA+IMKgwqAJwqDCoHNvbWUgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieSBl
bnRlcmluZw0KPiA+IHRoZW0gaGVyZS7CoMKgSW4NCj4gPiDCoMKgCcKgwqBtb3N0IGNhc2VzIHlv
dSB3aWxsIG5lZWQgdG8gc3BlY2lmeSB0aGUgcm9vdCBkZXZpY2UNCj4gPiBoZXJlLg0KPiA+IMKg
wqANCj4gPiArY2hvaWNlDQo+ID4gKwlwcm9tcHQgIktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIg
aWYgQ01ETElORSAhPSAiIg0KPiA+ICsJZGVmYXVsdCBDTURMSU5FX0ZST01fQk9PVExPQURFUg0K
PiA+ICsNCj4gPiArY29uZmlnIENNRExJTkVfRlJPTV9CT09UTE9BREVSDQo+ID4gKwlib29sICJV
c2UgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIGlmIGF2YWlsYWJsZSINCj4gPiArCWhlbHAN
Cj4gPiArCcKgwqBVc2VzIHRoZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBwYXNzZWQgYnkgdGhlIGJv
b3QgbG9hZGVyLg0KPiA+IElmDQo+ID4gKwnCoMKgdGhlIGJvb3QgbG9hZGVyIGRvZXNuJ3QgcHJv
dmlkZSBhbnksIHRoZSBkZWZhdWx0IGtlcm5lbA0KPiA+IGNvbW1hbmQNCj4gPiArCcKgwqBzdHJp
bmcgcHJvdmlkZWQgaW4gQ01ETElORSB3aWxsIGJlIHVzZWQuDQo+ID4gKw0KPiA+ICtjb25maWcg
Q01ETElORV9FWFRFTkQNCj4gPiArCWJvb2wgIkV4dGVuZCBib290bG9hZGVyIGtlcm5lbCBhcmd1
bWVudHMiDQo+ID4gKwloZWxwDQo+ID4gKwnCoMKgVGhlIGNvbW1hbmQtbGluZSBhcmd1bWVudHMg
cHJvdmlkZWQgYnkgdGhlIGJvb3QgbG9hZGVyDQo+ID4gd2lsbCBiZQ0KPiA+ICsJwqDCoGFwcGVu
ZGVkIHRvIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZy4NCj4gPiArDQo+ID4gwqAg
Y29uZmlnIENNRExJTkVfRk9SQ0UNCj4gPiDCoMKgCWJvb2wgIkFsd2F5cyB1c2UgdGhlIGRlZmF1
bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIg0KPiA+IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wN
Cj4gPiDCoMKgCWhlbHANCj4gPiDCoMKgCcKgwqBBbHdheXMgdXNlIHRoZSBkZWZhdWx0IGtlcm5l
bCBjb21tYW5kIHN0cmluZywgZXZlbiBpZg0KPiA+IHRoZSBib290DQo+ID4gwqDCoAnCoMKgbG9h
ZGVyIHBhc3NlcyBvdGhlciBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4NCj4gPiDCoMKgCcKgwqBU
aGlzIGlzIHVzZWZ1bCBpZiB5b3UgY2Fubm90IG9yIGRvbid0IHdhbnQgdG8gY2hhbmdlDQo+ID4g
dGhlDQo+ID4gwqDCoAnCoMKgY29tbWFuZC1saW5lIG9wdGlvbnMgeW91ciBib290IGxvYWRlciBw
YXNzZXMgdG8gdGhlDQo+ID4ga2VybmVsLg0KPiA+IMKgwqANCj4gPiArZW5kY2hvaWNlDQo+ID4g
Kw0KPiA+IMKgIGNvbmZpZyBFWFRSQV9UQVJHRVRTDQo+ID4gwqDCoAlzdHJpbmcgIkFkZGl0aW9u
YWwgZGVmYXVsdCBpbWFnZSB0eXBlcyINCj4gPiDCoMKgCWhlbHANCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYw0KPiA+IGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9wcm9tX2luaXQuYw0KPiA+IGluZGV4IDUxNDcwN2VmNjc3OS4uZGYyOWYxNDFkYmQyIDEwMDY0
NA0KPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMNCj4gPiArKysgYi9h
cmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdC5jDQo+ID4gQEAgLTMxMCw2ICszMTAsMjUgQEAg
c3RhdGljIHNpemVfdCBfX2luaXQgcHJvbV9zdHJsY3B5KGNoYXIgKmRlc3QsDQo+ID4gY29uc3Qg
Y2hhciAqc3JjLCBzaXplX3Qgc2l6ZSkNCj4gPiDCoMKgCXJldHVybiByZXQ7DQo+ID4gwqAgfQ0K
PiA+IMKgwqANCj4gPiArc3RhdGljIHNpemVfdCBfX2luaXQgcHJvbV9zdHJsY2F0KGNoYXIgKmRl
c3QsIGNvbnN0IGNoYXIgKnNyYywNCj4gPiBzaXplX3QgY291bnQpDQo+ID4gK3sNCj4gPiArCXNp
emVfdCBkc2l6ZSA9IHByb21fc3RybGVuKGRlc3QpOw0KPiA+ICsJc2l6ZV90IGxlbiA9IHByb21f
c3RybGVuKHNyYyk7DQo+ID4gKwlzaXplX3QgcmVzID0gZHNpemUgKyBsZW47DQo+ID4gKw0KPiA+
ICsJLyogVGhpcyB3b3VsZCBiZSBhIGJ1ZyAqLw0KPiA+ICsJQlVHX09OKGRzaXplID49IGNvdW50
KTsNCj4gSGFzIHlvdSBwb2ludGVkIGluIGFub3RoZXIgbWFpbCwgQlVHX09OKCkgc2hvdWxkIGJl
IGF2b2lkZWQgaGVyZS4NCj4gSSBndWVzcyBpZiB0aGUgZGVzdGluYXRpb24gaXMgYWxyZWFkeSBm
dWxsLCBqdXN0IHJldHVybiBjb3VudDoNCj4gDQo+IGlmIChkc2l6ZSA+PSBjb3VudCkNCj4gCXJl
dHVybiBjb3VudDsNCj4gDQoNCldpbGwgZml4IGluIHYzLg0KDQo+ID4gDQo+ID4gKw0KPiA+ICsJ
ZGVzdCArPSBkc2l6ZTsNCj4gPiArCWNvdW50IC09IGRzaXplOw0KPiA+ICsJaWYgKGxlbiA+PSBj
b3VudCkNCj4gPiArCQlsZW4gPSBjb3VudC0xOw0KPiA+ICsJbWVtY3B5KGRlc3QsIHNyYywgbGVu
KTsNCj4gPiArCWRlc3RbbGVuXSA9IDA7DQo+ID4gKwlyZXR1cm4gcmVzOw0KPiA+ICsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiDCoCAjaWZkZWYgQ09ORklHX1BQQ19QU0VSSUVTDQo+ID4gwqAgc3RhdGlj
IGludCBfX2luaXQgcHJvbV9zdHJ0b2Jvb2woY29uc3QgY2hhciAqcywgYm9vbCAqcmVzKQ0KPiA+
IMKgIHsNCj4gPiBAQCAtNzYxLDggKzc4MCwxMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlf
Y21kbGluZV9wYXJzZSh2b2lkKQ0KPiA+IMKgwqAJcCA9IHByb21fY21kX2xpbmU7DQo+ID4gwqDC
oAlpZiAoKGxvbmcpcHJvbS5jaG9zZW4gPiAwKQ0KPiA+IMKgwqAJCWwgPSBwcm9tX2dldHByb3Ao
cHJvbS5jaG9zZW4sICJib290YXJncyIsIHAsDQo+ID4gQ09NTUFORF9MSU5FX1NJWkUtMSk7DQo+
IFRoZSBhYm92ZSBpcyBwb2ludGxlc3MgaW4gY2FzZSBDT05GSUdfQ01ETElORV9GT1JDRSBpcyBz
ZWxlY3RlZC4NCj4gDQoNCldpbGwgZml4IGluIHYzLg0KDQo+ID4gDQo+ID4gLQlpZiAoSVNfRU5B
QkxFRChDT05GSUdfQ01ETElORV9CT09MKSAmJiAobCA8PSAwIHx8IHBbMF0gPT0NCj4gPiAnXDAn
KSkgLyogZGJsIGNoZWNrICovDQo+ID4gKw0KPiA+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX0NN
RExJTkVfRk9SQ0UpIHx8IGwgPD0gMCB8fCBwWzBdID09DQo+ID4gJ1wwJykNCj4gPiDCoMKgCQlw
cm9tX3N0cmxjcHkocHJvbV9jbWRfbGluZSwgQ09ORklHX0NNRExJTkUsDQo+ID4gc2l6ZW9mKHBy
b21fY21kX2xpbmUpKTsNCj4gSWYgd2UgY2FuIGVuc3VyZSB0aGF0IHByb21fY21kX2xpbmUgcmVt
YWlucyBlbXB0eSB3aGVuwqANCj4gQ09ORklHX0NNRExJTkVfRk9SQ0UgaXMgc2VsZWN0ZWQgKHNl
ZSBhYm92ZSBjb21tZW50KSwgdGhlbsKgDQo+IHByb21fc3RybGNhdCgpIGNhbiBiZSB1c2VkIGlu
IGxpZXUgb2YgcHJvbV9zdHJsY3B5KCkNCj4gDQo+ID4gDQo+ID4gKwllbHNlIGlmIChJU19FTkFC
TEVEKENPTkZJR19DTURMSU5FX0VYVEVORCkpDQo+ID4gKwkJcHJvbV9zdHJsY2F0KHByb21fY21k
X2xpbmUsICIgIiBDT05GSUdfQ01ETElORSwNCj4gPiArCQkJwqDCoMKgwqDCoHNpemVvZihwcm9t
X2NtZF9saW5lKSk7DQo+ID4gKw0KPiA+IMKgwqAJcHJvbV9wcmludGYoImNvbW1hbmQgbGluZTog
JXNcbiIsIHByb21fY21kX2xpbmUpOw0KPiA+IMKgwqANCj4gPiDCoCAjaWZkZWYgQ09ORklHX1BQ
QzY0DQo+ID4gDQo+IENocmlzdG9waGU=
