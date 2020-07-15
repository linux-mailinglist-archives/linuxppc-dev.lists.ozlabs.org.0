Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E1220F64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:32:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6KbZ31yCzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:32:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6KQR1wdjzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:24:29 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-141-cz9nZDW3NY6HKvk6yRxSLA-1; Wed, 15 Jul 2020 15:24:22 +0100
X-MC-Unique: cz9nZDW3NY6HKvk6yRxSLA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 15 Jul 2020 15:24:21 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 15 Jul 2020 15:24:21 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>
Subject: RE: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Topic: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Index: AQHWWnPXll7fc/pDfESpF9qKWOuIcakIsKIA
Date: Wed, 15 Jul 2020 14:24:21 +0000
Message-ID: <4c994d9a804b4a2c8555c50b63e20772@AcuMS.aculab.com>
References: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
 <20200714234625.GA428442@bjorn-Precision-5520>
 <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
In-Reply-To: <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Kjetil Oftedal <oftedal@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "bjorn@helgaas.com" <bjorn@helgaas.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Richard
 Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAxNSBKdWx5IDIwMjAgMDc6NDcNCj4gT24gV2Vk
LCBKdWwgMTUsIDIwMjAgYXQgMTo0NiBBTSBCam9ybiBIZWxnYWFzIDxoZWxnYWFzQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPiANCj4gIFNvIHNvbWV0aGluZyBsaWtlOg0KPiA+DQo+ID4gICB2b2lkIHBj
aV9yZWFkX2NvbmZpZ193b3JkKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGludCB3aGVyZSwgdTE2ICp2
YWwpDQo+ID4NCj4gPiBhbmQgd2hlcmUgd2UgdXNlZCB0byByZXR1cm4gYW55dGhpbmcgbm9uLXpl
cm8sIHdlIGp1c3Qgc2V0ICp2YWwgPSB+MA0KPiA+IGluc3RlYWQ/ICBJIHRoaW5rIHdlIGRvIHRo
YXQgYWxyZWFkeSBpbiBtb3N0LCBtYXliZSBhbGwsIGNhc2VzLg0KPiANCj4gUmlnaHQsIHRoaXMg
aXMgd2hhdCBJIGhhZCBpbiBtaW5kLiBJZiB3ZSBzdGFydCBieSByZW1vdmluZyB0aGUgaGFuZGxp
bmcNCj4gb2YgdGhlIHJldHVybiBjb2RlIGluIGFsbCBmaWxlcyB0aGF0IGNsZWFybHkgZG9uJ3Qg
bmVlZCBpdCwgbG9va2luZyBhdA0KPiB3aGF0ZXZlciByZW1haW5zIHdpbGwgZ2l2ZSBhIG11Y2gg
YmV0dGVyIGlkZWEgb2Ygd2hhdCBhIGdvb2QgaW50ZXJmYWNlDQo+IHNob3VsZCBiZS4NCg0KSXQg
d291bGQgYmUgYmVzdCB0byBnZXQgcmlkIG9mIHRoYXQgbmFzdHkgJ3UxNiAqJyBwYXJhbWV0ZXIu
DQpNYWtlIHRoZSByZXR1cm4gaW50IGFuZCByZXR1cm4gdGhlIHJlYWQgdmFsdWUgb3IgLTEgb24g
ZXJyb3IuDQooT3IgbWF5YmUgMHhmZmZmMDAwMCBvbiBlcnJvcj8/KQ0KDQpGb3IgYSAzMmJpdCBy
ZWFkICh0aGVyZSBtdXN0IGJlIG9uZSBmb3IgdGhlIEJBUnMpIHJldHVybmluZw0KYSA2NGJpdCBz
aWduZWQgaW50ZWdlciB3b3VsZCB3b3JrIGV2ZW4gZm9yIDMyYml0IHN5c3RlbXMuDQoNCklmIGNv
ZGUgY2FyZXMgYWJvdXQgdGhlIGVycm9yLCBhbmQgaXQgY2FuIGJlIGRldGVjdGVkIHRoZW4NCml0
IGNhbiBjaGVjay4gT3RoZXJ3aXNlIHRoZSBpdCBhbGwgJ2p1c3Qgd29ya3MnLg0KDQoJRGF2aWQN
Cg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZh
cm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYg
KFdhbGVzKQ0K

