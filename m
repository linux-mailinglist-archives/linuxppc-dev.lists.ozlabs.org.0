Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B675753F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 02:07:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z0bC5RwJzDq7h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 10:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z0YQ53RszDqND
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 10:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="g9H0EqGd"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Z0YP74Bsz9s3l;
 Thu, 27 Jun 2019 10:06:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1561593978;
 bh=8Hr8+8sV64MiYrtvdI2lrD9HaUyy8PmtsfdtCacMw54=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g9H0EqGdNbqlbtj25nvoH/11hrDm8DuMaOp1WI2LIIcnmMWaYtU7IDhdzf63mWfUi
 ol8nRp003otS79GiD1mz9pfHW9SYHi3ndgpmfqmIom1GKo6YfExsGeJet7CdAxlst1
 d4jYVioAs9+LNVT8/+zGe17hND8oy9RK9Dp3LI124Qgkjbj5CD+UuWerqnY5wnxZUT
 4b/BFhZvU464RccRBcYJ7lOjjTWMNoSKec3cK7S++SCAWsOq45UdHKwwRijv3mLgpA
 IqvHH2J76vNfh2Jt23VRpL/IiYb/CQBVft3fZm6oXSh4kKzbCzYiZhAkco0w2mowg9
 FMfDj5RvPZK9w==
Date: Thu, 27 Jun 2019 10:06:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] powerpc/64s/radix: Define arch_ioremap_p4d_supported()
Message-ID: <20190627100617.74c74e79@canb.auug.org.au>
In-Reply-To: <1561555260-17335-1-git-send-email-anshuman.khandual@arm.com>
References: <1561555260-17335-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n9_h8L+fKQmZXfOCydxkhZu"; protocol="application/pgp-signature"
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, linux-next@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/n9_h8L+fKQmZXfOCydxkhZu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anshuman,

On Wed, 26 Jun 2019 18:51:00 +0530 Anshuman Khandual <anshuman.khandual@arm=
.com> wrote:
>
> Recent core ioremap changes require HAVE_ARCH_HUGE_VMAP subscribing archs
> provide arch_ioremap_p4d_supported() failing which will result in a build
> failure like the following.
>=20
> ld: lib/ioremap.o: in function `.ioremap_huge_init':
> ioremap.c:(.init.text+0x3c): undefined reference to
> `.arch_ioremap_p4d_supported'
>=20
> This defines a stub implementation for arch_ioremap_p4d_supported() keepi=
ng
> it disabled for now to fix the build problem.
>=20
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-next@vger.kernel.org
>=20
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This has been just build tested and fixes the problem reported earlier.
>=20
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index 8904aa1..c81da88 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1124,6 +1124,11 @@ void radix__ptep_modify_prot_commit(struct vm_area=
_struct *vma,
>  	set_pte_at(mm, addr, ptep, pte);
>  }
> =20
> +int __init arch_ioremap_p4d_supported(void)
> +{
> +	return 0;
> +}
> +
>  int __init arch_ioremap_pud_supported(void)
>  {
>  	/* HPT does not cope with large pages in the vmalloc area */
> --=20
> 2.7.4
>=20

I will add that as a merge resolution patch for the akpm-current tree
merge today.

--=20
Cheers,
Stephen Rothwell

--Sig_/n9_h8L+fKQmZXfOCydxkhZu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0UCHkACgkQAVBC80lX
0GzSRwf7BzDnZme1lz1V4QMONN1IuVY+pZX1QXKrRyb02gfpevX+bps5fVXU900w
Ba2QoMMkdVL042M4+W390SZxydX+BTcEfgxSgEFxQNKNv+3qolu6YKdQGszWhl5y
8I6VTUln4K3U+5QrEsx2GOfr+TP1ktGlrDQRvn58tkfr0GBy8eu5VvKMM+3zyh/L
iYqND4uA2ufFY550R3KI9uCh2y7nbaOIm6GWqIiBmwEQBiRctcL1EQMuKqQii938
bFS8SbP7WHkdRGB9L6AMACbjEPGLPwWodrMd0oA1yhcfYz38wkIJPVrI1cTmltS0
jmhRFG6gblzMWAbvnlBmbS3Zrs33bg==
=UR4X
-----END PGP SIGNATURE-----

--Sig_/n9_h8L+fKQmZXfOCydxkhZu--
