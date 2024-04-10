Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D489E847
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 04:48:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ghhVpQV6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDnMB2svgz3vZr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 12:48:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ghhVpQV6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDnLQ58f0z30fm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 12:47:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1712717261;
	bh=mLlc3a7A+WiO812az/hZEqjgAVnAiZZT9ETARfh1iIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ghhVpQV6j6zTYnf8M+aMSVN1f9gZri4s+bEJdqtEIOLh1KPMF1KTMt6HWCbCfjoBF
	 RRB4JmWVZFQscEriXNCNxIqxCH0AOHKLcJWp+8Lkk1+58cNHC/lvyl1n4u2Ck+SlA2
	 nVJUmS4CsNykMeINn64MkPmT3HMh2ImdUllN3YfAAd/bWFq/MgoK95zTA/P7ZLQ7b8
	 gnw8X4oBPQP3+zamYColJ+YKsw+nXgSBjbNgYTxzatwkK+BJYxibdEvncrzRdLtwpO
	 cudnNUzSrZn32FePqeZ+J32kAAHSVfxO7zAxsLrTWqmcZOghS9unMhycziPKB9SLj6
	 PIjY+ICZ/rlnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VDnLL2nwhz4wcn;
	Wed, 10 Apr 2024 12:47:38 +1000 (AEST)
Date: Wed, 10 Apr 2024 12:47:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] vdso: Fix powerpc build U64_MAX undeclared error
Message-ID: <20240410124735.4c118aba@canb.auug.org.au>
In-Reply-To: <20240409062639.3393-1-adrian.hunter@intel.com>
References: <20240409062639.3393-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vOfEbzDCAvOKJVGaVwivnDx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/vOfEbzDCAvOKJVGaVwivnDx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Tue,  9 Apr 2024 09:26:39 +0300 Adrian Hunter <adrian.hunter@intel.com> =
wrote:
>
> U64_MAX is not in include/vdso/limits.h, although that isn't noticed on x=
86
> because x86 includes include/linux/limits.h indirectly. However powerpc
> is more selective, resulting in the following build error:
>=20
>   In file included from <command-line>:
>   lib/vdso/gettimeofday.c: In function 'vdso_calc_ns':
>   lib/vdso/gettimeofday.c:11:33: error: 'U64_MAX' undeclared
>      11 | # define VDSO_DELTA_MASK(vd)    U64_MAX
>         |                                 ^~~~~~~
>=20
> Use ULLONG_MAX instead which will work just as well and is in
> include/vdso/limits.h.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240409124905.6816db37@canb.auug.org=
.au/
> Fixes: c8e3a8b6f2e6 ("vdso: Consolidate vdso_calc_delta()")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  lib/vdso/gettimeofday.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index 9c3a8d2440c9..899850bd6f0b 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -8,7 +8,7 @@
>  #ifndef vdso_calc_ns
> =20
>  #ifdef VDSO_DELTA_NOMASK
> -# define VDSO_DELTA_MASK(vd)	U64_MAX
> +# define VDSO_DELTA_MASK(vd)	ULLONG_MAX
>  #else
>  # define VDSO_DELTA_MASK(vd)	(vd->mask)
>  #endif
> --=20
> 2.34.1
>=20

I have applied that to linux-next today and it builds for me.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build only

--=20
Cheers,
Stephen Rothwell

--Sig_/vOfEbzDCAvOKJVGaVwivnDx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYV/ccACgkQAVBC80lX
0GyhBgf+Jf8pX6z5I6OHsmD8CbYP6GnKCBxvh+gR4ghWc9UAElgV+QAxw5qUh13q
pwIl5H6aCeg7RoNnVXYeIXDu7lzsJCgMWXwAC9Cl5us+ob0kvhCp33VGNZAFNBRr
6I6OSBNcIOpYtvjtMGHuD59I+u6X7v6vFJvQPBh0AdTHT+RnL3FGbV6kJGcF3+fs
HYIU3+af8/QqSYJ6bYu1Mr+YuRtWlQaQf+M+tPgFumWJEqqZnPfswcEHYlEvXU0L
HZrGroFagXi+Cl5pkmHWNaJIIzJpP9w8Fsyrc1D8iutNbEVrrXsiaKx0xROEIIx1
WGN5Qw9igAxfEy8yrGK8VRo74cTy6Q==
=GLls
-----END PGP SIGNATURE-----

--Sig_/vOfEbzDCAvOKJVGaVwivnDx--
