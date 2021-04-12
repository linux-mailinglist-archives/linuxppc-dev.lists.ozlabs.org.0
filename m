Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7935C3C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 12:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJlDn312xz30CL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 20:23:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJlDQ6n8nz2yhk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 20:22:45 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-128-DnwYs6UTM2mO74AA5I6jBQ-1; Mon, 12 Apr 2021 11:22:40 +0100
X-MC-Unique: DnwYs6UTM2mO74AA5I6jBQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 11:22:38 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Mon, 12 Apr 2021 11:22:38 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>
Subject: RE: consolidate the flock uapi definitions
Thread-Topic: consolidate the flock uapi definitions
Thread-Index: AQHXL4M0xqfui6+bp0WfMrJF+xIqXKqwqyrg
Date: Mon, 12 Apr 2021 10:22:38 +0000
Message-ID: <16c471554aa5424fbe2f6a4fd60bd662@AcuMS.aculab.com>
References: <20210412085545.2595431-1-hch@lst.de>
 <CAK8P3a38qgkjkh4+fDKp4TufL+2_W-quZBFK9pJFf7wXP=84xQ@mail.gmail.com>
In-Reply-To: <CAK8P3a38qgkjkh4+fDKp4TufL+2_W-quZBFK9pJFf7wXP=84xQ@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open
 list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Will Deacon <will@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAxMiBBcHJpbCAyMDIxIDExOjA0DQo+IA0KPiBP
biBNb24sIEFwciAxMiwgMjAyMSBhdCAxMDo1NSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBhbGwsDQo+ID4NCj4gPiBjdXJyZW50bHkgd2UgZGVh
bCB3aXRoIHRoZSBzbGlnaHQgZGlmZmVyZW50cyBpbiB0aGUgdmFyaW91cyBhcmNoaXRlY3R1cmUN
Cj4gPiB2YXJpYW50cyBvZiB0aGUgZmxvY2sgYW5kIGZsb2NrNjQgc3R1Y3R1cmVzIGluIGEgdmVy
eSBjcnVmdCB3YXkuICBUaGlzDQo+ID4gc2VyaWVzIHN3aXRjaGVzIHRvIGp1c3QgdXNlIHNtYWxs
IGFyY2ggaG9va3MgYW5kIGRlZmluZSB0aGUgcmVzdCBpbg0KPiA+IGFzbS1nZW5lcmljIGFuZCBs
aW51eC9jb21wYXQuaCBpbnN0ZWFkLg0KPiANCj4gTmljZSBjbGVhbnVwLiBJIGNhbiBtZXJnZSBp
dCB0aHJvdWdoIHRoZSBhc20tZ2VuZXJpYyB0cmVlIGlmIHlvdSBsaWtlLA0KPiB0aG91Z2ggaXQn
cyBhIGxpdHRsZSBsYXRlIGp1c3QgYWhlYWQgb2YgdGhlIG1lcmdlIHdpbmRvdy4NCj4gDQo+IEkg
d291bGQgbm90IHdhbnQgdG8gY2hhbmdlIHRoZSBjb21wYXRfbG9mZl90IGRlZmluaXRpb24gdG8g
Y29tcGF0X3M2NA0KPiB0byBhdm9pZCB0aGUgcGFkZGluZyBhdCB0aGlzIHRpbWUsIHRob3VnaCB0
aGF0IG1pZ2h0IGJlIGEgdXNlZnVsIGNsZWFudXANCj4gZm9yIGEgZnV0dXJlIGN5Y2xlLg0KDQpJ
cyB4ODYgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHRoYXQgaGFzIDMyYml0IGFuZCA2NGJpdCB2YXJp
YW50cyB3aGVyZQ0KdGhlIDMyYml0IHZhcmlhbnQgYWxpZ25zIDY0Yml0IGl0ZW1zIG9uIDMyYml0
IGJvdW5kYXJpZXM/DQoNCkkndmUganVzdCBjaGVja2VkIE1JUFMgYW5kIEFSTSwgYW5kIEknbSBm
YWlybHkgc3VyZSBzcGFyYyA2NGJpdA0KYWxpZ25zIHRoZW0uDQoNCkFyZSB0aGVyZSBhbnkgb3Ro
ZXJzPw0KDQpNaWdodCBhbHNvIGJlIGludGVyZXN0aW5nIHRvIGNoZWNrIHdoZXRoZXIgY29tcGF0
X2xvZmZfdCBnZXRzDQp1c2VkIGFueXdoZXJlIGVsc2UgLSB3aGVyZSB0aGUgeDY0LTY0IGNvbXBh
dCBjb2RlIHdpbGwgZ2V0IGl0DQp3cm9uZy4NCg0KSVNUTSB0aGF0IGZpeGluZyBjb21wYXRfbG9m
Zl90IHNob3VsZG4ndCBoYXZlIGFueSBmYWxsb3V0Lg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJl
ZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXlu
ZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

