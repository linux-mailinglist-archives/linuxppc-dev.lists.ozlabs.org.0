Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C061DDF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 13:45:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j3Xf33jszDqS8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 21:45:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45j3Vr2X6gzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 21:43:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="PNE9fPP4"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45j3Vp66yHz9sNT;
 Mon,  8 Jul 2019 21:43:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1562586211;
 bh=fVX79QzuP3XmjxHGLGEV10dVgDN3UaHzkPoTyKKYOcA=;
 h=Date:From:To:Cc:Subject:From;
 b=PNE9fPP4AtS+EAZZ57DdHy5A7YADnOLwCPwb62eA6/pj0cH30EhWbzn+VeJHpY0o0
 +OPK11rsLVRQhBc4T2CX//KkOibzFzQmJEqEdejdqKop73tMwe59NU0koXI1gfLsRO
 YtJ4svZ04DY48nIQ76DYBI3mAOj2wwvT0ZNSAU2+2U3a2OOVbvXs9aZpInxTqN2Lon
 6k5X5p7/uOaI8oxjwhhQmw6QacI81/wOsT4qxXl26NOIweqy1b/dlCm7+pRQq1maV9
 roPT8Wi9a4PbKVJyNy9MrMxHtgb9OZy0c17f3NHG7b+fp2tmW3F7ZPYMmfQJWqysqy
 htoarpWhoj7JA==
Date: Mon, 8 Jul 2019 21:43:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20190708214328.6271f3f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a7GmsKm5bIq+lDE.W6JsJ0O"; protocol="application/pgp-signature"
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
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/a7GmsKm5bIq+lDE.W6JsJ0O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/include/asm/pgtable.h

between commit:

  d6eacedd1f0e ("powerpc/book3s: Use config independent helpers for page ta=
ble walk")

from the powerpc tree and commit:

  be66a174b253 ("mm/nvdimm: add is_ioremap_addr and use that to check iorem=
ap address")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/pgtable.h
index bf7d771f342e,64145751b2fd..000000000000
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@@ -140,30 -140,20 +140,44 @@@ static inline void pte_frag_set(mm_cont
  }
  #endif
 =20
 +#ifndef pmd_is_leaf
 +#define pmd_is_leaf pmd_is_leaf
 +static inline bool pmd_is_leaf(pmd_t pmd)
 +{
 +	return false;
 +}
 +#endif
 +
 +#ifndef pud_is_leaf
 +#define pud_is_leaf pud_is_leaf
 +static inline bool pud_is_leaf(pud_t pud)
 +{
 +	return false;
 +}
 +#endif
 +
 +#ifndef pgd_is_leaf
 +#define pgd_is_leaf pgd_is_leaf
 +static inline bool pgd_is_leaf(pgd_t pgd)
 +{
 +	return false;
 +}
 +#endif
 +
+ #ifdef CONFIG_PPC64
+ #define is_ioremap_addr is_ioremap_addr
+ static inline bool is_ioremap_addr(const void *x)
+ {
+ #ifdef CONFIG_MMU
+ 	unsigned long addr =3D (unsigned long)x;
+=20
+ 	return addr >=3D IOREMAP_BASE && addr < IOREMAP_END;
+ #else
+ 	return false;
+ #endif
+ }
+ #endif /* CONFIG_PPC64 */
+=20
  #endif /* __ASSEMBLY__ */
 =20
  #endif /* _ASM_POWERPC_PGTABLE_H */

--Sig_/a7GmsKm5bIq+lDE.W6JsJ0O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0jLGAACgkQAVBC80lX
0Gw5TAf/UQ4Pcsr9wkHps9+Deq0YFrVCMpV0JfwT89naPooO9ldiZw/yjqtKFnIA
8SldhZM8UVYcm+3Yvk41kxtsQZCBv/LzkGxtSu0HtcE8gK4FrEXK6CQSaaVIgGlM
dta3LaWJJMUc+mXInQeWbsbAQQKT7m0Afmhocx6l1u1ZApLGzqCL9yHWLWaU28vv
UWDEGT+6GB+MROd7LkW+a17HCApVVvBqE39hitNBjIxWrnWqGxMwt3tvABbFYUvK
4cEs257dyqnXmdHZDw+93zYSuf4/WEquVaPnA++Yz6pKtTOVBDbGlMMBfYrk8exO
43dPlNGCror53Ym/K7Kug9vqRSo5iA==
=BNce
-----END PGP SIGNATURE-----

--Sig_/a7GmsKm5bIq+lDE.W6JsJ0O--
