Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E622E8548
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jan 2021 19:35:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6txK5SX1zDqN5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 05:35:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6tvR6Dm7zDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 05:33:37 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-122-YkMGaifVNxGZznooJROwZw-1; Fri, 01 Jan 2021 18:33:29 +0000
X-MC-Unique: YkMGaifVNxGZznooJROwZw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 1 Jan 2021 18:33:28 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 1 Jan 2021 18:33:28 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andy Lutomirski' <luto@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: RE: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Thread-Topic: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Thread-Index: AQHW3XrLzyrfomRRwUafqZ2cHH9jwqoTGagQ
Date: Fri, 1 Jan 2021 18:33:28 +0000
Message-ID: <30c0fd4917264e75a911527715f5aed3@AcuMS.aculab.com>
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1609199804.yrsu9vagzk.astroid@bobo.none>
 <CALCETrX4v1KEf6ikVtFg6juh3Z_esJ-+6PLT1A21JJeTVh2k8g@mail.gmail.com>
In-Reply-To: <CALCETrX4v1KEf6ikVtFg6juh3Z_esJ-+6PLT1A21JJeTVh2k8g@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQW5keSBMdXRvbWlyc2tpDQo+IFNlbnQ6IDI5IERlY2VtYmVyIDIwMjAgMDA6MzYNCi4u
Lg0KPiBJIG1lYW4gdGhhdCB0aGUgbWFwcGluZyBmcm9tIHRoZSBuYW1lICJzeW5jX2NvcmUiIHRv
IGl0cyBzZW1hbnRpY3MgaXMNCj4geDg2IG9ubHkuICBUaGUgc3RyaW5nICJzeW5jX2NvcmUiIGFw
cGVhcnMgaW4gdGhlIGtlcm5lbCBvbmx5IGluDQo+IGFyY2gveDg2LCBtZW1iYXJyaWVyIGNvZGUs
IG1lbWJhcnJpZXIgZG9jcywgYW5kIGEgc2luZ2xlIFNHSSBkcml2ZXINCj4gdGhhdCBpcyB4ODYt
b25seS4gIFN1cmUsIHRoZSBpZGVhIG9mIHNlcmlhbGl6aW5nIHRoaW5ncyBpcyBmYWlybHkNCj4g
Z2VuZXJpYywgYnV0IGV4YWN0bHkgd2hhdCBvcGVyYXRpb25zIHNlcmlhbGl6ZSB3aGF0LCB3aGVu
IHRoaW5ncyBuZWVkDQo+IHNlcmlhbGl6YXRpb24sIGV0YyBpcyBxdWl0ZSBhcmNoaXRlY3R1cmUg
c3BlY2lmaWMuDQo+IA0KPiBIZWNrLCBvbiA0ODYgeW91IHNlcmlhbGl6ZSB0aGUgaW5zdHJ1Y3Rp
b24gc3RyZWFtIHdpdGggSk1QLg0KDQpEaWQgdGhlIDQ4NiBldmVuIGhhdmUgYSBtZW1vcnkgY2Fj
aGU/DQpOZXZlciBtaW5kIHNlcGFyYXRlIEkmRCBjYWNoZXMuDQpXaXRob3V0IGJyYW5jaCBwcmVk
aWN0aW9uIG9yIGFuIEkkIGEgam1wIGlzIGVub3VnaC4NCk5vIGlkZWEgaG93IHRoZSBkdWFsIDQ4
NiBib3ggd2UgaGFkIGFjdHVhbGx5IGJlaGF2ZWQuDQoNCkZvciBub24tU01QIHRoZSB4ODYgY3B1
cyB0ZW5kIHRvIHN0aWxsIGJlIGNvbXBhdGlibGUgd2l0aA0KdGhlIG9yaWdpbmFsIDgwODYgLSBz
byBhcmUgcHJldHR5IG11Y2ggZnVsbHkgY29oZXJlbnQuDQpJU1RSIHRoZSBtZW1vcnkgd3JpdGVz
IHdpbGwgaW52YWxpZGF0ZSBJJCBsaW5lcy4NCg0KQnV0IHRoZXJlIHdhcyBzb21lIGhhcmR3YXJl
IGNvbXBhdGliaWxpdHkgdGhhdCBtZWFudCBhIGxvYWQNCm9mIFBlbnRpdW0tNzUgc3lzdGVtcyB3
ZXJlICdzY2F2ZW5nZWQnIGZyb20gZGV2ZWxvcG1lbnQgZm9yDQphIGN1c3RvbWVyIC0gd2UgZ290
IGZhc3RlciBQLTI2NiBib3hlcyBhcyByZXBsYWNlbWVudHMuDQoNCk9UT0ggd2UgbmV2ZXIgZGlk
IHdvcmsgb3V0IGhvdyB0byBkbyB0aGUgcmVxdWlyZWQgJ2JhcnJpZXInDQp3aGVuIHN3aXRjaGlu
ZyBhIFZpYSBDMyB0byBhbmQgZnJvbSAxNi1iaXQgbW9kZS4NClNvbWV0aW1lcyBpdCB3b3JrZWQs
IG90aGVyIHRpbWVzIHRoZSBjcHUgd2VudCBBV09MLg0KQmVzdCBndWVzcyB3YXMgdGhhdCBpdCBz
b21ldGltZXMgZXhlY3V0ZWQgcHJlLWRlY29kZWQNCmluc3RydWN0aW9ucyBmb3IgdGhlIHdyb25n
IG1vZGUgd2hlbiByZXR1cm5pbmcgZnJvbSB0aGUNCmZ1bmN0aW9uIGNhbGwgdGhhdCBmbGlwcGVk
IG1vZGVzLg0KDQpUaGVuIHRoZXJlIGlzIHRoZSBQLVBybyBlcmEgSW50ZWwgZG9jIHRoYXQgc2F5
cyB0aGF0IElPUi9JT1cNCmFyZW4ndCBzZXF1ZW5jZWQgd3J0IG1lbW9yeSBhY2Nlc3Nlcy4NCkZv
cnR1bmF0ZWx5IGFsbCB4ODYgcHJvY2Vzc29ycyBoYXZlIHNlcXVlbmNlZCB0aGVtLg0KV2hpY2gg
aXMgd2hhdCB0aGUgY3VycmVudCBkb2NzIHNheS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQg
QWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVz
LCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

