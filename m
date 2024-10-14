Return-Path: <linuxppc-dev+bounces-2200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE3699C69B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRt6C1Zzkz304C;
	Mon, 14 Oct 2024 21:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.58.86.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728900067;
	cv=none; b=hvKWiAVVNJdNY5mZDyE/hFtqPHCOH3KrZoq/eIwycSYizL2PhfLtKhOj6LAdFYmiinrrY0/xqPnZox6XoezaCS/XPEQ1Nc/jdvK5IsSojgKSgCyYpeqmGNrnI8vuX2cE5jAUrxgkyxNz8TRrJcsZ1HvFd7jJktYLMpJlnMDIJ4LjKPpsyrJe+uewT6VGihBV1ptfoGlRqRoH5UoFZYm5wxCimy7fz+Tpk8eSfSyahu4cH/5qlaKSOYSnPyuV3fzuq5McC4CQWpKFHS6gTexBf34ec5TXQA8u1f53rCWl+3JZAZkqvLNTf7MERQbgG1VPUXFG3aTW74gtdneIbFwUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728900067; c=relaxed/relaxed;
	bh=4y3Ua54fvcfgsXrAsTZFX+preiXQI25at4q8VKJ3V1k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=HZzwBHDey7sQ/cNu4Q2PWmfDTjrzi1lYWBvBlgNJ1nbdt8w1/bHsHJA6BA7+w8dXHbOhK/EtRuAaoZxX79fr2+AFHRLZzB8t87sSAqSD8expB+nMstSjS+IadYltp8aQ1iPwbKQgwPKuC/AlA4lSioky6wWr/8P1CSYftqZvKTcCqwaN7kYQ2QgKbUlTUkHUsA6wIAOZLsz8v0x6XrN9nPsZA18Jc5UMddL1wfap26rhhTwABFYC8wxAmBIdyps0rnUIamZNFYUEo5B4xvNlmDemRlX734FRnSjMgT5JcMEsz+ht5D+I3weOhbgXI2+22G0QiFnu+I08ridAvHt8FQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org) smtp.mailfrom=aculab.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 105 seconds by postgrey-1.37 at boromir; Mon, 14 Oct 2024 21:01:05 AEDT
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRt693VW4z2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:01:04 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-169-FF6W7OKZPeuyWIUMa7OAtw-1; Mon, 14 Oct 2024 10:59:10 +0100
X-MC-Unique: FF6W7OKZPeuyWIUMa7OAtw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 14 Oct
 2024 10:59:09 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 14 Oct 2024 10:59:09 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Josh Poimboeuf
	<jpoimboe@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, "x86@kernel.org"
	<x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov
	<bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
	"Michael Ellerman" <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Topic: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Index: AQHbHgaP91ePeQzD7kuMOmNvhY/yFbKGAECQ
Date: Mon, 14 Oct 2024 09:59:09 +0000
Message-ID: <5eef501ab10649c7823e34354dda401b@AcuMS.aculab.com>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
In-Reply-To: <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Li4uDQo+ID4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgTEFNIGJpdHMgYXJlIGZvciB0aGUg
YmVuZWZpdCBvZiBTVyBhbmQgYXJlDQo+ID4gaWdub3JlZCBieSBIVz8gIENhbiB3ZSBqdXN0IG1h
c2sgdGhvc2UgYml0cyBvZmY/DQo+IA0KPiBZZXMuIEJ1dCB0aGVuIHlvdSB3YXN0ZSB0aW1lIG9u
IHRoZSBtYXNraW5nLCBidXQgcGFydGljdWxhcmx5IGlmIGl0DQo+IHRoZW4gY2F1c2VzIHNpbGx5
IGV4dHJhIG92ZXJoZWFkIGp1c3QgdG8gZ2V0IHRoZSBtYXNrLg0KDQpJc24ndCBMQU0ganVzdCBw
bGFpbiBzdHVwaWQgdW5sZXNzIHRoZSBoYXJkd2FyZSB2YWxpZGF0ZXMgdGhlIGJpdHMNCmFnYWlu
c3QgdGhlIFRMQj8NCllvdSBzdGFydCB3aXRoIGEgbmljZSBiaWcgc3BhcnNlIGFkZHJlc3Mgc3Bh
Y2UgKHBvdGVudGlhbGx5IDYzIGJpdHMgb2YgaXQpDQp3aGVyZSB0aGluZ3MgY2FuIGJlIHNwcmVh
ZCBvdXQgdG8gbWFrZSAncmFuZG9tJyBhZGRyZXNzZXMgbGlrZWx5IHRvDQpmYXVsdCBhbmQgdGhl
biBhbGlhcyAzMmsgYWRkcmVzc2VzIG9udG8gZWFjaCBtZW1vcnkgbG9jYXRpb24uDQpTb3VuZHMg
YnJhaW4tZGVhZCB0byBtZS4NCklmIHlvdSBjb3VsZCBzZXQgdGhlIHN0YWNrIHBvaW50ZXIgdG8g
YSAnaGlnaCcgYWRkcmVzcyBhbmQgaGF2ZSB0aGUNCmhhcmR3YXJlIGNoZWNrIHRoYXQgdGhlIFRM
QiB3YXMgZm9yIHRoYXQgYWxpYXMgdGhlbiB5b3UnZCBnZXQNCnJlYXNvbmFibGUgc3RhY2sgb3Zl
cmZsb3cgY2hlY2tpbmcuDQoNCi4uLg0KPiBuYW1lbHkgYml0ICM2Mywgbm90IHNvbWUgcmFuZG9t
IG1lYW5pbmdsZXNzIGJpdCB0aGF0IGp1c3QgaGFwcGVucyB0bw0KPiBiZSBvbmUgb2YgdGhlIGJp
dHMgdGhhdCBpcyB0aGVuIGNoZWNrZWQgZm9yIGNhbm9uaWNhbGl0eS4NCj4gDQo+IEFuZCBpdCdz
IHNvIGFubm95aW5nLCBiZWNhdXNlIGZyb20gYSAqaGFyZHdhcmUqIHBlcnNwZWN0aXZlLCBiaXQg
IzYzDQo+IHZzIGJpdCAjNDggaXMgY29tcGxldGVseSBpcnJlbGV2YW50LiBJdCdzIGxpdGVyYWxs
eSBqdXN0IGEgd2lyZSBjaG9pY2UNCj4gDQo+IEJ1dCBmcm9tIGFuIGFyY2hpdGVjdHVyYWwgcGVy
c3BlY3RpdmUsIGJpdCAjNjMgaXMgbm90IG9ubHkgdGhlDQo+ICphY3R1YWwqIGJpdCB0aGF0IGlz
IHRoZSByZWFsIGRpZmZlcmVuY2UgICgia2VybmVsIGlzIGF0IHRoZSB0b3Agb2YNCj4gdGhlIGFk
ZHJlc3Mgc3BhY2UiKSBidXQgZm9yIHNvZnR3YXJlLCBiaXQgIzQ4IGlzIGZ1bmRhbWVudGFsbHkg
aGFyZGVyDQo+IHRvIHRlc3QuDQoNCkRvZXNuJ3QgQVJNNjQgaGF2ZSB0aGUgc2FtZSBpc3N1ZT8N
Cg0KSSdtIHN1cmUgSSBhbHNvIHJlbWVtYmVyIHNvbWUgb3RoZXIgYXJjaGl0ZWN0dXJhbCBmZWF0
dXJlIHRoYXQNCmV4dGVuZHMgdGhlIHZhbGlkIHZpcnR1YWwgYWRkcmVzc2VzIGJleW9uZCA0OCBi
aXRzPw0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K


