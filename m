Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42E61AD8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 09:03:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hxHH5bzLzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 17:03:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hxF95W0rzDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 17:01:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45hxF92Lx9z9s3Z;
 Mon,  8 Jul 2019 17:01:17 +1000 (AEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 08 Jul 2019 17:01:16 +1000
From: alistair@popple.id.au
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v3 2/3] powerpc/powernv/ioda2: Allocate TCE table
 levels on demand for default DMA window
In-Reply-To: <20190530070355.121802-3-aik@ozlabs.ru>
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <20190530070355.121802-3-aik@ozlabs.ru>
Message-ID: <2426198.tIkMplZ83h@townsend>
X-Sender: alistair@popple.id.au
User-Agent: Roundcube Webmail/1.3.8
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It seems this is mostly just enabling already existing code used by KVM 
for
on-demand TCE level allocation on baremetal as well. Given that I 
suppose the
implementation of the on-demand allocation itself is already used and
therefore somewhat tested by KVM. I took a look at pnv_tce() which does 
the
on-demand allocation and the changes here seem like they should work 
with that
so:

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Thursday, 30 May 2019 5:03:54 PM AEST Alexey Kardashevskiy wrote:
> We allocate only the first level of multilevel TCE tables for KVM
> already (alloc_userspace_copy==true), and the rest is allocated on 
> demand.
> This is not enabled though for baremetal.
> 
> This removes the KVM limitation (implicit, via the alloc_userspace_copy
> parameter) and always allocates just the first level. The on-demand
> allocation of missing levels is already implemented.
> 
> As from now on DMA map might happen with disabled interrupts, this
> allocates TCEs with GFP_ATOMIC.
> 
> To save time when creating a new clean table, this skips non-allocated
> indirect TCE entries in pnv_tce_free just like we already do in
> the VFIO IOMMU TCE driver.
> 
> This changes the default level number from 1 to 2 to reduce the amount
> of memory required for the default 32bit DMA window at the boot time.
> The default window size is up to 2GB which requires 4MB of TCEs which 
> is
> unlikely to be used entirely or at all as most devices these days are
> 64bit capable so by switching to 2 levels by default we save 4032KB of
> RAM per a device.
> 
> While at this, add __GFP_NOWARN to alloc_pages_node() as the userspace
> can trigger this path via VFIO, see the failure and try creating a 
> table
> again with different parameters which might succeed.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * added __GFP_NOWARN to alloc_pages_node
> ---
>  arch/powerpc/platforms/powernv/pci.h          |  2 +-
>  arch/powerpc/platforms/powernv/pci-ioda-tce.c | 20 +++++++++----------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci.h
> b/arch/powerpc/platforms/powernv/pci.h index 1a51e7bfc541..a55dabc8d057
> 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -225,7 +225,7 @@ extern struct iommu_table_group
> *pnv_npu_compound_attach( struct pnv_ioda_pe *pe);
> 
>  /* pci-ioda-tce.c */
> -#define POWERNV_IOMMU_DEFAULT_LEVELS	1
> +#define POWERNV_IOMMU_DEFAULT_LEVELS	2
>  #define POWERNV_IOMMU_MAX_LEVELS	5
> 
>  extern int pnv_tce_build(struct iommu_table *tbl, long index, long 
> npages,
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> b/arch/powerpc/platforms/powernv/pci-ioda-tce.c index
> e28f03e1eb5e..c75ec37bf0cd 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> @@ -36,7 +36,8 @@ static __be64 *pnv_alloc_tce_level(int nid, unsigned 
> int
> shift) struct page *tce_mem = NULL;
>  	__be64 *addr;
> 
> -	tce_mem = alloc_pages_node(nid, GFP_KERNEL, shift - PAGE_SHIFT);
> +	tce_mem = alloc_pages_node(nid, GFP_ATOMIC | __GFP_NOWARN,
> +			shift - PAGE_SHIFT);
>  	if (!tce_mem) {
>  		pr_err("Failed to allocate a TCE memory, level shift=%d\n",
>  				shift);
> @@ -161,6 +162,9 @@ void pnv_tce_free(struct iommu_table *tbl, long 
> index,
> long npages)
> 
>  		if (ptce)
>  			*ptce = cpu_to_be64(0);
> +		else
> +			/* Skip the rest of the level */
> +			i |= tbl->it_level_size - 1;
>  	}
>  }
> 
> @@ -260,7 +264,6 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64
> bus_offset, unsigned int table_shift = max_t(unsigned int, 
> entries_shift +
> 3, PAGE_SHIFT);
>  	const unsigned long tce_table_size = 1UL << table_shift;
> -	unsigned int tmplevels = levels;
> 
>  	if (!levels || (levels > POWERNV_IOMMU_MAX_LEVELS))
>  		return -EINVAL;
> @@ -268,9 +271,6 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64
> bus_offset, if (!is_power_of_2(window_size))
>  		return -EINVAL;
> 
> -	if (alloc_userspace_copy && (window_size > (1ULL << 32)))
> -		tmplevels = 1;
> -
>  	/* Adjust direct table size from window_size and levels */
>  	entries_shift = (entries_shift + levels - 1) / levels;
>  	level_shift = entries_shift + 3;
> @@ -281,7 +281,7 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64
> bus_offset,
> 
>  	/* Allocate TCE table */
>  	addr = pnv_pci_ioda2_table_do_alloc_pages(nid, level_shift,
> -			tmplevels, tce_table_size, &offset, &total_allocated);
> +			1, tce_table_size, &offset, &total_allocated);
> 
>  	/* addr==NULL means that the first level allocation failed */
>  	if (!addr)
> @@ -292,18 +292,18 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, 
> __u64
> bus_offset, * we did not allocate as much as we wanted,
>  	 * release partially allocated table.
>  	 */
> -	if (tmplevels == levels && offset < tce_table_size)
> +	if (levels == 1 && offset < tce_table_size)
>  		goto free_tces_exit;
> 
>  	/* Allocate userspace view of the TCE table */
>  	if (alloc_userspace_copy) {
>  		offset = 0;
>  		uas = pnv_pci_ioda2_table_do_alloc_pages(nid, level_shift,
> -				tmplevels, tce_table_size, &offset,
> +				1, tce_table_size, &offset,
>  				&total_allocated_uas);
>  		if (!uas)
>  			goto free_tces_exit;
> -		if (tmplevels == levels && (offset < tce_table_size ||
> +		if (levels == 1 && (offset < tce_table_size ||
>  				total_allocated_uas != total_allocated))
>  			goto free_uas_exit;
>  	}
> @@ -318,7 +318,7 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64
> bus_offset,
> 
>  	pr_debug("Created TCE table: ws=%08llx ts=%lx @%08llx base=%lx uas=%p
> levels=%d/%d\n", window_size, tce_table_size, bus_offset, tbl->it_base,
> -			tbl->it_userspace, tmplevels, levels);
> +			tbl->it_userspace, 1, levels);
> 
>  	return 0;
