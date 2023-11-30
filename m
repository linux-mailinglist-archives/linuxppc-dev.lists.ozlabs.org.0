Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43757FFE4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 23:05:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=jEncOMNK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh9HC2XcDz2ys9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 09:05:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=jEncOMNK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh9GK03sxz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 09:04:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701381880;
	bh=ZihOGHfcGL6IPblR8lpNHXKjLfhDSV+YMLeb5Lb4EXU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jEncOMNKVJSLImHusypGjPZzbfg5EmNUruYT8vz/AqndZ0vEsf+aL7RFsRQtP7kcV
	 0ulLgfKITqepuGJhI1dxVuVOfSc6lkoOErzjqdz4WGOJmaPyX2+e33uhBDsTR2y7JG
	 8/HaXZD3m4lyiYJGnTvk2pG7v+pQxIV8/OuSd7Hx23k818U/zEZ4pyZYu+YUYqpLd1
	 XPexA34WHfA2Yv6Be0BMkXiqrE2whR5nVG7yMmCcMyRhiyHd0mlW5zp0OM1T7w+deR
	 0eFdoJ1Wd7pauSqcI3vqxlcfAmjHoRqsHYibX89iX7VznsCRa86U2lI6Q6JkJX3ELj
	 hwY+ALStXeijQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sh9GH5tcSz4wx7;
	Fri,  1 Dec 2023 09:04:39 +1100 (AEDT)
Date: Fri, 1 Dec 2023 09:04:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20231201090439.7ae92c13@canb.auug.org.au>
In-Reply-To: <20231127144852.069b2e7e@canb.auug.org.au>
References: <20231127132809.45c2b398@canb.auug.org.au>
	<20231127144852.069b2e7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mftAfNUiKPZGOFgp0y=in45";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/mftAfNUiKPZGOFgp0y=in45
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 27 Nov 2023 14:48:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Just cc'ing the PowerPC guys to see if my fix is sensible.
>=20
> On Mon, 27 Nov 2023 13:28:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the mm tree, today's linux-next build (powerpc64
> > allnoconfig) failed like this:
> >=20
> > arch/powerpc/mm/book3s64/pgtable.c:557:5: error: no previous prototype =
for 'pmd_move_must_withdraw' [-Werror=3Dmissing-prototypes]
> >   557 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
> >       |     ^~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> >=20
> > Caused by commit
> >=20
> >   c6345dfa6e3e ("Makefile.extrawarn: turn on missing-prototypes globall=
y")
> >=20
> > I have added the following patch for today (which could be applied to
> > the mm or powerpc trees):
> >=20
> > From 194805b44c11b4c0aa28bdcdc0bb0d82acef394c Mon Sep 17 00:00:00 2001
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 27 Nov 2023 13:08:57 +1100
> > Subject: [PATCH] powerpc: pmd_move_must_withdraw() is only needed for
> >  CONFIG_TRANSPARENT_HUGEPAGE
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/powerpc/mm/book3s64/pgtable.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3=
s64/pgtable.c
> > index be229290a6a7..3438ab72c346 100644
> > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > @@ -542,6 +542,7 @@ void ptep_modify_prot_commit(struct vm_area_struct =
*vma, unsigned long addr,
> >  	set_pte_at(vma->vm_mm, addr, ptep, pte);
> >  }
> > =20
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  /*
> >   * For hash translation mode, we use the deposited table to store hash=
 slot
> >   * information and they are stored at PTRS_PER_PMD offset from related=
 pmd
> > @@ -563,6 +564,7 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd=
_ptl,
> > =20
> >  	return true;
> >  }
> > +#endif
> > =20
> >  /*
> >   * Does the CPU support tlbie?
> > --=20
> > 2.40.1 =20

I am still carrying this patch (it should probably go into the mm
tree).  Is someone going to pick it up (assuming it is correct)?

--=20
Cheers,
Stephen Rothwell

--Sig_/mftAfNUiKPZGOFgp0y=in45
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVpBvcACgkQAVBC80lX
0GydrAf9GN954MjHMtmQr8oDfEmXP34v1XDb6cN03i1NEMNhX1K0QIBor+LlMZKx
OZg9WsMzA5OqCViRJHFD3vi6ZTmy8Z4bQPsXuUqz5/l+v4XC9nGP7x8GcPvdhktG
j3y9FFpY5EyPTTEUYoApw9WdXjaFIMYwZGyzfYXnVS0rj3BY47YmTx757ndCXhgc
GnlOMV6eQXgV+mxwo5lg96O8GVeBYVShREmDOiVbOgOiRm1Moe8CL9JLFDn5tDW2
tfqsFl4X/S+y5iYdTdrPqjJuVkDGnLqPSRNogDHW2K6ZacV0shaFVhHd2pTfJqTN
KmZ1QNG1L7moZcoA8XIAJcIUC8TQIg==
=JUuX
-----END PGP SIGNATURE-----

--Sig_/mftAfNUiKPZGOFgp0y=in45--
