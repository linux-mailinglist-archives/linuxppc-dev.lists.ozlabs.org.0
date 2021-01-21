Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 222AA2FE746
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 11:16:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLywM298zzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 21:16:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLysR1BpBzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 21:13:45 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-266-osQAcjJMPe6N46_Gst67UA-1; Thu, 21 Jan 2021 10:13:37 +0000
X-MC-Unique: osQAcjJMPe6N46_Gst67UA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 21 Jan 2021 10:13:35 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 21 Jan 2021 10:13:35 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH 02/13] module: add a module_loaded helper
Thread-Topic: [PATCH 02/13] module: add a module_loaded helper
Thread-Index: AQHW79xgE0+Qt/OaHkK/jwqI2nu4BKox2+LA
Date: Thu, 21 Jan 2021 10:13:35 +0000
Message-ID: <39a4c883684c418ba324c3db702802b6@AcuMS.aculab.com>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-3-hch@lst.de>
 <9052b54a-e05a-1534-9e0f-c73c8b3509bd@csgroup.eu>
In-Reply-To: <9052b54a-e05a-1534-9e0f-c73c8b3509bd@csgroup.eu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAyMSBKYW51YXJ5IDIwMjEgMTA6MDANCj4g
DQo+IExlIDIxLzAxLzIwMjEgw6AgMDg6NDksIENocmlzdG9waCBIZWxsd2lnIGEgw6ljcml0wqA6
DQo+ID4gQWRkIGEgaGVscGVyIHRoYXQgdGFrZXMgbW9kdWxlc19tdXRleCBhbmQgdXNlcyBmaW5k
X21vZHVsZSB0byBjaGVjayBpZiBhDQo+ID4gZ2l2ZW4gbW9kdWxlIGlzIGxvYWRlZC4gIFRoaXMg
cHJvdmlkZXMgYSBiZXR0ZXIgYWJzdHJhY3Rpb24gZm9yIHRoZSB0d28NCj4gPiBjYWxsZXJzLCBh
bmQgYWxsb3dzIHRvIHVuZXhwb3J0IG1vZHVsZXNfbXV0ZXggYW5kIGZpbmRfbW9kdWxlLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+DQo+ID4g
LS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgIDcgKy0tLS0tLQ0K
PiA+ICAgaW5jbHVkZS9saW51eC9tb2R1bGUuaCAgICAgICAgICB8ICAzICsrKw0KPiA+ICAga2Vy
bmVsL21vZHVsZS5jICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKy0tDQo+ID4gICBr
ZXJuZWwvdHJhY2UvdHJhY2Vfa3Byb2JlLmMgICAgIHwgIDQgKy0tLQ0KPiA+ICAgNCBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPg0KPiANCj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tb2R1bGUuaCBiL2luY2x1ZGUvbGludXgvbW9kdWxl
LmgNCj4gPiBpbmRleCA3YTBiY2I1YjFmZmNjZC4uYjQ2NTRmOGE0MDgxMzQgMTAwNjQ0DQo+ID4g
LS0tIGEvaW5jbHVkZS9saW51eC9tb2R1bGUuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbW9k
dWxlLmgNCj4gPiBAQCAtNTg5LDYgKzU4OSw5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB3aXRoaW5f
bW9kdWxlKHVuc2lnbmVkIGxvbmcgYWRkciwgY29uc3Qgc3RydWN0IG1vZHVsZSAqbW9kKQ0KPiA+
ICAgLyogU2VhcmNoIGZvciBtb2R1bGUgYnkgbmFtZTogbXVzdCBob2xkIG1vZHVsZV9tdXRleC4g
Ki8NCj4gPiAgIHN0cnVjdCBtb2R1bGUgKmZpbmRfbW9kdWxlKGNvbnN0IGNoYXIgKm5hbWUpOw0K
PiA+DQo+ID4gKy8qIENoZWNrIGlmIGEgbW9kdWxlIGlzIGxvYWRlZC4gKi8NCj4gPiArYm9vbCBt
b2R1bGVfbG9hZGVkKGNvbnN0IGNoYXIgKm5hbWUpOw0KPiANCj4gTWF5YmUgbW9kdWxlX2lzX2xv
YWRlZCgpIHdvdWxkIGJlIGEgYmV0dGVyIG5hbWUuDQoNCkkgY2FuJ3Qgc2VlIHRoZSBvcmlnaW5h
bCBwYXRjaC4NCg0KV2hhdCBpcyB0aGUgcG9pbnQgb2YgdGhlIGZ1bmN0aW9uLg0KQnkgdGhlIHRp
bWUgaXQgcmV0dXJucyB0aGUgaW5mb3JtYXRpb24gaXMgc3RhbGUgLSBzbyBtb3N0bHkgdXNlbGVz
cy4NCg0KU3VyZWx5IHlvdSBuZWVkIHRvIHVzZSB0cnlfbW9kdWxlX2dldCgpIGluc3RlYWQ/DQoN
CglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwg
TW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzog
MTM5NzM4NiAoV2FsZXMpDQo=

