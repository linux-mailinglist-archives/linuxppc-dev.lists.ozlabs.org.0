Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD82D7FB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 20:58:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ct1mx4TvkzDr2d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 06:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ct1lQ48MlzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 06:57:04 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-43-udaKKb9nOGy_5JUKHtdpwQ-1; Fri, 11 Dec 2020 16:55:31 +0000
X-MC-Unique: udaKKb9nOGy_5JUKHtdpwQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 11 Dec 2020 16:55:30 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 11 Dec 2020 16:55:30 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, Xu Wang
 <vulab@iscas.ac.cn>, "pantelis.antoniou@gmail.com"
 <pantelis.antoniou@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH] net: ethernet: fs-enet: remove casting dma_alloc_coherent
Thread-Topic: [PATCH] net: ethernet: fs-enet: remove casting dma_alloc_coherent
Thread-Index: AQHWz9GpgD7sF0Ef20abEun/SaRAM6nyD2uwgAAKTACAAABqUA==
Date: Fri, 11 Dec 2020 16:55:30 +0000
Message-ID: <3f31140339c94652b1e7116e91cfd9c8@AcuMS.aculab.com>
References: <20201211085212.85457-1-vulab@iscas.ac.cn>
 <34548188-67f4-d3ef-c2e3-871fc520e838@csgroup.eu>
 <6fc4b62ee7754d78b8f7b9c2275bc47e@AcuMS.aculab.com>
 <4a1c2852-781f-e125-afcb-69387660b6af@csgroup.eu>
In-Reply-To: <4a1c2852-781f-e125-afcb-69387660b6af@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAxMSBEZWNlbWJlciAyMDIwIDE2OjQzDQo+
IA0KPiBMZSAxMS8xMi8yMDIwIMOgIDE3OjA3LCBEYXZpZCBMYWlnaHQgYSDDqWNyaXTCoDoNCj4g
PiBGcm9tOiBDaHJpc3RvcGhlIExlcm95DQo+ID4+IFNlbnQ6IDExIERlY2VtYmVyIDIwMjAgMTU6
MjINCj4gPj4NCj4gPj4gTGUgMTEvMTIvMjAyMCDDoCAwOTo1MiwgWHUgV2FuZyBhIMOpY3JpdMKg
Og0KPiA+Pj4gUmVtb3ZlIGNhc3RpbmcgdGhlIHZhbHVlcyByZXR1cm5lZCBieSBkbWFfYWxsb2Nf
Y29oZXJlbnQuDQo+ID4+DQo+ID4+IENhbiB5b3UgZXhwbGFpbiBtb3JlIGluIHRoZSBjb21taXQg
bG9nID8NCj4gPj4NCj4gPj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgZG1hX2FsbG9jX2NvaGVyZW50
KCkgZG9lc24ndCByZXR1cm4gX19pb21lbSwgYW5kIHJpbmdfYmFzZSBtZW1iZXIgaXMgX19pb21l
bQ0KPiA+DQo+ID4gV2hpY2ggaXMgcHJvYmFibHkgd3JvbmcgLSB0aGF0IGlzIHRoZSBrZXJuZWwg
YWRkcmVzcyBvZiBrZXJuZWwgbWVtb3J5Lg0KPiA+IFNvIGl0IHNob3VsZG4ndCBoYXZlIHRoZSBf
X2lvbWVtIG1hcmtlci4NCj4gDQo+IFRoYXQncyB3aGVyZSB0aGUgYnVmZmVyIGRlc2NyaXB0b3Jz
IGFyZSwgdGhlIGRyaXZlciBhY2Nlc3NlcyB0byB0aGUgY29udGVudCBvZiB0aGUgYnVmZmVyDQo+
IGRlc2NyaXB0b3JzIHVzaW5nIHRoZSBJTyBhY2Nlc3NvcnMgaW5fYmUxNigpL291dF9iZTE2KCku
IElzIGl0IG5vdCBjb3JyZWN0ID8NCg0KSSd2ZSBqdXN0IGJlZW4gbG9va2luZyBhdCB0aGUgY3Jh
cCBpbiB0aGVyZS4NCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBJTyBhY2Nlc3NvcnMgYXJlIGZv
ciBJTyBkZXZpY2VzIChlZyBhZGRyZXNzZXMNCmZyb20gaW9fcmVtYXAoKSBldGMpLg0KDQpCdWZm
ZXJzIGFsbG9jYXRlZCBieSBkbWFfYWxsb2NfY29oZXJlbnQoKSBhcmUgbm9ybWFsIGtlcm5lbCBt
ZW1vcnkNCmFuZCBkb24ndCBuZWVkIGFueSBhY2Nlc3NvcnMuDQpOb3cgeW91IG1pZ2h0IG5lZWQg
c29tZSBiYXJyaWVycyAtIG1vc3RseSBiZWNhdXNlIGFuIGV0aGVybmV0IGNoaXANCmNhbiB0eXBp
Y2FsbHkgcmVhZCBhIHJpbmcgZW50cnkgd2l0aG91dCBiZWluZyBwcm9kZGVkLg0KSUlSQyB0aGVy
ZSBpcyBhIGJhcnJpZXIgaW4gd3JpdGVsKCkgdG8gZW5zdXJlIHRoZSBkbWEgbWFzdGVyIHdpbGwN
CidzZWUnIGFsbCBtZW1vcnkgd3JpdGVzIGRvbmUgYmVmb3JlIHRoZSBJTyB3cml0ZSB0aGF0IGtp
Y2tzIGl0IGludG8NCmRvaW5nIHNvbWUgcHJvY2Vzc2luZy4NCg0KVGhlIGZhY3QgdGhhdCB0aGUg
ZHJpdmVyIGNvbnRhaW5zIHNvIG1hbnkgX19pb21lbSBjYXN0cyAoZWcgaW4NCnR4X3Jlc3RhcnQp
IGlzIGFuIGluZGljYXRpb24gdGhhdCBzb21ldGhpbmcgaXMgYmFkbHkgYXdyeS4NCl9faW9tZW0g
ZXhpc3RzIHRvIGNoZWNrIHlvdSBhcmUgdXNpbmcgdGhlIGNvcnJlY3QgdHlwZSBvZiBwb2ludGVy
Lg0KQW55IF9faW9tZW0gY2FzdHMgYXJlIGR1YmlvdXMuDQoNCglEYXZpZA0KDQo+IA0KPiBDaHJp
c3RvcGhlDQo+IA0KPiA+DQo+ID4gSSB3b25kZXIgd2hhdCBlbHNlIGlzIHdyb25nLi4uLg0KPiA+
DQo+ID4gCURhdmlkDQo+ID4NCj4gPj4NCj4gPj4gQ2hyaXN0b3BoZQ0KPiA+Pg0KPiA+Pj4NCj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IFh1IFdhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPg0KPiA+Pj4gLS0t
DQo+ID4+PiAgICBkcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZnNfZW5ldC9tYWMtZmVj
LmMgfCAyICstDQo+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
ZnJlZXNjYWxlL2ZzX2VuZXQvbWFjLWZlYy5jDQo+ID4+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
ZnJlZXNjYWxlL2ZzX2VuZXQvbWFjLWZlYy5jDQo+ID4+PiBpbmRleCA5OWZlMmMyMTBkMGYuLjNh
ZTM0NTY3NmU1MCAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVz
Y2FsZS9mc19lbmV0L21hYy1mZWMuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
ZnJlZXNjYWxlL2ZzX2VuZXQvbWFjLWZlYy5jDQo+ID4+PiBAQCAtMTMxLDcgKzEzMSw3IEBAIHN0
YXRpYyBpbnQgYWxsb2NhdGVfYmQoc3RydWN0IG5ldF9kZXZpY2UgKmRldikNCj4gPj4+ICAgIAlz
dHJ1Y3QgZnNfZW5ldF9wcml2YXRlICpmZXAgPSBuZXRkZXZfcHJpdihkZXYpOw0KPiA+Pj4gICAg
CWNvbnN0IHN0cnVjdCBmc19wbGF0Zm9ybV9pbmZvICpmcGkgPSBmZXAtPmZwaTsNCj4gPj4+DQo+
ID4+PiAtCWZlcC0+cmluZ19iYXNlID0gKHZvaWQgX19mb3JjZSBfX2lvbWVtICopZG1hX2FsbG9j
X2NvaGVyZW50KGZlcC0+ZGV2LA0KPiA+Pj4gKwlmZXAtPnJpbmdfYmFzZSA9IGRtYV9hbGxvY19j
b2hlcmVudChmZXAtPmRldiwNCj4gPj4+ICAgIAkJCQkJICAgIChmcGktPnR4X3JpbmcgKyBmcGkt
PnJ4X3JpbmcpICoNCj4gPj4+ICAgIAkJCQkJICAgIHNpemVvZihjYmRfdCksICZmZXAtPnJpbmdf
bWVtX2FkZHIsDQo+ID4+PiAgICAJCQkJCSAgICBHRlBfS0VSTkVMKTsNCj4gPj4+DQo+ID4NCj4g
PiAtDQo+ID4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50
IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQo+ID4gUmVnaXN0cmF0aW9uIE5vOiAx
Mzk3Mzg2IChXYWxlcykNCj4gPg0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

