Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECABA54013E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 16:24:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHXfW5SPzz3c8k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 00:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHXf223QYz3084
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 00:23:35 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-160-GwpNDfyfMIKAFzFYkoJBmA-1; Tue, 07 Jun 2022 15:23:27 +0100
X-MC-Unique: GwpNDfyfMIKAFzFYkoJBmA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Tue, 7 Jun 2022 15:23:26 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Tue, 7 Jun 2022 15:23:25 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Michael Ellerman' <mpe@ellerman.id.au>, Bagas Sanjaya
	<bagasdotme@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: RE: outside array bounds error on ppc64_defconfig, GCC 12.1.0
Thread-Topic: outside array bounds error on ppc64_defconfig, GCC 12.1.0
Thread-Index: AQHYehMfGrZ1ohRgvU+RLIptsHpWBK1D/qnw
Date: Tue, 7 Jun 2022 14:23:25 +0000
Message-ID: <d38aeb0d6f2040369256ee640b44fafe@AcuMS.aculab.com>
References: <YpbUcPrm61RLIiZF@debian.me> <87mtepns81.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mtepns81.fsf@mpe.ellerman.id.au>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Yang Li <yang.lee@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman
> Sent: 07 June 2022 03:05
>=20
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> > Hi,
> >
> > I'm trying to verify Drop ppc_inst_as_str() patch on [1] by performing
> > ppc64_defconfig build with powerpc64-unknown-linux-gnu-gcc (GCC 12.1.0)=
.
> > The patch is applied on top of powerpc tree, next branch.
>=20
> Yeah I see it too.
>=20
> > I got outside array bounds error:
> >
> >   CC      arch/powerpc/kernel/dbell.o
> > In function 'do_byte_reverse',
> >     inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
> >     inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9=
:
> > arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outsi=
de array bounds of 'union
> <anonymous>[1]' [-Werror=3Darray-bounds]
> >   286 |                 up[0] =3D byterev_8(up[3]);
> >       |                         ^~~~~~~~~~~~~~~~
> >
> > arch/owerpc/lib/sstep.c: In function 'emulate_loadstore':
> > arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object '=
u' of size 16
> >   708 |         } u;
> >       |           ^
> > In function 'do_byte_reverse',
> >     inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
> >     inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9=
:
> > arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outsi=
de array bounds of 'union
> <anonymous>[1]' [-Werror=3Darray-bounds]
> >   287 |                 up[3] =3D tmp;
> >       |                 ~~~~~~^~~~~
>=20
> This happens because we have a generic byte reverse function
> (do_byte_reverse()), that takes a size as a parameter. So it will
> reverse 8, 16, 32 bytes etc.
>=20
> In some cases the compiler can see that we're passing a pointer to
> storage that is smaller than 32 bytes, but it isn't convinced that the
> size parameter is also smaller than 32 bytes.
>=20
> Which I think is reasonable, the code that sets the size is separate
> from this code, so the compiler can't really deduce that it's safe.
>=20
> I don't see a really simple fix. I tried clamping the size parameter to
> do_byte_reverse() with max(), but that didn't work :/

I had a quick look at the code - it is somewhat horrid!
Not really surprising the compiler is confused.
Although it shouldn't be outputting that error message
unless it is certain.

Could it be re-written to read the data into an __u128
(or whatever the compiler type is).
Optionally byteswap the entire thing (swap the words and
then byteswap each word).
The do a put_user_8/16/32/64() to write out the value.

I think that would remove all the memory accesses and make
it a lot faster as well.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

