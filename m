Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3EA13DF58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 16:57:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z82m3P4mzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 02:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=146.101.78.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z80Y601MzDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 02:55:07 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-11-cDvK9bXOPkmSsHgIfMuf8w-1; Thu, 16 Jan 2020 15:54:59 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jan 2020 15:54:59 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jan 2020 15:54:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@c-s.fr>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: RE: z constraint in powerpc inline assembly ?
Thread-Topic: z constraint in powerpc inline assembly ?
Thread-Index: AQHVzDQOzi0mt2ZyZE2MkIeaLfMNoaftbd2g
Date: Thu, 16 Jan 2020 15:54:58 +0000
Message-ID: <e9af1690e51a4d89a8a5c0927eb8430a@AcuMS.aculab.com>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
In-Reply-To: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: cDvK9bXOPkmSsHgIfMuf8w-1
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

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAxNiBKYW51YXJ5IDIwMjAgMDY6MTINCj4g
DQo+IEknbSB0cnlpbmcgdG8gc2VlIGlmIHdlIGNvdWxkIGVuaGFuY2UgVENQIGNoZWNrc3VtIGNh
bGN1bGF0aW9ucyBieQ0KPiBzcGxpdHRpbmcgaW5saW5lIGFzc2VtYmx5IGJsb2NrcyB0byBnaXZl
IEdDQyB0aGUgb3Bwb3J0dW5pdHkgdG8gbWl4IGl0DQo+IHdpdGggb3RoZXIgc3R1ZmYsIGJ1dCBJ
J20gZ2V0dGluZyBkaWZmaWN1bHRpZXMgd2l0aCB0aGUgY2FycnkuDQoNCmlmIHlvdSBhcmUgdHJ5
aW5nIHRvICdsb29wIGNhcnJ5JyB0aGUgJ2NhcnJ5IGZsYWcnIHdpdGggJ2FkZCB3aXRoIGNhcnJ5
Jw0KaW5zdHJ1Y3Rpb25zIHlvdSdsbCBhbG1vc3QgY2VydGFpbmx5IG5lZWQgdG8gd3JpdGUgdGhl
IGxvb3AgaW4gYXNtLg0KU2luY2UgdGhlIGxvb3AgaXRzZWxmIGlzIHNpbXBsZSwgdGhpcyBwcm9i
YWJseSBkb2Vzbid0IG1hdHRlci4NCg0KSG93ZXZlciBhIGxvb3Agb2YgJ2FkZCB3aXRoIGNhcnJ5
JyBpbnN0cnVjdGlvbnMgbWF5IG5vdCBiZSB0aGUNCmZhc3Rlc3QgY29kZSBieSBhbnkgbWVhbnMu
DQpCZWNhdXNlIHRoZSBjYXJyeSBmbGFnIGlzIG5lZWRlZCBmb3IgZXZlcnkgJ2FkYycgeW91IGNh
bid0IGRvIG1vcmUNCnRoYXQgb25lIGFkYyBwZXIgY2xvY2suDQpUaGlzIGxpbWl0cyB5b3UgdG8g
OCBieXRlcy9jbG9jayBvbiBhIDY0Yml0IHN5c3RlbSAtIGV2ZW4gb25lDQp0aGF0IGNhbiBzY2hl
ZHVsZSBtdWx0aXBsZSBtZW1vcnkgcmVhZHMgYW5kIGxvdHMgb2YgaW5zdHJ1Y3Rpb25zDQpldmVy
eSBjbG9jay4NCg0KSSBkb24ndCBrbm93IHBwYywgYnV0IG9uIHg4NiB5b3UgZG9uJ3QgZXZlbiBn
ZXQgMSBhZGMgcGVyIGNsb2NrDQp1bnRpbCB2ZXJ5IHJlY2VudCAoSGFzd2VsbCBJIHRoaW5rKSBj
cHVzLg0KU2FuZHkvSXZ5IGJyaWRnZSB3aWxsIGRvIHNvIGlmIHlvdSBhZGQgdG8gYWx0ZXJuYXRl
IHJlZ2lzdGVycy4NCg0KRm9yIGVhcmxpZXIgY3B1IGl0IGlzIGFjdHVhbGx5IGRpZmZpY3VsdCB0
byBiZWF0IHRoZSA0IGJ5dGVzL2Nsb2NrDQp5b3UgZ2V0IGJ5IGFkZGluZyAzMmJpdCB2YWx1ZXMg
dG8gYSA2NGJpdCByZWdpc3RlciBpbiBDIGNvZGUuDQoNCk9uZSBwb3NzaWJpbGl0eSBpcyB0byBk
byBhIG5vcm1hbCBhZGQgdGhlbiBzaGlmdCB0aGUgY2FycnkNCmludG8gYSBzZXBhcmF0ZSByZWdp
c3Rlci4NCkFmdGVyIDY0IHdvcmRzIHVzZSAncG9wY250JyB0byBzdW0gdGhlIGNhcnJ5IGJpdHMu
DQpXaXRoIDIgYWNjdW11bGF0b3JzIChhbmQgY2Fycnkgc2hpZnRzKSB5b3UnZCBuZWVkIHRvDQpi
cmVhayB0aGUgbG9vcCBldmVyeSAxMDI0IGJ5dGVzLg0KVGhpcyBzaG91bGQgYmVhdCA4IGJ5dGVz
L2Nsb2NrIGlmIHlvdSBjYW4gZXhldXRlIG1vcmUgdGhhbg0KMSBtZW1vcnkgcmVhZCwgb25lIGFk
ZCBhbmQgb25lIHNoaWZ0IGVhY2ggY2xvY2suDQoNCkkndmUgbm90IHRyaWVkIHRoaXMgb24gYW4g
b2xkIHg4NiBjcHUgLSB3aGljaCB3b3VsZCBuZWVkIGEgc29mdHdhcmUNCidwb3BjbnQnLiBJdCBn
b3QgY2xvc2UgdG8gOCBieXRlcy9jbG9jayBvbiBJdnkgYnJpZGdlLg0KSXQgYWxtb3N0IGNlcnRh
aW5seSBiZWF0cyB0aGUgNCBieXRlcy9jbG9jayBvZiB0aGUgY3VycmVudCB4ODYtNjQNCmNvZGUg
b24gc3VjaCBzeXN0ZW1zLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
DQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

