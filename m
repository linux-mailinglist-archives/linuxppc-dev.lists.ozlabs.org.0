Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E802978EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 23:30:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHy7r6NZDzDqxW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 08:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHy6J6yb2zDqwm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 08:29:09 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-101-a0KTql5iP42OxX-i9IRDjQ-1; Fri, 23 Oct 2020 22:29:00 +0100
X-MC-Unique: a0KTql5iP42OxX-i9IRDjQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 23 Oct 2020 22:28:59 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 23 Oct 2020 22:28:59 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Al Viro
 <viro@zeniv.linux.org.uk>
Subject: RE: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Thread-Topic: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Thread-Index: AQHWqE5GNDfnH4y9nkGWtfqJueR1KKmjTCJQgAAN4UiAAAD2IIAASOeCgAF+12CAAGD4RoAAL/Bg
Date: Fri, 23 Oct 2020 21:28:59 +0000
Message-ID: <e9a3136ead214186877804aabde74b38@AcuMS.aculab.com>
References: <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022104805.GA1503673@kroah.com> <20201022121849.GA1664412@kroah.com>
 <98d9df88-b7ef-fdfb-7d90-2fa7a9d7bab5@redhat.com>
 <20201022125759.GA1685526@kroah.com> <20201022135036.GA1787470@kroah.com>
 <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
 <935f7168-c2f5-dd14-7124-412b284693a2@redhat.com>
 <20201023175857.GA3576660@ZenIV.linux.org.uk>
 <20201023182713.GG2672@gate.crashing.org>
In-Reply-To: <20201023182713.GG2672@gate.crashing.org>
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 David Hildenbrand <david@redhat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 'Greg KH' <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 23 October 2020 19:27
>=20
> On Fri, Oct 23, 2020 at 06:58:57PM +0100, Al Viro wrote:
> > On Fri, Oct 23, 2020 at 03:09:30PM +0200, David Hildenbrand wrote:
> >
> > > Now, I am not a compiler expert, but as I already cited, at least on
> > > x86-64 clang expects that the high bits were cleared by the caller - =
in
> > > contrast to gcc. I suspect it's the same on arm64, but again, I am no
> > > compiler expert.
> > >
> > > If what I said and cites for x86-64 is correct, if the function expec=
ts
> > > an "unsigned int", it will happily use 64bit operations without furth=
er
> > > checks where valid when assuming high bits are zero. That's why even
> > > converting everything to "unsigned int" as proposed by me won't work =
on
> > > clang - it assumes high bits are zero (as indicated by Nick).
> > >
> > > As I am neither a compiler experts (did I mention that already? ;) ) =
nor
> > > an arm64 experts, I can't tell if this is a compiler BUG or not.
> >
> > On arm64 when callee expects a 32bit argument, the caller is *not* resp=
onsible
> > for clearing the upper half of 64bit register used to pass the value - =
it only
> > needs to store the actual value into the lower half.  The callee must c=
onsider
> > the contents of the upper half of that register as undefined.  See AAPC=
S64 (e.g.
> > https://github.com/ARM-software/abi-aa/blob/master/aapcs64/aapcs64.rst#=
parameter-passing-rules
> > ); AFAICS, the relevant bit is
> > =09"Unlike in the 32-bit AAPCS, named integral values must be narrowed =
by
> > the callee rather than the caller."
>=20
> Or the formal rule:
>=20
> C.9 =09If the argument is an Integral or Pointer Type, the size of the
> =09argument is less than or equal to 8 bytes and the NGRN is less
> =09than 8, the argument is copied to the least significant bits in
> =09x[NGRN]. The NGRN is incremented by one. The argument has now
> =09been allocated.

So, in essence, if the value is in a 64bit register the calling
code is independent of the actual type of the formal parameter.
Clearly a value might need explicit widening.

I've found a copy of the 64 bit arm instruction set.
Unfortunately it is alpha sorted and repetitive so shows none
of the symmetry and makes things difficult to find.
But, contrary to what someone suggested most register writes
(eg from arithmetic) seem to zero/extend the high bits.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

