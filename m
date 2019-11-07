Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F10EAF25F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 04:26:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477pj24YtwzF5wX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 14:26:30 +1100 (AEDT)
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
 header.b="HHV44VKa"; dkim-atps=neutral
X-Greylist: delayed 376 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Nov 2019 14:24:45 AEDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477pg16XL3zF5Gy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 14:24:45 +1100 (AEDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C4D4C886BF;
 Thu,  7 Nov 2019 16:18:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1573096699;
 bh=1pXgkdqHole/8Dsm8mVXN3+on0yO2D/QjEpL/3OHQqk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=HHV44VKamEtw22wuiidaQebIPe/KNnx6VCebLFcHrhJt1t6m7RbvPaRqd7zwgI7JP
 2MsHXfFqQYKkeMNyg3p29V3/2QCBrUr/rZvZivO4lcqpdUmhCIBt136pqTTeW/ewM5
 NMTTVqSHU99LoYiQKY/yPrf0qYtMlfyoAxC4Nny8tSEU/1AKNEf3u6+/NCFMgKhbJX
 z6fkINmfU4lWfNnlL1m/8ulhq8TQo0EBcqfjFb+Fii5q8WNQiZYbXw02KBH+JZlV3U
 qyYBurYHAEExHr9ajq8moE6+LDDi3YfMNRpAhb3XeiiFlGl0m9Q76+oUnkNhGoxb1h
 07nkZwSuIuh5g==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc38cfc0000>; Thu, 07 Nov 2019 16:18:20 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Thu, 7 Nov 2019 16:18:19 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 7 Nov 2019 16:18:19 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "malat@debian.org"
 <malat@debian.org>
Subject: Re: [PATCH v3] powerpc: Support CMDLINE_EXTEND
Thread-Topic: [PATCH v3] powerpc: Support CMDLINE_EXTEND
Thread-Index: AQHVSLt5SSIu+9gAGkizQ6ZspvV50qbmfk4AgJhKToA=
Date: Thu, 7 Nov 2019 03:18:19 +0000
Message-ID: <46da00814535270a2b525de1f75afc79f3abbf5c.camel@alliedtelesis.co.nz>
References: <20190801225006.21952-1-chris.packham@alliedtelesis.co.nz>
 <9262a291-161f-e172-9d13-88a717da9de4@c-s.fr>
In-Reply-To: <9262a291-161f-e172-9d13-88a717da9de4@c-s.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:f81e:1e86:b004:7754]
Content-Type: text/plain; charset="utf-8"
Content-ID: <28A065FD65F2544CA45F1427AEB1CE0F@atlnz.lc>
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

SGkgQWxsLA0KDQpPbiBGcmksIDIwMTktMDgtMDIgYXQgMDY6NDAgKzAyMDAsIENocmlzdG9waGUg
TGVyb3kgd3JvdGU6DQo+IA0KPiBMZSAwMi8wOC8yMDE5IMOgIDAwOjUwLCBDaHJpcyBQYWNraGFt
IGEgw6ljcml0IDoNCj4gPiBCcmluZyBwb3dlcnBjIGluIGxpbmUgd2l0aCBvdGhlciBhcmNoaXRl
Y3R1cmVzIHRoYXQgc3VwcG9ydCBleHRlbmRpbmcgb3INCj4gPiBvdmVycmlkaW5nIHRoZSBib290
bG9hZGVyIHByb3ZpZGVkIGNvbW1hbmQgbGluZS4NCj4gPiANCj4gPiBUaGUgY3VycmVudCBiZWhh
dmlvdXIgaXMgbW9zdCBsaWtlIENNRExJTkVfRlJPTV9CT09UTE9BREVSIHdoZXJlIHRoZQ0KPiA+
IGJvb3Rsb2FkZXIgY29tbWFuZCBsaW5lIGlzIHByZWZlcnJlZCBidXQgdGhlIGtlcm5lbCBjb25m
aWcgY2FuIHByb3ZpZGUgYQ0KPiA+IGZhbGxiYWNrIHNvIENNRExJTkVfRlJPTV9CT09UTE9BREVS
IGlzIHRoZSBkZWZhdWx0LiBDTURMSU5FX0VYVEVORCBjYW4NCj4gPiBiZSB1c2VkIHRvIGFwcGVu
ZCB0aGUgQ01ETElORSBmcm9tIHRoZSBrZXJuZWwgY29uZmlnIHRvIHRoZSBvbmUgcHJvdmlkZWQN
Cj4gPiBieSB0aGUgYm9vdGxvYWRlci4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQ
YWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+IA0KPiBSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQoNCkp1c3Qg
Z29pbmcgb3ZlciBzb21lIG9sZCBwYXRjaGVzIHRoaXMgZG9lc24ndCBhcHBlYXIgdG8gYmUgaW4g
bmV4dC4gSXMNCnRoZXJlIGFueXRoaW5nIHN0b3BwaW5nIGl0IGZyb20gYmVpbmcgYWNjZXB0ZWQ/
DQoNCj4gDQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiAtIGRvbid0IHVzZSBCVUdf
T04gaW4gcHJvbV9zdHJsY2F0DQo+ID4gLSByZWFycmFuZ2UgdGhpbmdzIHRvIGVsaW1pbmF0ZSBw
cm9tX3N0cmxjcHkNCj4gPiANCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gaW5jb3Jwb3JhdGUg
aWRlYXMgZnJvbSBDaHJpc3RvcGUncyBwYXRjaCBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3BhdGNoLzEwNzQxMjYvDQo+ID4gLSBzdXBwb3J0IENNRExJTkVfRk9SQ0UNCj4gPiANCj4gPiAg
IGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKy0N
Cj4gPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMgfCAzNiArKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gPiBpbmRleCA3N2Y2ZWJmOTcxMTMu
LmQ0MTNmZTFiNDA1OCAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiA+
ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+ID4gQEAgLTg1MiwxNSArODUyLDMzIEBAIGNv
bmZpZyBDTURMSU5FDQo+ID4gICAJICBzb21lIGNvbW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1aWxk
IHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBoZXJlLiAgSW4NCj4gPiAgIAkgIG1vc3QgY2FzZXMgeW91
IHdpbGwgbmVlZCB0byBzcGVjaWZ5IHRoZSByb290IGRldmljZSBoZXJlLg0KPiA+ICAgDQo+ID4g
K2Nob2ljZQ0KPiA+ICsJcHJvbXB0ICJLZXJuZWwgY29tbWFuZCBsaW5lIHR5cGUiIGlmIENNRExJ
TkUgIT0gIiINCj4gPiArCWRlZmF1bHQgQ01ETElORV9GUk9NX0JPT1RMT0FERVINCj4gPiArDQo+
ID4gK2NvbmZpZyBDTURMSU5FX0ZST01fQk9PVExPQURFUg0KPiA+ICsJYm9vbCAiVXNlIGJvb3Rs
b2FkZXIga2VybmVsIGFyZ3VtZW50cyBpZiBhdmFpbGFibGUiDQo+ID4gKwloZWxwDQo+ID4gKwkg
IFVzZXMgdGhlIGNvbW1hbmQtbGluZSBvcHRpb25zIHBhc3NlZCBieSB0aGUgYm9vdCBsb2FkZXIu
IElmDQo+ID4gKwkgIHRoZSBib290IGxvYWRlciBkb2Vzbid0IHByb3ZpZGUgYW55LCB0aGUgZGVm
YXVsdCBrZXJuZWwgY29tbWFuZA0KPiA+ICsJICBzdHJpbmcgcHJvdmlkZWQgaW4gQ01ETElORSB3
aWxsIGJlIHVzZWQuDQo+ID4gKw0KPiA+ICtjb25maWcgQ01ETElORV9FWFRFTkQNCj4gPiArCWJv
b2wgIkV4dGVuZCBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMiDQo+ID4gKwloZWxwDQo+ID4g
KwkgIFRoZSBjb21tYW5kLWxpbmUgYXJndW1lbnRzIHByb3ZpZGVkIGJ5IHRoZSBib290IGxvYWRl
ciB3aWxsIGJlDQo+ID4gKwkgIGFwcGVuZGVkIHRvIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5k
IHN0cmluZy4NCj4gPiArDQo+ID4gICBjb25maWcgQ01ETElORV9GT1JDRQ0KPiA+ICAgCWJvb2wg
IkFsd2F5cyB1c2UgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIg0KPiA+IC0JZGVw
ZW5kcyBvbiBDTURMSU5FX0JPT0wNCj4gPiAgIAloZWxwDQo+ID4gICAJICBBbHdheXMgdXNlIHRo
ZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZywgZXZlbiBpZiB0aGUgYm9vdA0KPiA+ICAg
CSAgbG9hZGVyIHBhc3NlcyBvdGhlciBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4NCj4gPiAgIAkg
IFRoaXMgaXMgdXNlZnVsIGlmIHlvdSBjYW5ub3Qgb3IgZG9uJ3Qgd2FudCB0byBjaGFuZ2UgdGhl
DQo+ID4gICAJICBjb21tYW5kLWxpbmUgb3B0aW9ucyB5b3VyIGJvb3QgbG9hZGVyIHBhc3NlcyB0
byB0aGUga2VybmVsLg0KPiA+ICAgDQo+ID4gK2VuZGNob2ljZQ0KPiA+ICsNCj4gPiAgIGNvbmZp
ZyBFWFRSQV9UQVJHRVRTDQo+ID4gICAJc3RyaW5nICJBZGRpdGlvbmFsIGRlZmF1bHQgaW1hZ2Ug
dHlwZXMiDQo+ID4gICAJaGVscA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L3Byb21faW5pdC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYw0KPiA+IGluZGV4
IDUxNDcwN2VmNjc3OS4uMWM3MDEwY2M2ZWM5IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvcHJvbV9pbml0LmMNCj4gPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21f
aW5pdC5jDQo+ID4gQEAgLTI5OCwxNiArMjk4LDI0IEBAIHN0YXRpYyBjaGFyIF9faW5pdCAqcHJv
bV9zdHJzdHIoY29uc3QgY2hhciAqczEsIGNvbnN0IGNoYXIgKnMyKQ0KPiA+ICAgCXJldHVybiBO
VUxMOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gLXN0YXRpYyBzaXplX3QgX19pbml0IHByb21fc3Ry
bGNweShjaGFyICpkZXN0LCBjb25zdCBjaGFyICpzcmMsIHNpemVfdCBzaXplKQ0KPiA+IC17DQo+
ID4gLQlzaXplX3QgcmV0ID0gcHJvbV9zdHJsZW4oc3JjKTsNCj4gPiArc3RhdGljIHNpemVfdCBf
X2luaXQgcHJvbV9zdHJsY2F0KGNoYXIgKmRlc3QsIGNvbnN0IGNoYXIgKnNyYywgc2l6ZV90IGNv
dW50KQ0KPiA+ICt7DQo+ID4gKwlzaXplX3QgZHNpemUgPSBwcm9tX3N0cmxlbihkZXN0KTsNCj4g
PiArCXNpemVfdCBsZW4gPSBwcm9tX3N0cmxlbihzcmMpOw0KPiA+ICsJc2l6ZV90IHJlcyA9IGRz
aXplICsgbGVuOw0KPiA+ICsNCj4gPiArCS8qIFRoaXMgd291bGQgYmUgYSBidWcgKi8NCj4gPiAr
CWlmIChkc2l6ZSA+PSBjb3VudCkNCj4gPiArCQlyZXR1cm4gY291bnQ7DQo+ID4gKw0KPiA+ICsJ
ZGVzdCArPSBkc2l6ZTsNCj4gPiArCWNvdW50IC09IGRzaXplOw0KPiA+ICsJaWYgKGxlbiA+PSBj
b3VudCkNCj4gPiArCQlsZW4gPSBjb3VudC0xOw0KPiA+ICsJbWVtY3B5KGRlc3QsIHNyYywgbGVu
KTsNCj4gPiArCWRlc3RbbGVuXSA9IDA7DQo+ID4gKwlyZXR1cm4gcmVzOw0KPiA+ICAgDQo+ID4g
LQlpZiAoc2l6ZSkgew0KPiA+IC0JCXNpemVfdCBsZW4gPSAocmV0ID49IHNpemUpID8gc2l6ZSAt
IDEgOiByZXQ7DQo+ID4gLQkJbWVtY3B5KGRlc3QsIHNyYywgbGVuKTsNCj4gPiAtCQlkZXN0W2xl
bl0gPSAnXDAnOw0KPiA+IC0JfQ0KPiA+IC0JcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPiAgIA0K
PiA+ICAgI2lmZGVmIENPTkZJR19QUENfUFNFUklFUw0KPiA+IEBAIC03NTksMTAgKzc2NywxNCBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlfY21kbGluZV9wYXJzZSh2b2lkKQ0KPiA+ICAgDQo+
ID4gICAJcHJvbV9jbWRfbGluZVswXSA9IDA7DQo+ID4gICAJcCA9IHByb21fY21kX2xpbmU7DQo+
ID4gLQlpZiAoKGxvbmcpcHJvbS5jaG9zZW4gPiAwKQ0KPiA+ICsNCj4gPiArCWlmICghSVNfRU5B
QkxFRChDT05GSUdfQ01ETElORV9GT1JDRSkgJiYgKGxvbmcpcHJvbS5jaG9zZW4gPiAwKQ0KPiA+
ICAgCQlsID0gcHJvbV9nZXRwcm9wKHByb20uY2hvc2VuLCAiYm9vdGFyZ3MiLCBwLCBDT01NQU5E
X0xJTkVfU0laRS0xKTsNCj4gPiAtCWlmIChJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0JPT0wp
ICYmIChsIDw9IDAgfHwgcFswXSA9PSAnXDAnKSkgLyogZGJsIGNoZWNrICovDQo+ID4gLQkJcHJv
bV9zdHJsY3B5KHByb21fY21kX2xpbmUsIENPTkZJR19DTURMSU5FLCBzaXplb2YocHJvbV9jbWRf
bGluZSkpOw0KPiA+ICsNCj4gPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0VYVEVO
RCkgfHwgbCA8PSAwIHx8IHBbMF0gPT0gJ1wwJykNCj4gPiArCQlwcm9tX3N0cmxjYXQocHJvbV9j
bWRfbGluZSwgIiAiIENPTkZJR19DTURMSU5FLA0KPiA+ICsJCQkgICAgIHNpemVvZihwcm9tX2Nt
ZF9saW5lKSk7DQo+ID4gKw0KPiA+ICAgCXByb21fcHJpbnRmKCJjb21tYW5kIGxpbmU6ICVzXG4i
LCBwcm9tX2NtZF9saW5lKTsNCj4gPiAgIA0KPiA+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPiA+
IA0K
