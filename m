Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C74871BAAD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 19:11:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499rsX1Z2WzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 03:11:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=146.101.78.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499rpw5XnBzDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 03:09:12 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-168-ve_xwjQ3OrGthkNl1IKjAA-1; Mon, 27 Apr 2020 18:07:54 +0100
X-MC-Unique: ve_xwjQ3OrGthkNl1IKjAA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 27 Apr 2020 18:07:53 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 27 Apr 2020 18:07:53 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Borislav Petkov' <bp@alien8.de>, Arvind Sankar <nivedita@alum.mit.edu>
Subject: RE: [PATCH] x86: Fix early boot crash on gcc-10, next try
Thread-Topic: [PATCH] x86: Fix early boot crash on gcc-10, next try
Thread-Index: AQHWGypePJ4OzIUqcECsVX65Qe8dmqiNNepw
Date: Mon, 27 Apr 2020 17:07:53 +0000
Message-ID: <0ce42f2537124ee3829a307eefd12db4@AcuMS.aculab.com>
References: <20200422192113.GG26846@zn.tnic>
 <CAKwvOdkbcO8RzoafON2mGiSy5P96P5+aY8GySysF2my7q+nTqw@mail.gmail.com>
 <20200422212605.GI26846@zn.tnic>
 <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic> <20200425150440.GA470719@rani.riverdale.lan>
 <20200425173140.GB24294@zn.tnic> <20200425175249.GC24294@zn.tnic>
In-Reply-To: <20200425175249.GC24294@zn.tnic>
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
Cc: Jakub Jelinek <jakub@redhat.com>, "jgross@suse.com" <jgross@suse.com>,
 "x86@kernel.org" <x86@kernel.org>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Michael Matz <matz@suse.de>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>, Andy
 Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 =?utf-8?B?RnLDqWTDqXJpYyBQaWVycmV0IChmZXBpdHJlKQ==?=
 <frederic.pierret@qubes-os.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?utf-8?B?TWFydGluIExpxaFrYQ==?= <mliska@suse.cz>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQm9yaXNsYXYgUGV0a292DQo+IFNlbnQ6IDI1IEFwcmlsIDIwMjAgMTg6NTMNCi4uLg0K
PiBJT1csIHNvbWV0aGluZyBsaWtlIHRoaXMgKG9udG9wKSB3aGljaCB0YWtlcyBjYXJlIG9mIHRo
ZSB4ZW4gY2FzZSB0b28uDQo+IElmIGl0IG5lZWRzIHRvIGJlIHVzZWQgYnkgYWxsIGFyY2hlcywg
dGhlbiBJJ2xsIHNwbGl0IHRoZSBwYXRjaDoNCi4NCj4gLQlhc20gKCIiKTsNCj4gKwlwcmV2ZW50
X3RhaWxfY2FsbF9vcHRpbWl6YXRpb24oKTsNCj4gIH0NCg0KT25lIG9idmlvdXMgaW1wbGVtZW50
YXRpb24gd291bGQgYmUgYSByZWFsIGZ1bmN0aW9uIGNhbGwuDQpXaGljaCB0aGUgY29tcGlsZXIg
d291bGQgY29udmVydCBpbnRvIGEgdGFpbCBjYWxsLg0KSnVzdCB0byBjb25mdXNlIG1hdHRlcnMg
Oi0pDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkg
Um9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlv
biBObzogMTM5NzM4NiAoV2FsZXMpDQo=

