Return-Path: <linuxppc-dev+bounces-2225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2699CE35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 16:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS0Kq1ddzz2xy0;
	Tue, 15 Oct 2024 01:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.58.85.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728916895;
	cv=none; b=ILJWziDJIwr7RPvVG4IcTjH/eRQPTyusNdL04sGcO9o6UzJVByE2h0PEqjsO4OPgx64WQY8e7UkHSwUxgs5rsfDu/LnJ0zwzap9wpuK5so62Ls9VubClJh1FcEK6O4TpCjMRY9hhPa3Hhw+WWv23EE1K5aTQi3Lc0/kIm6ptojycC5nvdDO85xHPZnsnvtirFkJA0C8f7Yo6F+Kd/Bn5AfCpGB0cD1sofrOwojXZUtTUsiGSSvtGG2yo/TQdhQJnua3i6xs5SkRMjn47OLEr8vwki2qMmK6FRXVyUkaCPk23SE9LZPcCrEmbcMDsntV9fzPOvn0RhcSuyidJOftMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728916895; c=relaxed/relaxed;
	bh=JWXi6joH4S1jh4BdszOjLTH2UgTWsHuw5cNjxW5zvOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=ELKiUwA6AyNd9R8SNkwYvC2mHc5l9IapuUVHslP/ExAMjxw5d21RG06V3gS6VUOEEU2DDCCc7g5fZ6Xa654nrnMHb00PkworS+adfsXQBU6v2Q0y4VHPpabdDTnm5mqgUxK4sPImQSEIvYRz9Cw5Ka0ECP2w3uVHX2CckcP33Lvv13BLSFYAReMZgxzVeCK0XX48bhcj1ttUMI8MfFfRfjihATVex9XbFLBxifrjy+rbkQ11/AdqKromuK/RI4Z3qdDcDncha+dNHJaXaRjYdpux/Oyw2Prl+GSIdWwqT+zWexCdN8L3wt+Smtpg6+0kNB8+kgu163Brm9D8xn1WXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org) smtp.mailfrom=aculab.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 15 Oct 2024 01:41:33 AEDT
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS0Kn3KQ8z2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 01:41:33 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-2-uKUfMmd2PfGJmfOMTTqC3w-1; Mon, 14 Oct 2024 15:40:21 +0100
X-MC-Unique: uKUfMmd2PfGJmfOMTTqC3w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 14 Oct
 2024 15:40:20 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 14 Oct 2024 15:40:20 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
CC: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "x86@kernel.org" <x86@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter
 Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Michael
 Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Topic: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Index: AQHbHgaP91ePeQzD7kuMOmNvhY/yFbKGAECQgAAJJwCAAEY/4A==
Date: Mon, 14 Oct 2024 14:40:20 +0000
Message-ID: <83284833db3248deaf07b606457e3e8f@AcuMS.aculab.com>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <5eef501ab10649c7823e34354dda401b@AcuMS.aculab.com>
 <CAHk-=wgtwBkgKbvshy4AnW+2+5OYHCOuTDdtZBWwE42qfu79Uw@mail.gmail.com>
In-Reply-To: <CAHk-=wgtwBkgKbvshy4AnW+2+5OYHCOuTDdtZBWwE42qfu79Uw@mail.gmail.com>
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

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMTQgT2N0b2JlciAyMDI0IDEyOjIxDQo+IA0K
PiBPbiBNb24sIDE0IE9jdCAyMDI0IGF0IDAyOjU5LCBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdo
dEBhY3VsYWIuY29tPiB3cm90ZToNCj4gPg0KPiA+IElzbid0IExBTSBqdXN0IHBsYWluIHN0dXBp
ZCB1bmxlc3MgdGhlIGhhcmR3YXJlIHZhbGlkYXRlcyB0aGUgYml0cw0KPiA+IGFnYWluc3QgdGhl
IFRMQj8NCj4gDQo+IFdoYXQ/IE5vLiBZb3UgY2FuJ3QgZG8gdGhhdC4gQXQgc29tZSBwb2ludCwg
dGhlIFRMQiBpc24ndCBmaWxsZWQsIGFuZA0KPiB0aGVuIHlvdSBoYXZlIHRvIGRvIHRoZSBhY2Nl
c3Mgd2l0aCBsb3RzIG9mIGxpbmVhciBhZGRyZXNzIGJpdHMNCj4gbWFza2VkLg0KDQpBbmQgdGhl
ICdoaWdoJyBiaXRzIGdldCByZWxvYWRlZCBmcm9tIHRoZSBQVEUuDQooQWx0aG91Z2ggSSBzdXNw
ZWN0IHRoZXJlIGlzbid0IHNwYWNlIGZvciB0aGVtLikNCg0KUmVsb2FkaW5nIHRoZSBoaWdoIGJp
dHMgZnJvbSB0aGUgVkEgdGhhdCBjYXVzZWQgdGhlIGZhdWx0IHdvdWxkDQpiZSAnaW50ZXJlc3Rp
bmcnIC0gY2VydGFpbmx5IGJldHRlciB0aGFuIGp1c3QgaWdub3JpbmcgdGhlbS4NCg0KCURhdmlk
DQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBG
YXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykNCg==


