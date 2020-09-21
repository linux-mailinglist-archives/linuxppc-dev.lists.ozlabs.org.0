Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47708272AD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 17:57:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw8GQ5MKVzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 01:57:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw76b25lBzDqWM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 01:05:40 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-267-pfN4bYDxOjGQU1qcEZSq4g-1; Mon, 21 Sep 2020 16:05:33 +0100
X-MC-Unique: pfN4bYDxOjGQU1qcEZSq4g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 21 Sep 2020 16:05:32 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 21 Sep 2020 16:05:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: RE: [PATCH 04/11] iov_iter: explicitly check for CHECK_IOVEC_ONLY in
 rw_copy_check_uvector
Thread-Topic: [PATCH 04/11] iov_iter: explicitly check for CHECK_IOVEC_ONLY in
 rw_copy_check_uvector
Thread-Index: AQHWkCRT6PkpgoAV6EexsDeYdekosqlzL1uQ
Date: Mon, 21 Sep 2020 15:05:32 +0000
Message-ID: <7336624280b8444fb4cb00407317741b@AcuMS.aculab.com>
References: <20200921143434.707844-1-hch@lst.de>
 <20200921143434.707844-5-hch@lst.de>
In-Reply-To: <20200921143434.707844-5-hch@lst.de>
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

From: Christoph Hellwig
> Sent: 21 September 2020 15:34
>=20
> Explicitly check for the magic value insted of implicitly relying on
> its numeric representation.   Also drop the rather pointless unlikely
> annotation.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  lib/iov_iter.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index d7e72343c360eb..a64867501a7483 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -1709,8 +1709,7 @@ static ssize_t rw_copy_check_uvector(int type,
>  =09=09=09ret =3D -EINVAL;
>  =09=09=09goto out;
>  =09=09}
> -=09=09if (type >=3D 0
> -=09=09    && unlikely(!access_ok(buf, len))) {
> +=09=09if (type !=3D CHECK_IOVEC_ONLY && !access_ok(buf, len)) {
>  =09=09=09ret =3D -EFAULT;
>  =09=09=09goto out;
>  =09=09}
> @@ -1824,7 +1823,7 @@ static ssize_t compat_rw_copy_check_uvector(int typ=
e,
>  =09=09}
>  =09=09if (len < 0)=09/* size_t not fitting in compat_ssize_t .. */
>  =09=09=09goto out;
> -=09=09if (type >=3D 0 &&
> +=09=09if (type !=3D CHECK_IOVEC_ONLY &&
>  =09=09    !access_ok(compat_ptr(buf), len)) {
>  =09=09=09ret =3D -EFAULT;
>  =09=09=09goto out;
> --
> 2.28.0

I've actually no idea:
1) Why there is an access_ok() check here.
   It will be repeated by the user copy functions.
2) Why it isn't done when called from mm/process_vm_access.c.
   Ok, the addresses refer to a different process, but they
   must still be valid user addresses.

Is 2 a legacy from when access_ok() actually checked that the
addresses were mapped into the process's address space?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

