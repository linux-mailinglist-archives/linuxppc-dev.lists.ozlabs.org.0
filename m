Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2901EE35B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 13:24:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d3M56H1FzDqWZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 21:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d3K34QK5zDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 21:22:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=AGX2JM1z; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49d3K31hYNz9sSc;
 Thu,  4 Jun 2020 21:22:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591269735;
 bh=+pASmEeVNDr1NSOgiu0O7kLS0WjldedJkdE2mr3Rdf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AGX2JM1zVMQdKUwFBrJF9JKiCiZzau5WdqjvsHfbbEzVFojVh1q3CzthduKL1CUB+
 LI/xh2fiQ6UZSj716Sa2+mSb3GVAsScTNKOtj7JlqJiqlHbg9QHv9LZrRBKWUjD7N4
 qFZ2zNWLBJZCb6Ml3+3iMqYR6NHP3LZ9WDflfmRf50JYaTCGqpbSJAKcMlY2JzqsZk
 8cudxGP7leeP28ZsrhRGv1UE0XFIvS11SKqa1iUutK90ZYkXolYCBzvo7hzkhqCq+a
 Ks1EtycOMm4RetTAleCUF5khsU6N9vcrbQwPLBAVUZ2JHr0hu7fcvInjDXw+xIBRha
 F35iL2ivafgfQ==
Date: Thu, 4 Jun 2020 21:22:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
Message-ID: <20200604212214.636fb3b3@canb.auug.org.au>
In-Reply-To: <20200604174925.3610fdd1@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au>
 <20200604165246.436f02ba@canb.auug.org.au>
 <20200604174925.3610fdd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nPbcj_1v_8JcRgPlYkGeC.W";
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

--Sig_/nPbcj_1v_8JcRgPlYkGeC.W
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
> @@@ -342,15 -334,6 +337,10 @@@ static inline int pte_young(pte_t pte
>   	pfn_to_page((__pa(pmd_val(pmd)) >> PAGE_SHIFT))
>   #endif
>  =20
> - /* Find an entry in the third-level page table.. */
> - #define pte_index(address)		\
> - 	(((address) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
>  +#define pte_offset_kernel(dir, addr)	\
>  +	(pmd_bad(*(dir)) ? NULL : (pte_t *)pmd_page_vaddr(*(dir)) + \
>  +				  pte_index(addr))
> - #define pte_offset_map(dir, addr)	pte_offset_kernel((dir), (addr))
> - static inline void pte_unmap(pte_t *pte) { }
>  +
>   /*
>    * Encode and decode a swap entry.
>    * Note that the bits we use in a PTE for representing a swap entry

I have added this hunk (sort of - see below) to linux-next for tomorrow
as a fix for mm-consolidate-pte_index-and-pte_offset_-definitions.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Jun 2020 21:16:19 +1000
Subject: [PATCH] mm-consolidate-pte_index-and-pte_offset_-definitions-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/32/pgtable.h
index c188a6f64bcd..d94bcd117c5b 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -341,6 +341,10 @@ static inline int pte_young(pte_t pte)
 	pfn_to_page((__pa(pmd_val(pmd)) >> PAGE_SHIFT))
 #endif
=20
+#define pte_offset_kernel(dir, addr)	\
+	(pmd_bad(*(dir)) ? NULL : (pte_t *)pmd_page_vaddr(*(dir)) + \
+				  pte_index(addr))
+
 /*
  * Encode and decode a swap entry.
  * Note that the bits we use in a PTE for representing a swap entry
--=20
2.27.0.rc2

--=20
Cheers,
Stephen Rothwell

--Sig_/nPbcj_1v_8JcRgPlYkGeC.W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Y2WYACgkQAVBC80lX
0GyXZQf/eNdHFYlKfa+3iDMos8hf6GGuCaB7e2Oe8JwIsG9r8qFIQlrSexdp8ZzM
X+iq7IGQ4vXiEixuGLtKQCud/HMTLFurB/ts0ft4u22GGVfKpJWIF4RSnsechPpS
R+BRmanSOQ74zPbnPk4WtE+iSJCk5zyFji4jAAE/jxlEL0pZbStKV1uZf0FX4rfE
b42J8uczlq/ApG83J4vnb2q/EenVIwuTuNr9gn9MTDsxu295i9VP8hhnqLIkkiXq
d+ynjmPkh18GyA1hcD2wmefY/6yz2XwrkO1tWiVjVUqAXo/ShOPSoFPeALCmABU8
4mJAEjZtH09YZ2U3/4x5OEj9eiWKzw==
=KOF1
-----END PGP SIGNATURE-----

--Sig_/nPbcj_1v_8JcRgPlYkGeC.W--
