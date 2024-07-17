Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DE2933D8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 15:22:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPGnX587yz3dRb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 23:22:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPGn869zSz30VN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 23:22:03 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-120-3pLnuI2YPKGnDs_ikR4uGQ-1; Wed, 17 Jul 2024 14:21:58 +0100
X-MC-Unique: 3pLnuI2YPKGnDs_ikR4uGQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 17 Jul
 2024 14:21:19 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 17 Jul 2024 14:21:19 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: David Laight <David.Laight@ACULAB.COM>, 'Stewart Hildebrand'
	<stewart.hildebrand@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Zimmermann
	<tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg
	<sam@ravnborg.org>, Yongji Xie <elohimes@gmail.com>,
	=?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
Subject: RE: [PATCH v2 0/8] PCI: Align small (<4k) BARs
Thread-Topic: [PATCH v2 0/8] PCI: Align small (<4k) BARs
Thread-Index: AQHa17cKP+9xH7dU/kmzREQ0omlV2bH64QzQgAAH5ZA=
Date: Wed, 17 Jul 2024 13:21:19 +0000
Message-ID: <9c6845d49fa14d84bb7ada1022147276@AcuMS.aculab.com>
References: <20240716193246.1909697-1-stewart.hildebrand@amd.com>
 <0da056616de54589bc1d4b95dcdf5d3d@AcuMS.aculab.com>
In-Reply-To: <0da056616de54589bc1d4b95dcdf5d3d@AcuMS.aculab.com>
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
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogRGF2aWQgTGFpZ2h0DQo+IFNlbnQ6IDE3IEp1bHkgMjAyNCAxNDoxNQ0KPiANCj4gRnJv
bTogU3Rld2FydCBIaWxkZWJyYW5kDQo+ID4gU2VudDogMTYgSnVseSAyMDI0IDIwOjMzDQo+ID4N
Cj4gPiBUaGlzIHNlcmllcyBzZXRzIHRoZSBkZWZhdWx0IG1pbmltdW0gcmVzb3VyY2UgYWxpZ25t
ZW50IHRvIDRrIGZvciBtZW1vcnkNCj4gPiBCQVJzLiBJbiBwcmVwYXJhdGlvbiwgaXQgbWFrZXMg
YW4gb3B0aW1pemF0aW9uIGFuZCBhZGRyZXNzZXMgc29tZSBjb3JuZXINCj4gPiBjYXNlcyBvYnNl
cnZlZCB3aGVuIHJlYWxsb2NhdGluZyBCQVJzLiBJIGNvbnNpZGVyIHRoZSBwcmVwYXBhdG9yeQ0K
PiA+IHBhdGNoZXMgdG8gYmUgcHJlcmVxdWlzaXRlcyB0byBjaGFuZ2luZyB0aGUgZGVmYXVsdCBC
QVIgYWxpZ25tZW50Lg0KPiANCj4gU2hvdWxkIHRoZSBCQVJzIGJlIHBhZ2UgYWxpZ25lZCBvbiBz
eXN0ZW1zIHdpdGggbGFyZ2UgcGFnZXM/DQo+IEF0IGxlYXN0IGFzIGFuIG9wdGlvbiBmb3IgaHlw
ZXJ2aXNvciBwYXNzLXRocm91Z2ggYW5kIGFueSB0aGFuIGNhbiBiZSBtbWFwKCllZA0KPiBpbnRv
IHVzZXJzcGFjZS4NCg0KVGhlIGFjdHVhbCBwYXRjaCBzYXlzIFBBR0VfU0laRSAuLg0KDQoJRGF2
aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50
IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTcz
ODYgKFdhbGVzKQ0K

