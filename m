Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FA13F277
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 19:35:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zCYq4X6XzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 05:35:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ACULAB.COM
X-Greylist: delayed 1692 seconds by postgrey-1.36 at bilbo;
 Fri, 17 Jan 2020 04:20:21 AEDT
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9ts6LktzDqbr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:20:19 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-38-Ebi9GveDO2SkPFnm5FBdmw-1; Thu, 16 Jan 2020 17:20:14 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jan 2020 17:20:14 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jan 2020 17:20:14 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@c-s.fr>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: RE: z constraint in powerpc inline assembly ?
Thread-Topic: z constraint in powerpc inline assembly ?
Thread-Index: AQHVzDQOzi0mt2ZyZE2MkIeaLfMNoaftbd2ggAAZmxaAAAELIA==
Date: Thu, 16 Jan 2020 17:20:14 +0000
Message-ID: <50d031893e1b439d8b2aa5718fe68e65@AcuMS.aculab.com>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
 <e9af1690e51a4d89a8a5c0927eb8430a@AcuMS.aculab.com>
 <20200116162151.GR3191@gate.crashing.org>
 <0c217c4c-51cb-d5f3-237e-4fb4e2f6532c@c-s.fr>
In-Reply-To: <0c217c4c-51cb-d5f3-237e-4fb4e2f6532c@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: Ebi9GveDO2SkPFnm5FBdmw-1
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBZb3UgbWVhbiB0aGUgbXBjOHh4ICwgYnV0IEknbSBhbHNvIHVzaW5nIHRoZSBtcGM4MzJ4IHdo
aWNoIGhhcyBhIGUzMDBjMg0KPiBjb3JlIGFuZCBpcyBjYXBhYmxlIG9mIGV4ZWN1dGluZyAyIGlu
c25zIGluIHBhcmFsbGVsIGlmIG5vdCBpbiB0aGUgc2FtZQ0KPiBVbml0Lg0KDQpUaGF0IHNob3Vs
ZCBsZXQgeW91IGRvIGEgbWVtb3J5IHJlYWQgYW5kIGFuIGFkZC4NCihJIGNhbid0IHJlbWVtYmVy
IGlmIHRoZSBwcGMgaGFzICdhZGQgZnJvbSBtZW1vcnknIGJ1dCB0aGF0IGlzDQpsaWtlbHkgdG8g
dXNlIGJvdGggdW5pdHMgYW55d2F5LikNCkFuIGluZmluaXRlbHkgdW5yb2xsZWQgbG9vcCB3aWxs
IHRoZW4gYmUgNCBjbG9ja3MvYnl0ZSAoZm9yIDMyYml0KS4NCklmIHlvdSBnZXQgdG8gMyBmb3Ig
YSByZWFsIGxvb3AgeW91IGFyZSBkb2luZyBvay4NCg0KUmVtZW1iZXIsIHVucm9sbCB0b28gbXVj
aCBhbmQgeW91IGRpc3BsYWNlIG90aGVyIGNvZGUgZnJvbQ0KdGhlIGktY2FjaGUuIEFsc28gdGhl
IGktY2FjaGUgbG9hZHMgdGhlbXNlbHZlcyBraWxsIHlvdS4NCihBIGhvdC1jYWNoZSBiZW5jaG1h
cmsgd29uJ3Qgc2VlIHRoaXMuLi4pDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3Mg
TGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQ
VCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

