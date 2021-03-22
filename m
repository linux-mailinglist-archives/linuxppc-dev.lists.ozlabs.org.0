Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E18345387
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:01:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4BNt6Y49z30Fg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:01:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=nxmYxd5t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=nxmYxd5t; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4BNR6FHwz2yRh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 11:01:11 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4BNR1jjrz9sVt; Tue, 23 Mar 2021 11:01:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616457671;
 bh=2B47zSLfKdKBUMFaksnySYIgLtsf9FPssHOONTo5Log=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxmYxd5tNWfXzOubueRVdLgfgzB9uak/ODIxg8N0RBw/kfrQjD168iO461XNwYcTU
 ttXfy84iOPX2AZHeYVKhuLXxhgJ3bDpvaGlKQ3TW0OhkJ6OvsHmjE4Eg6bUAiO3J35
 Eqr1JaJQyI/QDtq8loL01ljaMgrG/GHBU6L5Atzs=
Date: Tue, 23 Mar 2021 10:45:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/mm/hash: Avoid multiple HPT resize-downs on
 memory hotunplug
Message-ID: <YFksMw8Hw/mC48yb@yekko.fritz.box>
References: <20210312072940.598696-1-leobras.c@gmail.com>
 <20210312072940.598696-4-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gtIkK5qVPrjLWkaU"
Content-Disposition: inline
In-Reply-To: <20210312072940.598696-4-leobras.c@gmail.com>
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


--gtIkK5qVPrjLWkaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 04:29:41AM -0300, Leonardo Bras wrote:
> During memory hotunplug, after each LMB is removed, the HPT may be
> resized-down if it would map a max of 4 times the current amount of memor=
y.
> (2 shifts, due to introduced histeresis)
>=20
> It usually is not an issue, but it can take a lot of time if HPT
> resizing-down fails. This happens  because resize-down failures
> usually repeat at each LMB removal, until there are no more bolted entries
> conflict, which can take a while to happen.
>=20
> This can be solved by doing a single HPT resize at the end of memory
> hotunplug, after all requested entries are removed.
>=20
> To make this happen, it's necessary to temporarily disable all HPT
> resize-downs before hotunplug, re-enable them after hotunplug ends,
> and then resize-down HPT to the current memory size.
>=20
> As an example, hotunplugging 256GB from a 385GB guest took 621s without
> this patch, and 100s after applied.
>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/include/asm/book3s/64/hash.h     |  2 ++
>  arch/powerpc/include/asm/sparsemem.h          |  2 ++
>  arch/powerpc/mm/book3s64/hash_utils.c         | 28 +++++++++++++++++++
>  arch/powerpc/mm/book3s64/pgtable.c            | 12 ++++++++
>  .../platforms/pseries/hotplug-memory.c        | 16 +++++++++++
>  5 files changed, 60 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/inc=
lude/asm/book3s/64/hash.h
> index 843b0a178590..f92697c107f7 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -256,6 +256,8 @@ int hash__create_section_mapping(unsigned long start,=
 unsigned long end,
>  int hash__remove_section_mapping(unsigned long start, unsigned long end);
> =20
>  void hash_memory_batch_expand_prepare(unsigned long newsize);
> +void hash_memory_batch_shrink_begin(void);
> +void hash_memory_batch_shrink_end(void);
> =20
>  #endif /* !__ASSEMBLY__ */
>  #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/=
asm/sparsemem.h
> index 16b5f5300c84..a7a8a0d070fc 100644
> --- a/arch/powerpc/include/asm/sparsemem.h
> +++ b/arch/powerpc/include/asm/sparsemem.h
> @@ -18,6 +18,8 @@ extern int memory_add_physaddr_to_nid(u64 start);
>  #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
> =20
>  void memory_batch_expand_prepare(unsigned long newsize);
> +void memory_batch_shrink_begin(void);
> +void memory_batch_shrink_end(void);
> =20
>  #ifdef CONFIG_NUMA
>  extern int hot_add_scn_to_nid(unsigned long scn_addr);
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index 1f6aa0bf27e7..e16f207de8e4 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -794,6 +794,9 @@ static unsigned long __init htab_get_table_size(void)
>  }
> =20
>  #ifdef CONFIG_MEMORY_HOTPLUG
> +
> +atomic_t hpt_resize_disable =3D ATOMIC_INIT(0);
> +
>  static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrin=
king)
>  {
>  	unsigned target_hpt_shift;
> @@ -805,6 +808,10 @@ static int resize_hpt_for_hotplug(unsigned long new_=
mem_size, bool shrinking)
> =20
>  	if (shrinking) {
> =20
> +		/* When batch removing entries, only resizes HPT at the end. */
> +		if (atomic_read_acquire(&hpt_resize_disable))
> +			return 0;
> +

I'm not quite convinced by this locking.  Couldn't hpt_resize_disable
be set after this point, but while you're still inside
resize_hpt_for_hotplug()?  Probably better to use an explicit mutex
(and mutex_trylock()) to make the critical sections clearer.

Except... do we even need the fancy mechanics to suppress the resizes
in one place to do them elswhere.  Couldn't we just replace the
existing resize calls with the batched ones?

>  		/*
>  		 * To avoid lots of HPT resizes if memory size is fluctuating
>  		 * across a boundary, we deliberately have some hysterisis
> @@ -872,6 +879,27 @@ void hash_memory_batch_expand_prepare(unsigned long =
newsize)
>  		pr_warn("Hash collision while resizing HPT\n");
>  	}
>  }
> +
> +void hash_memory_batch_shrink_begin(void)
> +{
> +	/* Disable HPT resize-down during hot-unplug */
> +	atomic_set_release(&hpt_resize_disable, 1);
> +}
> +
> +void hash_memory_batch_shrink_end(void)
> +{
> +	unsigned long newsize;
> +
> +	/* Re-enables HPT resize-down after hot-unplug */
> +	atomic_set_release(&hpt_resize_disable, 0);
> +
> +	newsize =3D memblock_phys_mem_size();
> +	/* Resize to smallest SHIFT possible */
> +	while (resize_hpt_for_hotplug(newsize, true) =3D=3D -ENOSPC) {
> +		newsize *=3D 2;

As noted earlier, doing this without an explicit cap on the new hpt
size (of the existing size) this makes me nervous.  Less so, but doing
the calculations on memory size, rather than explictly on HPT size /
HPT order also seems kinda clunky.

> +		pr_warn("Hash collision while resizing HPT\n");
> +	}
> +}
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> =20
>  static void __init hash_init_partition_table(phys_addr_t hash_table,
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s6=
4/pgtable.c
> index f1cd8af0f67f..e01681e22e00 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -199,6 +199,18 @@ void memory_batch_expand_prepare(unsigned long newsi=
ze)
>  	if (!radix_enabled())
>  		hash_memory_batch_expand_prepare(newsize);
>  }
> +
> +void memory_batch_shrink_begin(void)
> +{
> +	if (!radix_enabled())
> +		hash_memory_batch_shrink_begin();
> +}
> +
> +void memory_batch_shrink_end(void)
> +{
> +	if (!radix_enabled())
> +		hash_memory_batch_shrink_end();
> +}

Again, these wrappers don't seem particularly useful to me.

>  #endif /* CONFIG_MEMORY_HOTPLUG */
> =20
>  void __init mmu_partition_table_init(void)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index 353c71249214..9182fb5b5c01 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -425,6 +425,8 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_r=
emove)
>  		return -EINVAL;
>  	}
> =20
> +	memory_batch_shrink_begin();
> +
>  	for_each_drmem_lmb(lmb) {
>  		rc =3D dlpar_remove_lmb(lmb);
>  		if (rc)
> @@ -470,6 +472,8 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_r=
emove)
>  		rc =3D 0;
>  	}
> =20
> +	memory_batch_shrink_end();
> +
>  	return rc;
>  }
> =20
> @@ -481,6 +485,8 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
> =20
>  	pr_debug("Attempting to hot-remove LMB, drc index %x\n", drc_index);
> =20
> +	memory_batch_shrink_begin();
> +
>  	lmb_found =3D 0;
>  	for_each_drmem_lmb(lmb) {
>  		if (lmb->drc_index =3D=3D drc_index) {
> @@ -502,6 +508,8 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
>  	else
>  		pr_debug("Memory at %llx was hot-removed\n", lmb->base_addr);
> =20
> +	memory_batch_shrink_end();

remove_by_index only removes a single LMB, so there's no real point to
batching here.

>  	return rc;
>  }
> =20
> @@ -532,6 +540,8 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remo=
ve, u32 drc_index)
>  	if (lmbs_available < lmbs_to_remove)
>  		return -EINVAL;
> =20
> +	memory_batch_shrink_begin();
> +
>  	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>  		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>  			continue;
> @@ -572,6 +582,8 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remo=
ve, u32 drc_index)
>  		}
>  	}
> =20
> +	memory_batch_shrink_end();
> +
>  	return rc;
>  }
> =20
> @@ -700,6 +712,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>  	if (lmbs_added !=3D lmbs_to_add) {
>  		pr_err("Memory hot-add failed, removing any added LMBs\n");
> =20
> +		memory_batch_shrink_begin();


The effect of these on the memory grow path is far from clear.

>  		for_each_drmem_lmb(lmb) {
>  			if (!drmem_lmb_reserved(lmb))
>  				continue;
> @@ -713,6 +726,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
> =20
>  			drmem_remove_lmb_reservation(lmb);
>  		}
> +		memory_batch_shrink_end();
>  		rc =3D -EINVAL;
>  	} else {
>  		for_each_drmem_lmb(lmb) {
> @@ -814,6 +828,7 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u3=
2 drc_index)
>  	if (rc) {
>  		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
> =20
> +		memory_batch_shrink_begin();
>  		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>  			if (!drmem_lmb_reserved(lmb))
>  				continue;
> @@ -827,6 +842,7 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u3=
2 drc_index)
> =20
>  			drmem_remove_lmb_reservation(lmb);
>  		}
> +		memory_batch_shrink_end();
>  		rc =3D -EINVAL;
>  	} else {
>  		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gtIkK5qVPrjLWkaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZLDIACgkQbDjKyiDZ
s5KydRAAvlSEci9/e1SzmnhDyBt8gLcH9LuoP+xvXgVJ7HoHOgkTG0wXUr2zjerN
UkgsVSSW/UucmAvr8pM3UC56Yn49cl94HAY5HYAcmld0F+1SHviag1cRvy2IF8WQ
BgC6+hOLZ4MjatCplw4kVQKEp9yY+lOvwFsqJkwFz5yjPooBEO5MtJ8H4J3zzwev
a0bSpmmwaDg9kcP8CcTr6eCHrgc8fHsDVmkB1evJiGC+hMDHsO4IdET6ULZqUVlQ
XjJy634j1Eb1LcTiNq3WVnnD/AQZ7PNJqzKwG/PxEfQNT/Q180aP4UivxPzDlnhS
Jh3QBKmjiC7JFEhOCH2NTiYHM+eYj0so/5d14gquTMqJOBbFjOHpC/VxpIlzvCW2
Gomr9tzy14sA4wpmT7yRIOMEaKbOFgXw+BYetUowDk8cO2VpyQ/Xs/p/3DVifaz5
g1ppt73qoMAv2G4kmmFo6G/4yqw1jhY7RLIx9LwQfPYTMUNSk51LLoVea5W0wvJm
S8XXM5rYV9EU2qOluChXpd6//lJ9iw4O6onqFQ9bCCNXtSETMOJicJauHU3d+csA
V+eQ2gHngCHDvy4FqwgDyZVKlETdnIHh+NSTi0D1MVinvZzmx+am5f7pPxDwPWdD
r1yph4aI2SsfZwW+ezJwLAFeHuKNwLX8JPDWQMNkw3NVVT+h7ZY=
=mGrR
-----END PGP SIGNATURE-----

--gtIkK5qVPrjLWkaU--
