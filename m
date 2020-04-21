Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D59171B2B37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:34:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4966zx3L5jzDq6l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=146.101.78.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4966wf4TvSzDqCt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 01:31:14 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-207-VaQp-6MpPG-eBPDVYu-BhQ-1; Tue, 21 Apr 2020 16:31:09 +0100
X-MC-Unique: VaQp-6MpPG-eBPDVYu-BhQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 21 Apr 2020 16:31:08 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 21 Apr 2020 16:31:08 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Adhemerval Zanella' <adhemerval.zanella@linaro.org>, Rich Felker
 <dalias@libc.org>
Subject: RE: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Thread-Topic: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Thread-Index: AQHWFrDQYjTVYCQ8pUCZ1j4rC1JkAqiDgXJggAAsaqmAAAZyMA==
Date: Tue, 21 Apr 2020 15:31:08 +0000
Message-ID: <bc3d8d98e5d64f9e8407290c68b21ed2@AcuMS.aculab.com>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <b77fa2dc769d42e1a3e68f5edf90d250@AcuMS.aculab.com>
 <20200421143941.GJ11469@brightrain.aerifal.cx>
 <960127e0-57a0-55b4-f309-ae0a675c7756@linaro.org>
In-Reply-To: <960127e0-57a0-55b4-f309-ae0a675c7756@linaro.org>
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
 'Nicholas Piggin' <npiggin@gmail.com>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQWRoZW1lcnZhbCBaYW5lbGxhDQo+IFNlbnQ6IDIxIEFwcmlsIDIwMjAgMTY6MDENCj4g
DQo+IE9uIDIxLzA0LzIwMjAgMTE6MzksIFJpY2ggRmVsa2VyIHdyb3RlOg0KPiA+IE9uIFR1ZSwg
QXByIDIxLCAyMDIwIGF0IDEyOjI4OjI1UE0gKzAwMDAsIERhdmlkIExhaWdodCB3cm90ZToNCj4g
Pj4gRnJvbTogTmljaG9sYXMgUGlnZ2luDQo+ID4+PiBTZW50OiAyMCBBcHJpbCAyMDIwIDAyOjEw
DQo+ID4+IC4uLg0KPiA+Pj4+PiBZZXMsIGJ1dCBkb2VzIGl0IHJlYWxseSBtYXR0ZXIgdG8gb3B0
aW1pemUgdGhpcyBzcGVjaWZpYyB1c2FnZSBjYXNlDQo+ID4+Pj4+IGZvciBzaXplPyBnbGliYywg
Zm9yIGluc3RhbmNlLCB0cmllcyB0byBsZXZlcmFnZSB0aGUgc3lzY2FsbCBtZWNoYW5pc20NCj4g
Pj4+Pj4gYnkgYWRkaW5nIHNvbWUgY29tcGxleCBwcmUtcHJvY2Vzc29yIGFzbSBkaXJlY3RpdmVz
LiAgSXQgb3B0aW1pemVzDQo+ID4+Pj4+IHRoZSBzeXNjYWxsIGNvZGUgc2l6ZSBpbiBtb3N0IGNh
c2VzLiAgRm9yIGluc3RhbmNlLCBraWxsIGluIHN0YXRpYyBjYXNlDQo+ID4+Pj4+IGdlbmVyYXRl
cyBvbiB4ODZfNjQ6DQo+ID4+Pj4+DQo+ID4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAgPF9fa2lsbD46
DQo+ID4+Pj4+ICAgIDA6ICAgYjggM2UgMDAgMDAgMDAgICAgICAgICAgbW92ICAgICQweDNlLCVl
YXgNCj4gPj4+Pj4gICAgNTogICAwZiAwNSAgICAgICAgICAgICAgICAgICBzeXNjYWxsDQo+ID4+
Pj4+ICAgIDc6ICAgNDggM2QgMDEgZjAgZmYgZmYgICAgICAgY21wICAgICQweGZmZmZmZmZmZmZm
ZmYwMDEsJXJheA0KPiA+Pj4+PiAgICBkOiAgIDBmIDgzIDAwIDAwIDAwIDAwICAgICAgIGphZSAg
ICAxMyA8X19raWxsKzB4MTM+DQo+ID4+DQo+ID4+IEhtbW0uLi4gdGhhdCBjbXAgKyBqYWUgaXMg
dW5uZWNlc3NhcnkgaGVyZS4NCj4gPg0KPiA+IEl0J3Mgbm90Li4gUmF0aGVyIHRoZSBvYmpkdW1w
IHdhcyBqdXN0IG1pc3Rha2VubHkgZG9uZSB3aXRob3V0IC1yIHNvDQo+ID4gaXQgbG9va3MgbGlr
ZSBhIG5vcCBqdW1wIHJhdGhlciB0aGFuIGEgY29uZGl0aW9uYWwgdGFpbCBjYWxsIHRvIHRoZQ0K
PiA+IGZ1bmN0aW9uIHRoYXQgc2V0cyBlcnJuby4NCj4gPg0KPiANCj4gSW5kZWVkLCB0aGUgb3V0
cHV0IHdpdGggLXIgaXM6DQo+IA0KPiAwMDAwMDAwMDAwMDAwMDAwIDxfX2tpbGw+Og0KPiAgICAw
OiAgIGI4IDNlIDAwIDAwIDAwICAgICAgICAgIG1vdiAgICAkMHgzZSwlZWF4DQo+ICAgIDU6ICAg
MGYgMDUgICAgICAgICAgICAgICAgICAgc3lzY2FsbA0KPiAgICA3OiAgIDQ4IDNkIDAxIGYwIGZm
IGZmICAgICAgIGNtcCAgICAkMHhmZmZmZmZmZmZmZmZmMDAxLCVyYXgNCj4gICAgZDogICAwZiA4
MyAwMCAwMCAwMCAwMCAgICAgICBqYWUgICAgMTMgPF9fa2lsbCsweDEzPg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBmOiBSX1g4Nl82NF9QTFQzMiAgICAgICBfX3N5c2NhbGxfZXJyb3ItMHg0
DQo+ICAgMTM6ICAgYzMgICAgICAgICAgICAgICAgICAgICAgcmV0cQ0KDQpZZXMsIEkgcHJvYmFi
bHkgc2hvdWxkIGhhdmUgcmVtZW1iZXJlZCBpdCBsb29rZWQgbGlrZSB0aGF0IDotKQ0KLi4uDQo+
ID4+IEkgYWxzbyBzdXNwZWN0IGl0IGdldHMgcHJlZGljdGVkIHZlcnkgYmFkbHkuDQo+ID4NCj4g
PiBJIGRvdWJ0IHRoYXQuIFRoaXMgaXMgYSB2ZXJ5IHN0YW5kYXJkIGlkaW9tIGFuZCB0aGUgc2l6
ZSBvZiB0aGUgb2Zmc2V0DQo+ID4gKHdoaWNoIGlzIG5lY2Vzc2FyaWx5IDMyLWJpdCBiZWNhdXNl
IGl0IGhhcyBhIHJlbG9jYXRpb24gb24gaXQpIGlzDQo+ID4gb3J0aG9nb25hbCB0byB0aGUgY29u
ZGl0aW9uIG9uIHRoZSBqdW1wLg0KDQpZZXMsIGl0IG9ubHkgZ2V0cyBtaXNwcmVkaWN0ZWQgYXMg
YmFkbHkgYXMgYW55IG90aGVyIGNvbmRpdGlvbmFsIGp1bXAuDQpJIGJlbGlldmUgbW9kZXJuIGlu
dGVsIHg4NiB3aWxsIHJhbmRvbWx5IHByZWRpY3QgaXQgdGFrZW4gKHJlZ2FyZGxlc3MNCm9mIHRo
ZSBkaXJlY3Rpb24pIGFuZCB0aGVuIGhpdCBhIFRMQiBmYXVsdCBvbiB0ZXh0LnVubGlrZWx5IDot
KQ0KDQo+ID4gRldJVyBhIHN5c2NhbGwgbGlrZSBraWxsIHRha2VzIGdsb2JhbCBrZXJuZWwtc2lk
ZSBsb2NrcyB0byBiZSBhYmxlIHRvDQo+ID4gYWRkcmVzcyBhIHRhcmdldCBwcm9jZXNzIGJ5IHBp
ZCwgYW5kIHRoZSByYXRlIG9mIG1lYW5pbmdmdWwgY2FsbHMgeW91DQo+ID4gY2FuIG1ha2UgdG8g
aXQgaXMgdmVyeSBsb3cgKHNpbmNlIGl0J3MgYm91bmRlZCBieSB0aW1lIGZvciB0YXJnZXQNCj4g
PiBwcm9jZXNzIHRvIGFjdCBvbiB0aGUgc2lnbmFsKS4gVHJ5aW5nIHRvIG9wdGltaXplIGl0IGZv
ciBzcGVlZCBpcw0KPiA+IHBvaW50bGVzcywgYW5kIGV2ZW4gc2l6ZSBpc24ndCBpbXBvcnRhbnQg
bG9jYWxseSAoYWx0aG91Z2ggaW4NCj4gPiBhZ2dyZWdhdGUsIGxvdHMgb2Ygd2FzdGVkIHNtYWxs
IHNpemUgY2FuIGFkZCB1cCB0byBtb3JlIHBhZ2VzID0gbW9yZQ0KPiA+IFRMQiBlbnRyaWVzID0g
Li4uKS4NCj4gDQo+IEkgYWdyZWUgYW5kIEkgd291bGQgcHJlZmVyIHRvIGZvY3VzIG9uIGNvZGUg
c2ltcGxpY2l0eSB0byBoYXZlIGENCj4gcGxhdGZvcm0gbmV1dHJhbCB3YXkgdG8gaGFuZGxlIGVy
cm9yIGFuZCBsZXQgdGhlIGNvbXBpbGVyIG9wdGltaXplDQo+IGl0IHRoYW4gbWVzc3kgd2l0aCBh
c3NlbWJseSBtYWNyb3MgdG8gc3F1ZWV6ZSB0aGlzIGtpbmQgb2YNCj4gbWljcm8tb3B0aW1pemF0
aW9ucy4NCg0Kc3lzY2FsbCBlbnRyeSBkb2VzIGdldCBtaWNyby1vcHRpbWlzZWQuDQpSZWFsIHNw
ZWVkLXVwcyBjYW4gcHJvYmFibHkgYmUgZm91bmQgYnkgb3B0aW1pc2luZyBvdGhlciBwbGFjZXMu
DQpJJ3ZlIGEgcGF0Y2ggaSBuZWVkIHRvIHJlc3VtYml0IHRoYXQgc2hvdWxkIGltcHJvdmUgdGhl
IHJlYWRpbmcNCm9mIGlvdltdIGZyb20gdXNlciBzcGFjZS4NCg0KCURhdmlkDQoNCi0NClJlZ2lz
dGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24g
S2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

