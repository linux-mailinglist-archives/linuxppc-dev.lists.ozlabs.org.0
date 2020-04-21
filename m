Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBC1B2CC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 18:35:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4968Lf5tRbzDqFp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 02:35:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
X-Greylist: delayed 12666 seconds by postgrey-1.36 at bilbo;
 Wed, 22 Apr 2020 02:30:36 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4968F83SNGzDq9V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 02:30:34 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-156-5eyjsxuYMtSx9GxPPKhO9g-1; Tue, 21 Apr 2020 13:28:26 +0100
X-MC-Unique: 5eyjsxuYMtSx9GxPPKhO9g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 21 Apr 2020 13:28:26 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 21 Apr 2020 13:28:26 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nicholas Piggin' <npiggin@gmail.com>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>, Rich Felker <dalias@libc.org>
Subject: RE: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Thread-Topic: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Thread-Index: AQHWFrDQYjTVYCQ8pUCZ1j4rC1JkAqiDgXJg
Date: Tue, 21 Apr 2020 12:28:25 +0000
Message-ID: <b77fa2dc769d42e1a3e68f5edf90d250@AcuMS.aculab.com>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
In-Reply-To: <1587344003.daumxvs1kh.astroid@bobo.none>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
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
Cc: "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTmljaG9sYXMgUGlnZ2luDQo+IFNlbnQ6IDIwIEFwcmlsIDIwMjAgMDI6MTANCi4uLg0K
PiA+PiBZZXMsIGJ1dCBkb2VzIGl0IHJlYWxseSBtYXR0ZXIgdG8gb3B0aW1pemUgdGhpcyBzcGVj
aWZpYyB1c2FnZSBjYXNlDQo+ID4+IGZvciBzaXplPyBnbGliYywgZm9yIGluc3RhbmNlLCB0cmll
cyB0byBsZXZlcmFnZSB0aGUgc3lzY2FsbCBtZWNoYW5pc20NCj4gPj4gYnkgYWRkaW5nIHNvbWUg
Y29tcGxleCBwcmUtcHJvY2Vzc29yIGFzbSBkaXJlY3RpdmVzLiAgSXQgb3B0aW1pemVzDQo+ID4+
IHRoZSBzeXNjYWxsIGNvZGUgc2l6ZSBpbiBtb3N0IGNhc2VzLiAgRm9yIGluc3RhbmNlLCBraWxs
IGluIHN0YXRpYyBjYXNlDQo+ID4+IGdlbmVyYXRlcyBvbiB4ODZfNjQ6DQo+ID4+DQo+ID4+IDAw
MDAwMDAwMDAwMDAwMDAgPF9fa2lsbD46DQo+ID4+ICAgIDA6ICAgYjggM2UgMDAgMDAgMDAgICAg
ICAgICAgbW92ICAgICQweDNlLCVlYXgNCj4gPj4gICAgNTogICAwZiAwNSAgICAgICAgICAgICAg
ICAgICBzeXNjYWxsDQo+ID4+ICAgIDc6ICAgNDggM2QgMDEgZjAgZmYgZmYgICAgICAgY21wICAg
ICQweGZmZmZmZmZmZmZmZmYwMDEsJXJheA0KPiA+PiAgICBkOiAgIDBmIDgzIDAwIDAwIDAwIDAw
ICAgICAgIGphZSAgICAxMyA8X19raWxsKzB4MTM+DQoNCkhtbW0uLi4gdGhhdCBjbXAgKyBqYWUg
aXMgdW5uZWNlc3NhcnkgaGVyZS4NCkl0IGlzIGFsc28gYSAzMmJpdCBvZmZzZXQganVtcC4NCkkg
YWxzbyBzdXNwZWN0IGl0IGdldHMgcHJlZGljdGVkIHZlcnkgYmFkbHkuDQoNCj4gPj4gICAxMzog
ICBjMyAgICAgICAgICAgICAgICAgICAgICByZXRxDQo+ID4+DQo+ID4+IFdoaWxlIG9uIG11c2w6
DQo+ID4+DQo+ID4+IDAwMDAwMDAwMDAwMDAwMDAgPGtpbGw+Og0KPiA+PiAgICAwOgk0OCA4MyBl
YyAwOCAgICAgICAgICAJc3ViICAgICQweDgsJXJzcA0KPiA+PiAgICA0Ogk0OCA2MyBmZiAgICAg
ICAgICAgICAJbW92c2xxICVlZGksJXJkaQ0KPiA+PiAgICA3Ogk0OCA2MyBmNiAgICAgICAgICAg
ICAJbW92c2xxICVlc2ksJXJzaQ0KPiA+PiAgICBhOgliOCAzZSAwMCAwMCAwMCAgICAgICAJbW92
ICAgICQweDNlLCVlYXgNCj4gPj4gICAgZjoJMGYgMDUgICAgICAgICAgICAgICAgCXN5c2NhbGwN
Cj4gPj4gICAxMToJNDggODkgYzcgICAgICAgICAgICAgCW1vdiAgICAlcmF4LCVyZGkNCj4gPj4g
ICAxNDoJZTggMDAgMDAgMDAgMDAgICAgICAgCWNhbGxxICAxOSA8a2lsbCsweDE5Pg0KPiA+PiAg
IDE5Ogk1YSAgICAgICAgICAgICAgICAgICAJcG9wICAgICVyZHgNCj4gPj4gICAxYToJYzMgICAg
ICAgICAgICAgICAgICAgCXJldHENCj4gPg0KPiA+IFdvdyB0aGF0J3Mgc29tZSBleHRyYW9yZGlu
YXJpbHkgYmFkIGNvZGVnZW4gZ29pbmcgb24gYnkgZ2NjLi4uIFRoZQ0KPiA+IHNpZ24tZXh0ZW5z
aW9uIGlzIHNlbWFudGljYWxseSBuZWVkZWQgYW5kIEkgZG9uJ3Qgc2VlIGEgZ29vZCB3YXkNCj4g
PiBhcm91bmQgaXQgKGdsaWJjJ3MgYXNtIGlzIGtpbmRhIGEgaGFjayB0YWtpbmcgYWR2YW50YWdl
IG9mIGtlcm5lbCBub3QNCj4gPiBsb29raW5nIGF0IGhpZ2ggYml0cywgSSB0aGluayksIGJ1dCB0
aGUgZ3JhdHVpdG91cyBzdGFjayBhZGp1c3RtZW50DQo+ID4gYW5kIHJlZnVzYWwgdG8gZ2VuZXJh
dGUgYSB0YWlsIGNhbGwgaXNuJ3QuIEknbGwgc2VlIGlmIHdlIGNhbiB0cmFjaw0KPiA+IGRvd24g
d2hhdCdzIGdvaW5nIG9uIGFuZCBnZXQgaXQgZml4ZWQuDQoNCkEgc3VpdGFibGUgY2FzdCBtaWdo
dCBnZXQgcmlkIG9mIHRoZSBzaWduIGV4dGVuc2lvbi4NClBvc3NpYmx5IGp1c3QgKHVuc2lnbmVk
IGludCkuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1s
ZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJh
dGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

