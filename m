Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C212FCD80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 10:34:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLL2p2sy0zDqvY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 20:34:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLL134Y2rzDqq8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 20:33:09 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-136-FlUOqhZwNni2kAj9MZ8Nhg-1; Wed, 20 Jan 2021 09:33:01 +0000
X-MC-Unique: FlUOqhZwNni2kAj9MZ8Nhg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 20 Jan 2021 09:33:00 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 20 Jan 2021 09:33:00 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
Subject: RE: [PATCH 2/2] powerpc/44x: Remove STDBINUTILS kconfig option
Thread-Topic: [PATCH 2/2] powerpc/44x: Remove STDBINUTILS kconfig option
Thread-Index: AQHW7wFdZXRNi2FVUEGR2+8ye/HSkqowP30w
Date: Wed, 20 Jan 2021 09:33:00 +0000
Message-ID: <e19c6d6bf92d4f7399a939c7c3c7ad0d@AcuMS.aculab.com>
References: <2fed79b1154c872194f98bac4422c23918325e61.1611128938.git.christophe.leroy@csgroup.eu>
 <f9981e819009aa121a998dc483052ec76f78f991.1611128938.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f9981e819009aa121a998dc483052ec76f78f991.1611128938.git.christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy
> Sent: 20 January 2021 07:49
>=20
> STDBINUTILS is just a toggle to allow 256k page size
> to appear in the possible page sizes list for the 44x.
>=20
> Make 256k page size appear all the time with an
> explicit warning on binutils, and remove this unneccessary
> STDBINUTILS config option.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Kconfig | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a685e42d3993..3e29995540a7 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -720,18 +720,6 @@ config ARCH_MEMORY_PROBE
>  =09def_bool y
>  =09depends on MEMORY_HOTPLUG
>=20
> -config STDBINUTILS
> -=09bool "Using standard binutils settings"
> -=09depends on 44x
> -=09default y
> -=09help
> -=09  Turning this option off allows you to select 256KB PAGE_SIZE on 44x=
.
> -=09  Note, that kernel will be able to run only those applications,
> -=09  which had been compiled using binutils later than 2.17.50.0.3 with
> -=09  '-zmax-page-size' set to 256K (the default is 64K). Or, if using
> -=09  the older binutils, you can patch them with a trivial patch, which
> -=09  changes the ELF_MAXPAGESIZE definition from 0x10000 to 0x40000.
> -
>  choice
>  =09prompt "Page size"
>  =09default PPC_4K_PAGES
> @@ -771,17 +759,16 @@ config PPC_64K_PAGES
>  =09select HAVE_ARCH_SOFT_DIRTY if PPC_BOOK3S_64
>=20
>  config PPC_256K_PAGES
> -=09bool "256k page size"
> -=09depends on 44x && !STDBINUTILS && !PPC_47x
> +=09bool "256k page size (Requires non-standard binutils settings)"
> +=09depends on 44x && !PPC_47x
>  =09help
>  =09  Make the page size 256k.
>=20
> -=09  As the ELF standard only requires alignment to support page
> -=09  sizes up to 64k, you will need to compile all of your user
> -=09  space applications with a non-standard binutils settings
> -=09  (see the STDBINUTILS description for details).
> -
> -=09  Say N unless you know what you are doing.
> +=09  That kernel will be able to run only those applications,
> +=09  which had been compiled using binutils later than 2.17.50.0.3 with
> +=09  '-zmax-page-size' set to 256K (the default is 64K). Or, if using
> +=09  the older binutils, you can patch them with a trivial patch, which
> +=09  changes the ELF_MAXPAGESIZE definition from 0x10000 to 0x40000.


The kernel will only be able to run applications that have been
compiled with '-zmax-page-size' set to 256K (the default is 64K)
using binutils later than 2.17.50.0.3, or by patching the
ELF_MAXPAGESIZE definition from 0x10000 to 0x40000 in older versions.

>=20
>  endchoice
>=20
> --
> 2.25.0

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

