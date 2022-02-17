Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C24BA665
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 17:50:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K016251fjz3cRn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 03:50:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K015c55hfz3cNT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 03:49:54 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-105-or7gv4dQNTyuquFpTqc4SQ-1; Thu, 17 Feb 2022 16:49:50 +0000
X-MC-Unique: or7gv4dQNTyuquFpTqc4SQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 17 Feb 2022 16:49:49 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 17 Feb 2022 16:49:49 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Masahiro Yamada' <masahiroy@kernel.org>
Subject: RE: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
Thread-Topic: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
Thread-Index: AQHYI/ioJk+yETn/QkyN152xjKaZ96yXvR4wgAAXuo+AAALtMIAAE/+AgAAGkIA=
Date: Thu, 17 Feb 2022 16:49:49 +0000
Message-ID: <2e38265880db45afa96cfb51223f7418@AcuMS.aculab.com>
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
 <35bcd5df0fb546008ff4043dbea68836@AcuMS.aculab.com>
 <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
 <9b8ef186-c7fe-822c-35df-342c9e86cc88@csgroup.eu>
 <3c2b682a7d804b5e8749428b50342c82@AcuMS.aculab.com>
 <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
In-Reply-To: <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTWFzYWhpcm8gWWFtYWRhDQo+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjIgMTY6MTcNCi4u
Lg0KPiBOby4gIE5vdCB0aGF0IG9uZS4NCj4gDQo+IFRoZSBjb21taXQgeW91IHByZXN1bWFibHkg
d2FudCB0byByZXZlcnQgaXM6DQo+IA0KPiBhNzcxZjJiODJhYTIgKCJbUEFUQ0hdIEFkZCBhIHNl
Y3Rpb24gYWJvdXQgaW5saW5pbmcgdG8NCj4gRG9jdW1lbnRhdGlvbi9Db2RpbmdTdHlsZSIpDQo+
IA0KPiBUaGlzIGlzIG5vdyByZWZlcnJlZCB0byBhcyAiX19hbHdheXNfaW5saW5lIGRpc2Vhc2Ui
LCB0aG91Z2guDQoNClRoYXQgZGVzY3JpcHRpb24gaXMgbGFyZ2VseSBmaW5lLg0KDQpJbmFwcHJv
cHJpYXRlICdpbmxpbmUnIG91Z2h0IHRvIGJlIHJlbW92ZWQuDQpUaGVuICdpbmxpbmUnIG1lYW5z
IC0gJ3JlYWxseSBkbyBpbmxpbmUgdGhpcycuDQoNCkFueW9uZSByZW1lbWJlciBtYXNzaXZlIDEw
MCsgbGluZSAjZGVmaW5lcyBiZWluZw0KdXNlZCB0byBnZXQgY29kZSBpbmxpbmVkICd0byBtYWtl
IGl0IGZhc3RlcicuDQpTb21ldGltZXMgYmVpbmcgZXhwYW5kZWQgc2V2ZXJhbCB0aW1lcyBpbiBz
dWNjZXNzaW9uLg0KTWF5IGhhdmUgaGVscGVkIGEgNjgwMjAsIGJ1dCBsaWtlbHkgdG8gYmUgYSBs
b3NzIG9uDQptb2Rlcm4gY3B1IHdpdGggbGFyZ2UgSS1jYWNoZSBhbmQgc2xvdyBtZW1vcnkuDQoN
CglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwg
TW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzog
MTM5NzM4NiAoV2FsZXMpDQo=

