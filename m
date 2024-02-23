Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11F860F40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 11:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th5q21Q00z30Pp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 21:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th5pZ67Q8z3cM2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 21:29:08 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-304-rbwHhyTYOouvcHjWUdr7sQ-1; Fri, 23 Feb 2024 10:28:59 +0000
X-MC-Unique: rbwHhyTYOouvcHjWUdr7sQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 23 Feb
 2024 10:28:57 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 23 Feb 2024 10:28:57 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, Charlie Jenkins
	<charlie@rivosinc.com>, Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt
	<palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Helge Deller
	<deller@gmx.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Parisc List
	<linux-parisc@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: RE: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Thread-Topic: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Thread-Index: AQHaZkAGLgdm0wM7/EyWAeS1+R0G6rEXuK8g
Date: Fri, 23 Feb 2024 10:28:57 +0000
Message-ID: <fa37be6a8c014d39ab75978e10995ca8@AcuMS.aculab.com>
References: <20240221-fix_sparse_errors_checksum_tests-v9-0-bff4d73ab9d1@rivosinc.com>
 <20240221-fix_sparse_errors_checksum_tests-v9-2-bff4d73ab9d1@rivosinc.com>
 <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
In-Reply-To: <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAyMyBGZWJydWFyeSAyMDI0IDEwOjA3DQou
Li4NCj4gPiArLyogRXRoZXJuZXQgaGVhZGVycyBhcmUgMTQgYnl0ZXMgYW5kIE5FVF9JUF9BTElH
TiBpcyB1c2VkIHRvIGFsaWduIHRoZW0gKi8NCj4gPiArI2RlZmluZSBJUF9BTElHTk1FTlQgKDE0
ICsgTkVUX0lQX0FMSUdOKQ0KPiANCj4gT25seSBpZiBubyBWTEFOLg0KPiANCj4gV2hlbiB1c2lu
ZyBWTEFOcyBpdCBpcyA0IGJ5dGVzIG1vcmUuIEJ1dCB3aHkgZG8geW91IG1pbmQgdGhhdCBhdCBh
bGwgPw0KDQpXYXNuJ3Qgb25lIGFyY2hpdGVjdHVyZSBmYXVsdGluZyBvbiBhIGRvdWJsZS1yZWdp
c3RlciByZWFkPw0KV2hlcmUgdGhhdCBoYWQgdG8gYmUgYWxpZ25lZCAocHJvYmFibHkgOCBieXRl
cykgYnV0IGEgbm9ybWFsDQptZW1vcnkgcmVhZCBjb3VsZCBiZSBtaXNhbGlnbmVkPw0KDQpJIGRv
dWJ0IGl0IGlzIHZhbGlkIHRvIGFzc3VtZSB0aGF0IHRoZSBJUCBoZWFkZXJzIGlzIDggYnl0ZQ0K
YWxpZ25lZCB3aGVuIE5FVF9JUF9BTElHTiBpcyAyLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJl
ZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXlu
ZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

