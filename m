Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B06822EF1A9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jan 2021 12:53:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DC1hp3ZdZzDr24
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jan 2021 22:53:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DC1c41MC7zDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 22:49:37 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-227-JrkSGbMLN9-FUY2lxHNdvQ-1; Fri, 08 Jan 2021 11:49:28 +0000
X-MC-Unique: JrkSGbMLN9-FUY2lxHNdvQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 8 Jan 2021 11:49:27 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 8 Jan 2021 11:49:27 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: RE: [PATCH 05/11] iov_iter: merge the compat case into
 rw_copy_check_uvector
Thread-Topic: [PATCH 05/11] iov_iter: merge the compat case into
 rw_copy_check_uvector
Thread-Index: AQHWkCRUvpDO9SBAlU68E+WeFLSma6oeR04A
Date: Fri, 8 Jan 2021 11:49:27 +0000
Message-ID: <7167a94511a84f30b18733d56007a7a5@AcuMS.aculab.com>
References: <20200921143434.707844-1-hch@lst.de>
 <20200921143434.707844-6-hch@lst.de>
In-Reply-To: <20200921143434.707844-6-hch@lst.de>
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

From: Christoph Hellwig <hch@lst.de>
> Sent: 21 September 2020 15:34
>=20
> Stop duplicating the iovec verify code, and instead add add a
> __import_iovec helper that does the whole verify and import, but takes
> a bool compat to decided on the native or compat layout.  This also
> ends up massively simplifying the calling conventions.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  lib/iov_iter.c | 195 ++++++++++++++++++-------------------------------
>  1 file changed, 70 insertions(+), 125 deletions(-)
>=20
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index a64867501a7483..8bfa47b63d39aa 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -10,6 +10,7 @@
>  #include <net/checksum.h>
>  #include <linux/scatterlist.h>
>  #include <linux/instrumented.h>
> +#include <linux/compat.h>
>=20
>  #define PIPE_PARANOIA /* for now */
>=20
> @@ -1650,43 +1651,76 @@ const void *dup_iter(struct iov_iter *new, struct=
 iov_iter *old, gfp_t flags)
>  }
>  EXPORT_SYMBOL(dup_iter);
>=20
> -static ssize_t rw_copy_check_uvector(int type,
> -=09=09const struct iovec __user *uvector, unsigned long nr_segs,
> -=09=09unsigned long fast_segs, struct iovec *fast_pointer,
> -=09=09struct iovec **ret_pointer)
> +static int compat_copy_iovecs_from_user(struct iovec *iov,
> +=09=09const struct iovec __user *uvector, unsigned long nr_segs)
> +{
> +=09const struct compat_iovec __user *uiov =3D
> +=09=09(const struct compat_iovec __user *)uvector;
> +=09unsigned long i;
> +=09int ret =3D -EFAULT;
> +
> +=09if (!user_access_begin(uvector, nr_segs * sizeof(*uvector)))
> +=09=09return -EFAULT;

I little bit late, but the above isn't quite right.
It should be sizeof(*iouv) - the length is double what it should be.

Not that access_ok() can fail for compat addresses
and the extra length won't matter for architectures that
need the address/length to open an address hole into userspace.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

