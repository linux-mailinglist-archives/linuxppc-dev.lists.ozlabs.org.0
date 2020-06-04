Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC71EE301
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 13:10:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d33P4Q4KzDql8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 21:10:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d31R70qXzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 21:08:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ci3Ljv/v; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49d31R2lbyz9sSn;
 Thu,  4 Jun 2020 21:08:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591268923;
 bh=K79lzCubQbJZW5qR1JuzI86y9iQNVkA+csPsrM3RczE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ci3Ljv/vAVYlVHoTIky+EPiWBoZ/qP/g7N6KWHXOVSJJTjcC367wU1iWmHfBhSt3Y
 uSmR+cwhT60XEuJd1Oso1sSxwygbnWOHScELhmohpX34l26G6URw0az8cikf9rv/vS
 hfRmBO3M6+D5cTfGIkxcdMG3GG4u6VJ882GiNf9Q4mEOJ4KI6s1Enk2OrTzmghMxDG
 FyiROSiQRdJxJXIhccK6btWQBE1aNHSVMjVifHXDpg42+bkmr2OLu+tDpHxzhoICMz
 Q++MeLQ5hsdCHlUwNsL8eUOpPNHvp1Af26iZauzfRSHp6RqKlewl7w25DMmT1ZaCdE
 J24kqt/6xD4fg==
Date: Thu, 4 Jun 2020 21:08:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
Message-ID: <20200604210842.6e128144@canb.auug.org.au>
In-Reply-To: <20200604174925.3610fdd1@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au>
 <20200604165246.436f02ba@canb.auug.org.au>
 <20200604174925.3610fdd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dXXN7Tr4ujmem3SXFI1Rdp1";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/dXXN7Tr4ujmem3SXFI1Rdp1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Jun 2020 17:49:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> diff --cc arch/powerpc/include/asm/nohash/32/pgtable.h
> index 639f3b3713ec,eb8538c85077..1927e1b653f2
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@@ -204,13 -205,6 +205,9 @@@ static inline void pmd_clear(pmd_t *pmd
>   	*pmdp =3D __pmd(0);
>   }
>  =20
> -=20
> - /* to find an entry in a kernel page-table-directory */
> - #define pgd_offset_k(address) pgd_offset(&init_mm, address)
> -=20
>  +/* to find an entry in a page-table-directory */
>  +#define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
>  +#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
>  =20
>   /*
>    * PTE updates. This function is called whenever an existing
> @@@ -240,7 -234,7 +237,7 @@@ static inline pte_basic_t pte_update(st
>   	pte_basic_t old =3D pte_val(*p);
>   	pte_basic_t new =3D (old & ~(pte_basic_t)clr) | set;
>   	int num, i;
> --	pmd_t *pmd =3D pmd_offset(pud_offset(pgd_offset(mm, addr), addr), addr=
);
> ++	pmd_t *pmd =3D pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, addr), =
addr), addr), addr);
>  =20
>   	if (!huge)
>   		num =3D PAGE_SIZE / SZ_4K;

I have added those hunks (more or less) to linux-next for tomorrow as a
fix for mm-consolidate-pgd_index-and-pgd_offset_k-definitions.
--=20
Cheers,
Stephen Rothwell

--Sig_/dXXN7Tr4ujmem3SXFI1Rdp1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Y1joACgkQAVBC80lX
0Gx3pgf+Mn7BRXOxObGN3++NOIeZTrVUPPh44KZI+DUFc8z3Ep+BwSjtw0cwpy2A
MnGKmG8EoYj4mQQPYqb6yR9VTs0rbTc1WOcd0zWbCNx6TcSHFPuY4N9A//b6CL6o
4jR0d2u+SBLAo0CvxQXy2wzieiDxcPIk+0cLzjMpOzawQ9PIyZda7ZU8mjrprKRy
P8tpd7zVTlp0xX3lCxN48hKa7iZ+v/Y9J3ZPowM1L52qRWCWiLw1Y5E2/WuHUI8c
mBTJIlbicbjpoAX/BnUMcfe10nlFqQX40e1wLDvaM7uUyuaWFc4BmNiYHht5dEls
1JWABzQ+sOgZlogNRgLyb1yf51/vSg==
=5ege
-----END PGP SIGNATURE-----

--Sig_/dXXN7Tr4ujmem3SXFI1Rdp1--
