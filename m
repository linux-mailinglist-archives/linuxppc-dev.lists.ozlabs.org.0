Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B9C272B42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 18:12:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw8br3B7KzDqpR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 02:12:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw7T50bSlzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 01:21:43 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-41-5DRnBW58M5Cy2UEM3fkX0w-1; Mon, 21 Sep 2020 16:21:36 +0100
X-MC-Unique: 5DRnBW58M5Cy2UEM3fkX0w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 21 Sep 2020 16:21:35 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 21 Sep 2020 16:21:35 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Al Viro' <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH 02/11] mm: call import_iovec() instead of
 rw_copy_check_uvector() in process_vm_rw()
Thread-Topic: [PATCH 02/11] mm: call import_iovec() instead of
 rw_copy_check_uvector() in process_vm_rw()
Thread-Index: AQHWkCg9ha58Xpw3RkmKZfc82fYDTKlzMiEw
Date: Mon, 21 Sep 2020 15:21:35 +0000
Message-ID: <ef67787edb2f48548d69caaaff6997ba@AcuMS.aculab.com>
References: <20200921143434.707844-1-hch@lst.de>
 <20200921143434.707844-3-hch@lst.de>
 <20200921150211.GS3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200921150211.GS3421308@ZenIV.linux.org.uk>
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Al Viro
> Sent: 21 September 2020 16:02
>=20
> On Mon, Sep 21, 2020 at 04:34:25PM +0200, Christoph Hellwig wrote:
> > From: David Laight <David.Laight@ACULAB.COM>
> >
> > This is the only direct call of rw_copy_check_uvector().  Removing it
> > will allow rw_copy_check_uvector() to be inlined into import_iovec(),
> > while only paying a minor price by setting up an otherwise unused
> > iov_iter in the process_vm_readv/process_vm_writev syscalls that aren't
> > in a super hot path.
>=20
> > @@ -443,7 +443,7 @@ void iov_iter_init(struct iov_iter *i, unsigned int=
 direction,
> >  =09=09=09const struct iovec *iov, unsigned long nr_segs,
> >  =09=09=09size_t count)
> >  {
> > -=09WARN_ON(direction & ~(READ | WRITE));
> > +=09WARN_ON(direction & ~(READ | WRITE | CHECK_IOVEC_ONLY));
> >  =09direction &=3D READ | WRITE;
>=20
> Ugh...
>=20
> > -=09rc =3D rw_copy_check_uvector(CHECK_IOVEC_ONLY, rvec, riovcnt, UIO_F=
ASTIOV,
> > -=09=09=09=09   iovstack_r, &iov_r);
> > +=09rc =3D import_iovec(CHECK_IOVEC_ONLY, rvec, riovcnt, UIO_FASTIOV, &=
iov_r,
> > +=09=09=09  &iter_r);
> >  =09if (rc <=3D 0)
> >  =09=09goto free_iovecs;
> >
> > -=09rc =3D process_vm_rw_core(pid, &iter, iov_r, riovcnt, flags, vm_wri=
te);
> > +=09rc =3D process_vm_rw_core(pid, &iter_l, iter_r.iov, iter_r.nr_segs,
> > +=09=09=09=09flags, vm_write);
>=20
> ... and ugh^2, since now you are not only setting a meaningless iov_iter,
> you are creating a new place that pokes directly into struct iov_iter
> guts.
>=20
> Sure, moving rw_copy_check_uvector() over to lib/iov_iter.c makes sense.
> But I would rather split the access_ok()-related checks out of that thing
> and bury CHECK_IOVEC_ONLY.
>=20
> Step 1: move the damn thing to lib/iov_iter.c (same as you do, but withou=
t
> making it static)
>=20
> Step 2: split it in two:
>=20
> ssize_t rw_copy_check_uvector(const struct iovec __user * uvector,
>                               unsigned long nr_segs, unsigned long fast_s=
egs,
>                               struct iovec *fast_pointer,
>                               struct iovec **ret_pointer)
> {
> =09unsigned long seg;
...
> =09ret =3D 0;
> =09for (seg =3D 0; seg < nr_segs; seg++) {
> =09=09void __user *buf =3D iov[seg].iov_base;
> =09=09ssize_t len =3D (ssize_t)iov[seg].iov_len;
>=20
> =09=09/* see if we we're about to use an invalid len or if
> =09=09 * it's about to overflow ssize_t */
> =09=09if (len < 0)
> =09=09=09return -EINVAL;
> =09=09if (len > MAX_RW_COUNT - ret) {
> =09=09=09len =3D MAX_RW_COUNT - ret;
> =09=09=09iov[seg].iov_len =3D len;
> =09=09}
> =09=09ret +=3D len;
> =09}
> =09return ret;
> }
>=20
> /*
>  *  This is merely an early sanity check; we do _not_ rely upon
>  *  it when we get to the actual memory accesses.
>  */
> static bool check_iovecs(const struct iovec *iov, int nr_segs)
> {
>         for (seg =3D 0; seg < nr_segs; seg++) {
>                 void __user *buf =3D iov[seg].iov_base;
>                 ssize_t len =3D (ssize_t)iov[seg].iov_len;
>=20
>                 if (unlikely(!access_ok(buf, len)))
>                         return false;
>         }
> =09return true;
> }

You really don't want to be looping through the array twice.
In fact you don't really want to be doing all those tests at all.
This code makes a significant fraction of the not-insignificant
difference between the 'costs' of send() and sendmsg().

I think the 'length' check can be optimised to do something like:
=09for (...) {
=09=09ssize_t len =3D (ssize_t)iov[seg].iov_len;
=09=09ret +=3D len;
=09=09len_hi +=3D (unsigned long)len >> 20;
=09}
=09if (len_hi) {
=09=09/* Something potentially odd in the lengths.
=09=09 * Might just be a very long fragment.
=09=09 * Check the individial values. */
=09=09Add the exiting loop here.
=09}

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

