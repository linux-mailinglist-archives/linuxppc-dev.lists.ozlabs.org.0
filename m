Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F9716254
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 15:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVtrH1PSrz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 23:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVtqj5npxz2xdv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 23:42:23 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-7-u_DW5skzNCeUFDwDRVqfKA-1; Tue, 30 May 2023 14:42:16 +0100
X-MC-Unique: u_DW5skzNCeUFDwDRVqfKA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 30 May
 2023 14:42:13 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 30 May 2023 14:42:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Maninder Singh' <maninder1.s@samsung.com>, "bcain@quicinc.com"
	<bcain@quicinc.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "keescook@chromium.org"
	<keescook@chromium.org>, "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>,
	"ustavoars@kernel.org" <ustavoars@kernel.org>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>,
	"wedsonaf@google.com" <wedsonaf@google.com>
Subject: RE: [PATCH 1/2] hexagon/traps.c: use KSYM_NAME_LEN in array size
Thread-Topic: [PATCH 1/2] hexagon/traps.c: use KSYM_NAME_LEN in array size
Thread-Index: AQHZkh62rZDdlRz850KjaNGq41iJD69y027g
Date: Tue, 30 May 2023 13:42:13 +0000
Message-ID: <439575eda6b24261aef4c8c7e4c078cb@AcuMS.aculab.com>
References: <CGME20230529111350epcas5p46a1fa16ffb2a39008c26d03c5c63f109@epcas5p4.samsung.com>
 <20230529111337.352990-1-maninder1.s@samsung.com>
In-Reply-To: <20230529111337.352990-1-maninder1.s@samsung.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Onkarnath <onkarnath.1@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTWFuaW5kZXIgU2luZ2gNCj4gU2VudDogMjkgTWF5IDIwMjMgMTI6MTQNCj4gDQo+IGth
bGxzeW1zX2xvb2t1cCB3aGljaCBpbiB0dXJuIGNhbGxzIGZvciBrYWxsc3ltc19sb29rdXBfYnVp
bGRpZCgpDQo+IHdyaXRlcyBvbiBpbmRleCAiS1NZTV9OQU1FX0xFTiAtIDEiLg0KPiANCj4gVGh1
cyBhcnJheSBzaXplIHNob3VsZCBiZSBLU1lNX05BTUVfTEVOLg0KPiANCj4gZm9yIGhleGFnb24g
aXQgd2FzIGRlZmluZWQgYXMgIjEyOCIgZGlyZWN0bHkuDQo+IGFuZCBjb21taXQgJzYxOTY4ZGJj
MmQ1ZCcgY2hhbmdlZCBkZWZpbmUgdmFsdWUgdG8gNTEyLA0KPiBTbyBib3RoIHdlcmUgbWlzc2Vk
IHRvIHVwZGF0ZSB3aXRoIG5ldyBzaXplLg0KDQpUaGUgb25seSBzYWZlIHdheSB0byBwYXNzIGEg
Zml4ZWQgc2l6ZSBzdHJpbmcgaXMgdG8gZW1iZWQgdGhlIGNoYXJbXSBpbg0KYSBzdHJ1Y3R1cmUg
YW5kIHBhc3MgdGhlIHN0cnVjdHVyZSBhZGRyZXNzLg0KDQpQcmV0dHkgbXVjaCBhbnl0aGluZyBl
bHNlIGlzIGRvb21lZCB0byBiZSBidWdneS4NCg0KV2hldGhlciBpcyBpdCBhY3R1YWxseSBzYW5l
IHRvIHJlcXVpcmUgdGhlIGNhbGxlciBhbGxvY2F0ZQ0Kc3VjaCBhIGxhcmdlIGJ1ZmZlciAoaGkg
cnVzdCkgaXMgYW5vdGhlciBtYXR0ZXIgZW50aXJlbHkuDQoNCglEYXZpZA0KDQo+IA0KPiBGaXhl
czogNjE5NjhkYmMyZDVkICgia2FsbHN5bXM6IGluY3JlYXNlIG1heGltdW0ga2VybmVsIHN5bWJv
bCBsZW5ndGggdG8gNTEyIikNCj4gDQo+IENvLWRldmVsb3BlZC1ieTogT25rYXJuYXRoIDxvbmth
cm5hdGguMUBzYW1zdW5nLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogT25rYXJuYXRoIDxvbmthcm5h
dGguMUBzYW1zdW5nLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWFuaW5kZXIgU2luZ2ggPG1hbmlu
ZGVyMS5zQHNhbXN1bmcuY29tPg0KPiAtLS0NCj4gIGFyY2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMu
YyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gv
aGV4YWdvbi9rZXJuZWwvdHJhcHMuYw0KPiBpbmRleCA2NDQ3NzYzY2U1YTkuLjY1YjMwYjZlYTIy
NiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9oZXhhZ29uL2tlcm5lbC90cmFwcy5jDQo+ICsrKyBiL2Fy
Y2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMuYw0KPiBAQCAtODIsNyArODIsNyBAQCBzdGF0aWMgdm9p
ZCBkb19zaG93X3N0YWNrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgdW5zaWduZWQgbG9uZyAq
ZnAsDQo+ICAJY29uc3QgY2hhciAqbmFtZSA9IE5VTEw7DQo+ICAJdW5zaWduZWQgbG9uZyAqbmV3
ZnA7DQo+ICAJdW5zaWduZWQgbG9uZyBsb3csIGhpZ2g7DQo+IC0JY2hhciB0bXBzdHJbMTI4XTsN
Cj4gKwljaGFyIHRtcHN0cltLU1lNX05BTUVfTEVOXTsNCj4gIAljaGFyICptb2RuYW1lOw0KPiAg
CWludCBpOw0KPiANCj4gLS0NCj4gMi4xNy4xDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtl
c2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBV
Sw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

