Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5139D456
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz1zv611gz3081
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:25:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=XK4QdSXh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=XK4QdSXh; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz1yw1nlsz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:24:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fz1yt10WVz9sT6; Mon,  7 Jun 2021 15:24:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623043494;
 bh=Q0ZAhkp7FWQOcYxPVObgHiqPp39qCkjQY7r+Qe59/6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XK4QdSXh+s20cVuUWTtzi8COPKgAo/qyMsQvlJ+ez0bh/V5dMND5DAp4oiQwFwR2k
 ug/yiJ30A80nCG5Q8mHWJmA590AcTbbo9vJcoNcgQ3KZDjFiBMaNCYnLeKcIRhEJUG
 qffgrXCubOapMfwgHDHVG8L3+Yf2QaFPDbHPSBL4=
Date: Mon, 7 Jun 2021 15:10:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH v2 2/3] powerpc/mm/hash: Avoid multiple HPT resize-ups on
 memory hotplug
Message-ID: <YL2qKPhC2TrsFn6e@yekko>
References: <20210430143607.135005-1-leobras.c@gmail.com>
 <20210430143607.135005-3-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+e3T6L8B4PjNfYWV"
Content-Disposition: inline
In-Reply-To: <20210430143607.135005-3-leobras.c@gmail.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+e3T6L8B4PjNfYWV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 11:36:08AM -0300, Leonardo Bras wrote:
> Every time a memory hotplug happens, and the memory limit crosses a 2^n
> value, it may be necessary to perform HPT resizing-up, which can take
> some time (over 100ms in my tests).
>=20
> It usually is not an issue, but it can take some time if a lot of memory
> is added to a guest with little starting memory:
> Adding 256G to a 2GB guest, for example will require 8 HPT resizes.
>=20
> Perform an HPT resize before memory hotplug, updating HPT to its
> final size (considering a successful hotplug), taking the number of
> HPT resizes to at most one per memory hotplug action.
>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/include/asm/book3s/64/hash.h     |  2 ++
>  arch/powerpc/mm/book3s64/hash_utils.c         | 20 +++++++++++++++++++
>  .../platforms/pseries/hotplug-memory.c        |  9 +++++++++
>  3 files changed, 31 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/inc=
lude/asm/book3s/64/hash.h
> index d959b0195ad9..fad4af8b8543 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -255,6 +255,8 @@ int hash__create_section_mapping(unsigned long start,=
 unsigned long end,
>  				 int nid, pgprot_t prot);
>  int hash__remove_section_mapping(unsigned long start, unsigned long end);
> =20
> +void hash_batch_expand_prepare(unsigned long newsize);
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_BOOK3S_64_HASH_H */
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index 608e4ed397a9..3fa395b3fe57 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -859,6 +859,26 @@ int hash__remove_section_mapping(unsigned long start=
, unsigned long end)
> =20
>  	return rc;
>  }
> +
> +void hash_batch_expand_prepare(unsigned long newsize)
> +{
> +	const u64 starting_size =3D ppc64_pft_size;
> +
> +	/*
> +	 * Resizing-up HPT should never fail, but there are some cases system s=
tarts with higher
> +	 * SHIFT than required, and we go through the funny case of resizing HP=
T down while
> +	 * adding memory
> +	 */
> +
> +	while (resize_hpt_for_hotplug(newsize, false) =3D=3D -ENOSPC) {
> +		newsize *=3D 2;
> +		pr_warn("Hash collision while resizing HPT\n");
> +
> +		/* Do not try to resize to the starting size, or bigger value */
> +		if (htab_shift_for_mem_size(newsize) >=3D starting_size)
> +			break;
> +	}
> +}
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> =20
>  static void __init hash_init_partition_table(phys_addr_t hash_table,
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index 8377f1f7c78e..48b2cfe4ce69 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -13,6 +13,7 @@
>  #include <linux/memory.h>
>  #include <linux/memory_hotplug.h>
>  #include <linux/slab.h>
> +#include <linux/pgtable.h>
> =20
>  #include <asm/firmware.h>
>  #include <asm/machdep.h>
> @@ -671,6 +672,10 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>  	if (lmbs_available < lmbs_to_add)
>  		return -EINVAL;
> =20
> +	if (!radix_enabled())
> +		hash_batch_expand_prepare(memblock_phys_mem_size() +
> +						 lmbs_to_add * drmem_lmb_size());
> +
>  	for_each_drmem_lmb(lmb) {
>  		if (lmb->flags & DRCONF_MEM_ASSIGNED)
>  			continue;
> @@ -788,6 +793,10 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u=
32 drc_index)
>  	if (lmbs_available < lmbs_to_add)
>  		return -EINVAL;
> =20
> +	if (!radix_enabled())
> +		hash_batch_expand_prepare(memblock_phys_mem_size() +
> +					  lmbs_to_add * drmem_lmb_size());
> +
>  	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>  		if (lmb->flags & DRCONF_MEM_ASSIGNED)
>  			continue;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+e3T6L8B4PjNfYWV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9qicACgkQbDjKyiDZ
s5Jdqw//RczgBrNyU1kIqVO7/FiFsNT63ohCuxllQ8p7j075vP50I4I/e3GUovQB
DRLF2Zv3OOVxqhU7AEDxGAFj7wOzMoGrvuEAn8vRoilpL9SK1XzWzl71uVi6jE3W
LfL+LVoP6rL/Aqp/LapU0E2GVDQWiBhckSFP7cEoy1eO1VlPZu/o2NbzIXo6rSf2
rLIV8lubVuJjx5EPvmwUUrZG/kfmCOeZ7Fu2ym1VzFoj54JZppHLs6BZoDE4oSUa
d15AV4LtAMyIPbYzPFEw5q3QfYbo1tLdYJ7blPkFGlYYtERtmGidtqlDIf9+yu+D
Zr04CtmgA3IB0aW8OHJkHCpgovqQ0xwvFHxnNx9Ta59J5+qgLV1wHPDM7JgrW5bW
mI0KFgE1uKcVK+T00TGNK1r8qiuwbQEWBcx0GrtoC1/wYt5f7AlNUJHhEZsUKcaN
jYUOw9roHR+m+ccnkGvLTQb/OCkshLld/xdj5NBhKyc479dFQ8w6Wonx/c01O+9S
nkunjt22DOumTWONk01cSYAzRCmdsaMOktfNITqxp8XU26DNsJdBiyOCvwZG8ieu
Gl+QFaQD4PO+AHxWCP6upQzlHedgxU9WoYyQN+VP8NX1kJVBsGfcuq9neMyqDcR+
obFfkY8ODfoFq8focOl3j9GZuA62bsCy7J5d7M/OqLkAtEX/z8s=
=OPXK
-----END PGP SIGNATURE-----

--+e3T6L8B4PjNfYWV--
