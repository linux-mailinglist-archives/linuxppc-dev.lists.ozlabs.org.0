Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE0A7D7E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 10:18:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NcCg6zx5zDqsK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 18:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aculab.com
 (client-ip=146.101.78.151; helo=eu-smtp-delivery-151.mimecast.com;
 envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nc9h2VpkzDqT8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 18:16:54 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-193-nFFPn1P4Oom3Bv3qJ6LEWg-1; Wed, 04 Sep 2019 09:16:47 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 4 Sep 2019 09:16:45 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 4 Sep 2019 09:16:45 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nathan Chancellor' <natechancellor@gmail.com>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: RE: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Thread-Topic: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Thread-Index: AQHVXdDJpnOUwPzSaUeRyhz1GkEFSKcR4W8wgAjREfaAAIOqQA==
Date: Wed, 4 Sep 2019 08:16:45 +0000
Message-ID: <1bcd7086f3d24dfa82eec03980f30fbc@AcuMS.aculab.com>
References: <20190812023214.107817-1-natechancellor@gmail.com>
 <878srdv206.fsf@mpe.ellerman.id.au>
 <20190828175322.GA121833@archlinux-threadripper>
 <CAKwvOdmXbYrR6n-cxKt3XxkE4Lmj0sSoZBUtHVb0V2LTUFHmug@mail.gmail.com>
 <20190828184529.GC127646@archlinux-threadripper>
 <6801a83ed6d54d95b87a41c57ef6e6b0@AcuMS.aculab.com>
 <20190903055553.GC60296@archlinux-threadripper>
 <20190903193128.GC9749@gate.crashing.org>
 <20190904002401.GA70635@archlinux-threadripper>
In-Reply-To: <20190904002401.GA70635@archlinux-threadripper>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: nFFPn1P4Oom3Bv3qJ6LEWg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Chancellor [mailto:natechancellor@gmail.com]
> Sent: 04 September 2019 01:24
> On Tue, Sep 03, 2019 at 02:31:28PM -0500, Segher Boessenkool wrote:
> > On Mon, Sep 02, 2019 at 10:55:53PM -0700, Nathan Chancellor wrote:
> > > On Thu, Aug 29, 2019 at 09:59:48AM +0000, David Laight wrote:
> > > > From: Nathan Chancellor
> > > > > Sent: 28 August 2019 19:45
> > > > ...
> > > > > However, I think that -fno-builtin-* would be appropriate here be=
cause
> > > > > we are providing our own setjmp implementation, meaning clang sho=
uld not
> > > > > be trying to do anything with the builtin implementation like bui=
lding a
> > > > > declaration for it.
> > > >
> > > > Isn't implementing setjmp impossible unless you tell the compiler t=
hat
> > > > you function is 'setjmp-like' ?
> > >
> > > No idea, PowerPC is the only architecture that does such a thing.
> >
> > Since setjmp can return more than once, yes, exciting things can happen
> > if you do not tell the compiler about this.
> >
> >
> > Segher
> >
>=20
> Fair enough so I guess we are back to just outright disabling the
> warning.

Just disabling the warning won't stop the compiler generating code
that breaks a 'user' implementation of setjmp().

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

