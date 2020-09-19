Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAA5270EB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 16:55:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BttzJ1NDWzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 00:55:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bttx954xqzDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 00:53:15 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-123-Q8cAoOVtN9-3ia4vwC15wg-1; Sat, 19 Sep 2020 15:53:09 +0100
X-MC-Unique: Q8cAoOVtN9-3ia4vwC15wg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sat, 19 Sep 2020 15:53:08 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Sat, 19 Sep 2020 15:53:08 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Al Viro' <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Thread-Topic: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Thread-Index: AQHWjcPPLxbJUITJXkeWJwtHmAdwxKlwCErw
Date: Sat, 19 Sep 2020 14:53:08 +0000
Message-ID: <6d064d8688324279af89152a8da22d69@AcuMS.aculab.com>
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200918134012.GY3421308@ZenIV.linux.org.uk> <20200918134406.GA17064@lst.de>
 <20200918135822.GZ3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200918135822.GZ3421308@ZenIV.linux.org.uk>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Al Viro
> Sent: 18 September 2020 14:58
>=20
> On Fri, Sep 18, 2020 at 03:44:06PM +0200, Christoph Hellwig wrote:
> > On Fri, Sep 18, 2020 at 02:40:12PM +0100, Al Viro wrote:
> > > >  =09/* Vector 0x110 is LINUX_32BIT_SYSCALL_TRAP */
> > > > -=09return pt_regs_trap_type(current_pt_regs()) =3D=3D 0x110;
> > > > +=09return pt_regs_trap_type(current_pt_regs()) =3D=3D 0x110 ||
> > > > +=09=09(current->flags & PF_FORCE_COMPAT);
> > >
> > > Can't say I like that approach ;-/  Reasoning about the behaviour is =
much
> > > harder when it's controlled like that - witness set_fs() shite...
> >
> > I don't particularly like it either.  But do you have a better idea
> > how to deal with io_uring vs compat tasks?
>=20
> <wry> git rm fs/io_uring.c would make a good starting point </wry>
> Yes, I know it's not going to happen, but one can dream...

Maybe the io_uring code needs some changes to make it vaguely safe.
- No support for 32-bit compat mixed working (or at all?).
  Plausibly a special worker could do 32bit work.
- ring structure (I'm assuming mapped by mmap()) never mapped
  in more than one process (not cloned by fork()).
- No implicit handover of files to another process.
  Would need an munmap, handover, mmap sequence.

In any case the io_ring rather abuses the import_iovec() interface.

The canonical sequence is (types from memory):
=09struct iovec cache[8], *iov =3D cache;
=09struct iter iter;
=09...
=09rval =3D import_iovec(..., &iov, 8, &iter);
=09// Do read/write user using 'iter'
=09free(iov);

I don't think there is any strict requirement that iter.iov
is set to either 'cache' or 'iov' (it probably must point
into one of them.)
But the io_uring code will make that assumption because the
actual copies can be done much later and it doesn't save 'iter'.
It gets itself in a right mess because it doesn't separate
the 'address I need to free' from 'the iov[] for any transfers'.

io_uring is also the only code that relies on import_iovec()
returning the iter.count on success.
It would be much better to have:
=09iov =3D import_iovec(..., &cache, ...);
=09free(iov);
and use ERR_PTR() et al for error detectoion.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

