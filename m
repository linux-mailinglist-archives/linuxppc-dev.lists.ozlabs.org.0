Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FD343B06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 08:56:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3myw2cKxz2yx9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 18:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=IfpeiKUv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=IfpeiKUv; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3myS5WPrz2yhm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:55:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3myR5qD3z9sWC; Mon, 22 Mar 2021 18:55:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616399743;
 bh=B3326MCJKn7HGhQ1CsAmQW3O1iElhmvc5+vRQplzBoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IfpeiKUvYRbkZrje50CezVcty8QcQjk/fPD0RycH4L+lUoywGiq1qt3Qzj0SB1K0t
 oodROXWz2i2+sJ2s6yFg52korSqAeRlgPzFBx4uJV8TIm0Ux+gmv2TysU1sd9UEA4I
 T2Bhfr9leLBIBRZYkuIEmkXUZTtMmlfK4Emgy76Y=
Date: Mon, 22 Mar 2021 18:55:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/mm/hash: Avoid multiple HPT resize-ups on
 memory hotplug
Message-ID: <YFhNd42RvobCV8tF@yekko.fritz.box>
References: <20210312072940.598696-1-leobras.c@gmail.com>
 <20210312072940.598696-3-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A/hfWKlx1dmrJ63j"
Content-Disposition: inline
In-Reply-To: <20210312072940.598696-3-leobras.c@gmail.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Sandipan Das <sandipan@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Dan Williams <dan.j.williams@intel.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--A/hfWKlx1dmrJ63j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 04:29:40AM -0300, Leonardo Bras wrote:
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
> ---
>  arch/powerpc/include/asm/book3s/64/hash.h       |  2 ++
>  arch/powerpc/include/asm/sparsemem.h            |  2 ++
>  arch/powerpc/mm/book3s64/hash_utils.c           | 14 ++++++++++++++
>  arch/powerpc/mm/book3s64/pgtable.c              |  6 ++++++
>  arch/powerpc/platforms/pseries/hotplug-memory.c |  6 ++++++
>  5 files changed, 30 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/inc=
lude/asm/book3s/64/hash.h
> index d959b0195ad9..843b0a178590 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -255,6 +255,8 @@ int hash__create_section_mapping(unsigned long start,=
 unsigned long end,
>  				 int nid, pgprot_t prot);
>  int hash__remove_section_mapping(unsigned long start, unsigned long end);
> =20
> +void hash_memory_batch_expand_prepare(unsigned long newsize);
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_BOOK3S_64_HASH_H */
> diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/=
asm/sparsemem.h
> index d072866842e4..16b5f5300c84 100644
> --- a/arch/powerpc/include/asm/sparsemem.h
> +++ b/arch/powerpc/include/asm/sparsemem.h
> @@ -17,6 +17,8 @@ extern int remove_section_mapping(unsigned long start, =
unsigned long end);
>  extern int memory_add_physaddr_to_nid(u64 start);
>  #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
> =20
> +void memory_batch_expand_prepare(unsigned long newsize);
> +
>  #ifdef CONFIG_NUMA
>  extern int hot_add_scn_to_nid(unsigned long scn_addr);
>  #else
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index cfb3ec164f56..1f6aa0bf27e7 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -858,6 +858,20 @@ int hash__remove_section_mapping(unsigned long start=
, unsigned long end)
> =20
>  	return rc;
>  }
> +
> +void hash_memory_batch_expand_prepare(unsigned long newsize)
> +{
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

This unbounded increase in newsize makes me nervous - we should be
bounded by the current size of the HPT at least.  In practice we
should be fine, since the resize should always succeed by the time we
reach our current HPT size, but that's far from obvious from this
point in the code.

And... you're doubling newsize which is a value which might not be a
power of 2.  I'm wondering if there's an edge case where this could
actually cause us to skip the current size and erroneously resize to
one bigger than we have currently.

> +	}
> +}
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> =20
>  static void __init hash_init_partition_table(phys_addr_t hash_table,
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s6=
4/pgtable.c
> index 5b3a3bae21aa..f1cd8af0f67f 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -193,6 +193,12 @@ int __meminit remove_section_mapping(unsigned long s=
tart, unsigned long end)
> =20
>  	return hash__remove_section_mapping(start, end);
>  }
> +
> +void memory_batch_expand_prepare(unsigned long newsize)

This wrapper doesn't seem useful.

> +{
> +	if (!radix_enabled())
> +		hash_memory_batch_expand_prepare(newsize);
> +}
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> =20
>  void __init mmu_partition_table_init(void)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index 8377f1f7c78e..353c71249214 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -671,6 +671,8 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>  	if (lmbs_available < lmbs_to_add)
>  		return -EINVAL;
> =20
> +	memory_batch_expand_prepare(memblock_phys_mem_size() + lmbs_to_add * dr=
mem_lmb_size());
> +
>  	for_each_drmem_lmb(lmb) {
>  		if (lmb->flags & DRCONF_MEM_ASSIGNED)
>  			continue;
> @@ -734,6 +736,8 @@ static int dlpar_memory_add_by_index(u32 drc_index)
> =20
>  	pr_info("Attempting to hot-add LMB, drc index %x\n", drc_index);
> =20
> +	memory_batch_expand_prepare(memblock_phys_mem_size() +
> +				     drmem_info->n_lmbs * drmem_lmb_size());

This doesn't look right.  memory_add_by_index() is adding a *single*
LMB, I think using drmem_info->n_lmbs here means you're counting this
as adding again as much memory as you already have hotplugged.

>  	lmb_found =3D 0;
>  	for_each_drmem_lmb(lmb) {
>  		if (lmb->drc_index =3D=3D drc_index) {
> @@ -788,6 +792,8 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u3=
2 drc_index)
>  	if (lmbs_available < lmbs_to_add)
>  		return -EINVAL;
> =20
> +	memory_batch_expand_prepare(memblock_phys_mem_size() + lmbs_to_add * dr=
mem_lmb_size());
> +
>  	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>  		if (lmb->flags & DRCONF_MEM_ASSIGNED)
>  			continue;

I don't see memory_batch_expand_prepare() suppressing any existing HPT
resizes.  Won't this just resize to the right size for the full add,
then resize several times again as we perform the add?  Or.. I guess
that will be suppressed by patch 1/3.  That's seems kinda fragile,
though.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--A/hfWKlx1dmrJ63j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYTXUACgkQbDjKyiDZ
s5Lc+BAAugIqlK4Nr7i4A2o2kRmSCJwIz1s4zZsVvkQ+6iKYpHmPDGTxLZq8qxYH
N+qloKmz+AblfeXO3n1jHmNEcOKOK6lLyWB5KS7X1Ha3V1fFcKYe0lYjGIiaf0Jq
CW/PqKyRmmSb5qT5PYxm+Q4pq0ydUGnSa5Rzl99XIxgsvxeDsPcX/Vrwjg/gr8iW
CJAaFdHWcJmioA1q1zcIYlnNeuK0IUKMmglt76Mk6UWasm4k3EvueJD+/U0c2w7d
3EQBbsB3gzoNzfXXSqXQ625bXvrtsmy6qvBf5/alrNYRb9Nhu+AJm9yl9fQstJbZ
PifK3aL6gMf5sxNRqwmHZF4+KalXkWVTmggBqCXFdtx9i8GxrM+t3Pb++D0xjQQL
XuPCKApu80VVaBPAUCljdUVAOavwecERoIh+TofZhbjZPeSUyr4u3onThzlUNr5O
0YW6qV+0uWki4H78zGiFgwXXfdPaQUTkfOy+NWfE2h2qv9MqDMNx5zpgyy6PfHpd
Rnvxz5rB8+if2mls+LM7nX/1WlHOMZqk7XuAj+WrMKQ1WYm5Xxs0vOgK+cQD3MLA
W6rvZAcDHlP1aIXkPbQ0DYBIggNEY4R/TG0tf/UmIi2msLPTqFG1w373zBdSNzJN
mCD/6EQMpBbrkc8J78Oz8wWpLgkQrnpJ7Hpsv3xxqC+YtjhEgSc=
=nPbW
-----END PGP SIGNATURE-----

--A/hfWKlx1dmrJ63j--
