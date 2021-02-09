Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A93154DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 18:18:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZqP162KszDsjl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 04:18:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZqLy1RW2zDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 04:16:55 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-209-CsFtTztMNsC99rsKBALIig-1; Tue, 09 Feb 2021 17:16:46 +0000
X-MC-Unique: CsFtTztMNsC99rsKBALIig-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 9 Feb 2021 17:16:46 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 9 Feb 2021 17:16:46 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, 'Segher Boessenkool'
 <segher@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: RE: [PATCH v5 20/22] powerpc/syscall: Avoid storing 'current' in
 another pointer
Thread-Topic: [PATCH v5 20/22] powerpc/syscall: Avoid storing 'current' in
 another pointer
Thread-Index: AQHW/uu6M1m95GjSlEGhmhkEL2m4wKpP4cNQgAArZICAAAJwgA==
Date: Tue, 9 Feb 2021 17:16:46 +0000
Message-ID: <c7b16df4949640bc8405315911fe5f01@AcuMS.aculab.com>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <24804747098369ebcdac38970b8f7a1260bdd248.1612796617.git.christophe.leroy@csgroup.eu>
 <1612838134.rvncv9kzls.astroid@bobo.none>
 <20210209135053.GD27854@gate.crashing.org>
 <d35cc46eca474b2c9f94a4de269321e7@AcuMS.aculab.com>
 <f6ae2e77-3a89-c294-9a6e-58d84fbb46b1@csgroup.eu>
In-Reply-To: <f6ae2e77-3a89-c294-9a6e-58d84fbb46b1@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, "msuchanek@suse.de" <msuchanek@suse.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBT
ZW50OiAwOSBGZWJydWFyeSAyMDIxIDE3OjA0DQo+IA0KPiBMZSAwOS8wMi8yMDIxIMOgIDE1OjMx
LCBEYXZpZCBMYWlnaHQgYSDDqWNyaXTCoDoNCj4gPiBGcm9tOiBTZWdoZXIgQm9lc3Nlbmtvb2wN
Cj4gPj4gU2VudDogMDkgRmVicnVhcnkgMjAyMSAxMzo1MQ0KPiA+Pg0KPiA+PiBPbiBUdWUsIEZl
YiAwOSwgMjAyMSBhdCAxMjozNjoyMFBNICsxMDAwLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6DQo+
ID4+PiBXaGF0IGlmIHlvdSBkaWQgdGhpcz8NCj4gPj4NCj4gPj4+ICtzdGF0aWMgaW5saW5lIHN0
cnVjdCB0YXNrX3N0cnVjdCAqZ2V0X2N1cnJlbnQodm9pZCkNCj4gPj4+ICt7DQo+ID4+PiArCXJl
Z2lzdGVyIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzayBhc20gKCJyMiIpOw0KPiA+Pj4gKw0KPiA+
Pj4gKwlyZXR1cm4gdGFzazsNCj4gPj4+ICt9DQo+ID4+DQo+ID4+IExvY2FsIHJlZ2lzdGVyIGFz
bSB2YXJpYWJsZXMgYXJlICpvbmx5KiBndWFyYW50ZWVkIHRvIGxpdmUgaW4gdGhhdA0KPiA+PiBy
ZWdpc3RlciBhcyBvcGVyYW5kcyB0byBhbiBhc20uICBTZWUNCj4gPj4gICAgaHR0cHM6Ly9nY2Mu
Z251Lm9yZy9vbmxpbmVkb2NzL2djYy9Mb2NhbC1SZWdpc3Rlci1WYXJpYWJsZXMuaHRtbCNMb2Nh
bC1SZWdpc3Rlci1WYXJpYWJsZXMNCj4gPj4gKCJUaGUgb25seSBzdXBwb3J0ZWQgdXNlIiBldGMu
KQ0KPiA+Pg0KPiA+PiBZb3UgY2FuIGRvIHNvbWV0aGluZyBsaWtlDQo+ID4+DQo+ID4+IHN0YXRp
YyBpbmxpbmUgc3RydWN0IHRhc2tfc3RydWN0ICpnZXRfY3VycmVudCh2b2lkKQ0KPiA+PiB7DQo+
ID4+IAlyZWdpc3RlciBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2sgYXNtICgicjIiKTsNCj4gPj4N
Cj4gPj4gCWFzbSgiIiA6ICIrciIodGFzaykpOw0KPiA+Pg0KPiA+PiAJcmV0dXJuIHRhc2s7DQo+
ID4+IH0NCj4gPj4NCj4gPj4gd2hpY2ggbWFrZXMgc3VyZSB0aGF0ICJ0YXNrIiBhY3R1YWxseSBp
cyBpbiByMiBhdCB0aGUgcG9pbnQgb2YgdGhhdCBhc20uDQo+ID4NCj4gPiBJZiAicjIiIGFsd2F5
cyBjb250YWlucyBjdXJyZW50IChhbmQgaXMgbmV2ZXIgYXNzaWduZWQgYnkgdGhlIGNvbXBpbGVy
KQ0KPiA+IHdoeSBub3QgdXNlIGEgZ2xvYmFsIHJlZ2lzdGVyIHZhcmlhYmxlIGZvciBpdD8NCj4g
Pg0KPiANCj4gDQo+IFRoZSBjaGFuZ2UgcHJvcG9zZWQgYnkgTmljayBkb2Vzbid0IHNvbHZlIHRo
ZSBpc3N1ZS4NCj4gDQo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgYXQgdGhlIGJlZ2luaW5nIG9mIHRo
ZSBmdW5jdGlvbiB3ZSBoYXZlOg0KPiANCj4gCXVuc2lnbmVkIGxvbmcgKnRpX2ZsYWdzcCA9ICZj
dXJyZW50X3RocmVhZF9pbmZvKCktPmZsYWdzOw0KPiANCj4gV2hlbiB0aGUgZnVuY3Rpb24gdXNl
cyB0aV9mbGFnc3AgZm9yIHRoZSBmaXJzdCB0aW1lLCBpdCBkb2VzIHVzZSAxMTIocjIpDQo+IA0K
PiBUaGVuIHRoZSBmdW5jdGlvbiBjYWxscyBzb21lIG90aGVyIGZ1bmN0aW9ucy4NCj4gDQo+IE1v
c3QgbGlrZWx5IGJlY2F1c2UgdGhlIGZ1bmN0aW9uIGNvdWxkIHVwZGF0ZSAnY3VycmVudCcsIEdD
QyBjb3BpZXMgcjIgaW50byByMzAsIHNvIHRoYXQgaWYgcjIgZ2V0DQo+IGNoYW5nZWQgYnkgdGhl
IGNhbGxlZCBmdW5jdGlvbiwgdGlfZmxhZ3NwIGlzIHN0aWxsIGJhc2VkIG9uIHRoZSBwcmV2aW91
cyB2YWx1ZSBvZiBjdXJyZW50Lg0KPiANCj4gQWxsdGhvdWdoIHdlIGtub3cgcjIgd29udCBjaGFu
Z2UsIEdDQyBkb2Vzbid0IGtub3cgaXQuIEFuZCBpbiBvcmRlciB0byBzYXZlIHIyIGludG8gcjMw
LCBpdCBuZWVkcyB0bw0KPiBzYXZlIHIzMCBpbiB0aGUgc3RhY2suDQo+IA0KPiANCj4gQnkgdXNp
bmcgJmN1cnJlbnRfdGhyZWFkX2luZm8oKS0+ZmxhZ3MgZGlyZWN0bHkgaW5zdGVhZCBvZiB0aGlz
IGludGVybWVkaWFpdGUgdGlfZmxhZ3NwIHBvaW50ZXIsIEdDQw0KPiB1c2VzIHIyIGluc3RlYWQg
aW5zdGVhZCBvZiBkb2luZyBhIGNvcHkuDQoNCkRvZXMgbWFya2luZyBjdXJyZW50X3RocmVhZF9p
bmZvKCkgJ3B1cmUnIChJIHRoaW5rIHRoYXQgdGhlIHJpZ2h0IG9uZSkNCndvcmsgLSBzbyB0aGF0
IGdjYyBrbm93cyBpdHMgcmVzdWx0IGRvZXNuJ3QgZGVwZW5kIG9uIGV4dGVybmFsIGRhdGENCmFu
ZCB0aGF0IGl0IGRvZXNuJ3QgY2hhbmdlIGV4dGVybmFsIGRhdGEuDQoNCkFsdGhvdWdoIEknbSBu
b3QgMTAwJSBob3cgd2VsbCB0aG9zZSBhdHRyaWJ1dGVzIGFjdHVhbGx5IHdvcmsuDQoNCj4gTmlj
aywgSSBkb24ndCB1bmRlcnN0YW5kIHRoZSByZWFzb24gd2h5IHlvdSBuZWVkIHRoYXQgJ3RpX2Zs
YWdzcCcgbG9jYWwgdmFyLg0KDQpQcm9iYWJseSB0byBzYXZlIHR5cGluZy4NCg0KSSBzb21ldGlt
ZXMgcmVsb2FkIGxvY2FscyBhZnRlciBmdW5jdGlvbiBjYWxscy4NCg0KCURhdmlkDQoNCi0NClJl
Z2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0
b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykN
Cg==

