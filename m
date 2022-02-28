Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 551974C6B85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 13:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6fCm3vQNz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 23:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6fCF5NNpz30MH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:02:47 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-166-d7SEXvIjOR2492KDyKN4ug-1; Mon, 28 Feb 2022 12:02:41 +0000
X-MC-Unique: d7SEXvIjOR2492KDyKN4ug-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 12:02:38 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 28 Feb 2022 12:02:38 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>
Subject: RE: [PATCH V7 03/20] compat: consolidate the compat_flock{,64}
 definition
Thread-Topic: [PATCH V7 03/20] compat: consolidate the compat_flock{,64}
 definition
Thread-Index: AQHYK/ctkLOBFN5NzkqkonsQCyvC26yogbZggABZggCAAAIWoA==
Date: Mon, 28 Feb 2022 12:02:38 +0000
Message-ID: <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
 <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
In-Reply-To: <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "drew@beagleboard.org" <drew@beagleboard.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "liush@allwinnertech.com" <liush@allwinnertech.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "wefu@redhat.com" <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogR3VvIFJlbg0KPiBTZW50OiAyOCBGZWJydWFyeSAyMDIyIDExOjUyDQo+IA0KPiBPbiBN
b24sIEZlYiAyOCwgMjAyMiBhdCAyOjQwIFBNIERhdmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0QGFj
dWxhYi5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogZ3VvcmVuQGtlcm5lbC5vcmcNCj4gPiA+
IFNlbnQ6IDI3IEZlYnJ1YXJ5IDIwMjIgMTY6MjgNCj4gPiA+DQo+ID4gPiBGcm9tOiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4NCj4gPiA+DQo+ID4gPiBQcm92aWRlIGEgc2luZ2xlIGNv
bW1vbiBkZWZpbml0aW9uIGZvciB0aGUgY29tcGF0X2Zsb2NrIGFuZA0KPiA+ID4gY29tcGF0X2Zs
b2NrNjQgc3RydWN0dXJlcyB1c2luZyB0aGUgc2FtZSB0cmlja3MgYXMgZm9yIHRoZSBuYXRpdmUN
Cj4gPiA+IHZhcmlhbnRzLiAgQW5vdGhlciBleHRyYSBkZWZpbmUgaXMgYWRkZWQgZm9yIHRoZSBw
YWNraW5nIHJlcXVpcmVkIG9uDQo+ID4gPiB4ODYuDQo+ID4gLi4uDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vY29tcGF0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9j
b21wYXQuaA0KPiA+IC4uLg0KPiA+ID4gIC8qDQo+ID4gPiAtICogSUEzMiB1c2VzIDQgYnl0ZSBh
bGlnbm1lbnQgZm9yIDY0IGJpdCBxdWFudGl0aWVzLA0KPiA+ID4gLSAqIHNvIHdlIG5lZWQgdG8g
cGFjayB0aGlzIHN0cnVjdHVyZS4NCj4gPiA+ICsgKiBJQTMyIHVzZXMgNCBieXRlIGFsaWdubWVu
dCBmb3IgNjQgYml0IHF1YW50aXRpZXMsIHNvIHdlIG5lZWQgdG8gcGFjayB0aGUNCj4gPiA+ICsg
KiBjb21wYXQgZmxvY2s2NCBzdHJ1Y3R1cmUuDQo+ID4gPiAgICovDQo+ID4gLi4uDQo+ID4gPiAr
I2RlZmluZSBfX0FSQ0hfTkVFRF9DT01QQVRfRkxPQ0s2NF9QQUNLRUQNCj4gPiA+DQo+ID4gPiAg
c3RydWN0IGNvbXBhdF9zdGF0ZnMgew0KPiA+ID4gICAgICAgaW50ICAgICAgICAgICAgIGZfdHlw
ZTsNCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NvbXBhdC5oIGIvaW5jbHVkZS9s
aW51eC9jb21wYXQuaA0KPiA+ID4gaW5kZXggMWM3NThiMGUwMzU5Li5hMDQ4MWZlNmM1ZDUgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2NvbXBhdC5oDQo+ID4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L2NvbXBhdC5oDQo+ID4gPiBAQCAtMjU4LDYgKzI1OCwzNyBAQCBzdHJ1Y3QgY29t
cGF0X3JsaW1pdCB7DQo+ID4gPiAgICAgICBjb21wYXRfdWxvbmdfdCAgcmxpbV9tYXg7DQo+ID4g
PiAgfTsNCj4gPiA+DQo+ID4gPiArI2lmZGVmIF9fQVJDSF9ORUVEX0NPTVBBVF9GTE9DSzY0X1BB
Q0tFRA0KPiA+ID4gKyNkZWZpbmUgX19BUkNIX0NPTVBBVF9GTE9DSzY0X1BBQ0sgICBfX2F0dHJp
YnV0ZV9fKChwYWNrZWQpKQ0KPiA+ID4gKyNlbHNlDQo+ID4gPiArI2RlZmluZSBfX0FSQ0hfQ09N
UEFUX0ZMT0NLNjRfUEFDSw0KPiA+ID4gKyNlbmRpZg0KPiA+IC4uLg0KPiA+ID4gK3N0cnVjdCBj
b21wYXRfZmxvY2s2NCB7DQo+ID4gPiArICAgICBzaG9ydCAgICAgICAgICAgbF90eXBlOw0KPiA+
ID4gKyAgICAgc2hvcnQgICAgICAgICAgIGxfd2hlbmNlOw0KPiA+ID4gKyAgICAgY29tcGF0X2xv
ZmZfdCAgIGxfc3RhcnQ7DQo+ID4gPiArICAgICBjb21wYXRfbG9mZl90ICAgbF9sZW47DQo+ID4g
PiArICAgICBjb21wYXRfcGlkX3QgICAgbF9waWQ7DQo+ID4gPiArI2lmZGVmIF9fQVJDSF9DT01Q
QVRfRkxPQ0s2NF9QQUQNCj4gPiA+ICsgICAgIF9fQVJDSF9DT01QQVRfRkxPQ0s2NF9QQUQNCj4g
PiA+ICsjZW5kaWYNCj4gPiA+ICt9IF9fQVJDSF9DT01QQVRfRkxPQ0s2NF9QQUNLOw0KPiA+ID4g
Kw0KPiA+DQo+ID4gUHJvdmlkZWQgY29tcGF0X2xvZmZfdCBhcmUgY29ycmVjdGx5IGRlZmluZWQg
d2l0aCBfX2FsaWduZWRfXyg0KQ0KPiBTZWUgaW5jbHVkZS9hc20tZ2VuZXJpYy9jb21wYXQuaA0K
PiANCj4gdHlwZWRlZiBzNjQgY29tcGF0X2xvZmZfdDsNCj4gDQo+IE9ubHk6DQo+ICNpZmRlZiBD
T05GSUdfQ09NUEFUX0ZPUl9VNjRfQUxJR05NRU5UDQo+IHR5cGVkZWYgczY0IF9fYXR0cmlidXRl
X18oKGFsaWduZWQoNCkpKSBjb21wYXRfczY0Ow0KPiANCj4gU28gaG93IGRvIHlvdSB0aGluayBj
b21wYXRfbG9mZl90IGNvdWxkIGJlIGRlZmluZWQgd2l0aCBfX2FsaWduZWRfXyg0KT8NCg0KY29t
cGF0X2xvZmZfdCBzaG91bGQgYmUgY29tcGF0X3M2NCBub3QgczY0Lg0KDQpUaGUgc2FtZSBzaG91
bGQgYmUgZG9uZSBmb3IgYWxsIDY0Yml0ICdjb21wYXQnIHR5cGVzLg0KDQoJRGF2aWQNCg0KLQ0K
UmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1p
bHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVz
KQ0K

