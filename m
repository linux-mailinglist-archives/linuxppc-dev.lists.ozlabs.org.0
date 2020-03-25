Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E128C192EF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 18:11:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nZQC1hhZzDqCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 04:10:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nZN873g7zDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 04:09:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48nZN86CWNz8tFV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 04:09:12 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48nZN85sxLz9sR4; Thu, 26 Mar 2020 04:09:12 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
X-Greylist: delayed 306 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Mar 2020 04:09:11 AEDT
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48nZN73byDz9sPk
 for <linuxppc-dev@ozlabs.org>; Thu, 26 Mar 2020 04:09:09 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-161-aeujUnqvMjWVIDQ2tGzp5g-1; Wed, 25 Mar 2020 17:02:40 +0000
X-MC-Unique: aeujUnqvMjWVIDQ2tGzp5g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 25 Mar 2020 17:02:40 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 25 Mar 2020 17:02:40 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joakim Tjernlund' <Joakim.Tjernlund@infinera.com>,
 "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: RE: hardcoded SIGSEGV in __die() ?
Thread-Topic: hardcoded SIGSEGV in __die() ?
Thread-Index: AQHWAR3N4DoCknJ4G0WRUpvoA7Tp+6hWQKiAgAAAbwCAAAadgIAABlwAgAADsgCAAzoK4A==
Date: Wed, 25 Mar 2020 17:02:40 +0000
Message-ID: <1bec238369f24e978e0da14f79b9c55f@AcuMS.aculab.com>
References: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
 <b20d978b-268b-773a-a43e-7ff4c741f2df@c-s.fr>
 <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
 <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
 <43a21b20-4214-1043-0919-1bd8078d14a6@c-s.fr>
 <6b3484a7bf0f760570fbe7c8b22c36a244c19ff6.camel@infinera.com>
In-Reply-To: <6b3484a7bf0f760570fbe7c8b22c36a244c19ff6.camel@infinera.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogSm9ha2ltIFRqZXJubHVuZA0KPiBTZW50OiAyMyBNYXJjaCAyMDIwIDE1OjQ1DQouLi4N
Cj4gPiA+IEkgdHJpZWQgdG8gZm9sbG93IHRoYXQgY2hhaW4gdGhpbmtpbmcgaXQgd291bGQgZW5k
IHVwIHNlbmRpbmcgYSBzaWduYWwgdG8gdXNlciBzcGFjZSBidXQgSSBjYW5ub3QNCj4gc2VlDQo+
ID4gPiB0aGF0IGhhcHBlbnMuIFNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gZGVidWdnaW5nLg0KPiA+
ID4NCj4gPiA+IEluIHNob3J0LCBJIGNhbm5vdCBzZWUgYW55IHNpZ25hbCBiZWluZyBkZWxpdmVy
ZWQgdG8gdXNlciBzcGFjZS4gSWYgc28gdGhhdCB3b3VsZCBleHBsYWluIHdoeQ0KPiA+ID4gb3Vy
IHVzZXIgc3BhY2UgcHJvY2VzcyBuZXZlciBkaWVzLg0KPiA+ID4gSXMgdGhlcmUgYSBzaWduYWwg
aGlkZGVuIGluIG1hY2hpbmVfY2hlY2sgaGFuZGxlciBmb3IgU0lHQlVTIEkgY2Fubm90IHNlZT8N
Cj4gPiA+DQo+ID4NCj4gPiBJc24ndCBpdCBkb25lIGluIGRvX2V4aXQoKSwgY2FsbGVkIGZyb20g
b29wc19lbmQoKSA/DQo+IA0KPiBobW0sIHNvIGl0IHNlZW1zLiBUaGUgb2RkIHRoaW5nIHRob3Vn
aCBpcyB0aGF0IGRvX2V4aXQgdGFrZXMgYW4gZXhpdCBjb2RlLCBub3Qgc2lnbmFsIG51bWJlci4N
Cj4gQWxzbywgZmVlbHMgYSBiaXQgb2RkIHRvIGZvcmNlIGFuIGV4aXQodGhhdCB3ZSBoYXZlbid0
IHNlZW4gaGFwcGVuaW5nKSByYXRoZXIgdGhhbiBqdXN0IGEgc2lnbmFsLg0KDQpJc24ndCB0aGVy
ZSBzb21ldGhpbmcgJ21hZ2ljJyB0aGF0IGNvbnZlcnRzIEVGQVVMVCBpbnRvIFNJR1NFR1Y/DQoN
CglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwg
TW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzog
MTM5NzM4NiAoV2FsZXMpDQo=

