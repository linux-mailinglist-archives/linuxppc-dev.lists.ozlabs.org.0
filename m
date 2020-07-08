Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42932217E83
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 06:43:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1msF48n5zDqyx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:43:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1mqc4Zq5zDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 14:42:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jX9pvylY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1mqc0y1vz9sDX;
 Wed,  8 Jul 2020 14:42:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594183324;
 bh=02lvQX5MTs2cs2zT9G3tJXFI/Mphm9oK+EP8lYSqmqc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jX9pvylY7D02qxenqdiUhLApQTcintLZX6bbTZXuDsxS9EP3/PfbFAXyXq4LTkkc7
 Z0bMhlX2Gy/qHxgbd4OR066tyVI0+kHYn3c5cb3pOV0zGXzgyGjdVxzH/AS2XXRSF9
 1w3mEb+QIDqJC2NoAKWyR7MtyavJI4R7K75JUHVnESWlRS7CXYsWfUgYri2WlGB90D
 YkNoEA/FeEIAuV+XWvzSvAdeeiH7t2pPeIl8jRCCvnQHsS6usH3V95MQJwxT5D9mSo
 PNHUmewAlL8AiJkyFcnAaBAjqHS/tCy0s7Oqi3IoAmdrhYi00ZOkQH56YBqMh7mVP3
 lOKgqwVxqI9FQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 4/4] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
In-Reply-To: <20200625064547.228448-5-aneesh.kumar@linux.ibm.com>
References: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
 <20200625064547.228448-5-aneesh.kumar@linux.ibm.com>
Date: Wed, 08 Jul 2020 14:44:16 +1000
Message-ID: <877dve4nvj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> To enable memory unplug without splitting kernel page table
> mapping, we force the max mapping size to the LMB size. LMB
> size is the unit in which hypervisor will do memory add/remove
> operation.
>
> This implies on pseries system, we now end up mapping

Please expand on why it "implies" that for pseries.

> memory with 2M page size instead of 1G. To improve
> that we want hypervisor to hint the kernel about the hotplug
> memory range.  This was added that as part of
                 That
>
> commit b6eca183e23e ("powerpc/kernel: Enables memory
> hot-remove after reboot on pseries guests")
>
> But we still don't do that on PowerVM. Once we get PowerVM

I think you mean PowerVM doesn't provide that hint yet?

Realistically it won't until P10. So this means we'll always use 2MB on
Power9 PowerVM doesn't it?

What about KVM?

Have you done any benchmarking on the impact of switching the linear
mapping to 2MB pages?

> updated, we can then force the 2M mapping only to hot-pluggable
> memory region using memblock_is_hotpluggable(). Till then
> let's depend on LMB size for finding the mapping page size
> for linear range.
>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 83 ++++++++++++++++++++----
>  arch/powerpc/platforms/powernv/setup.c   | 10 ++-
>  2 files changed, 81 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 78ad11812e0d..a4179e4da49d 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -15,6 +15,7 @@
>  #include <linux/mm.h>
>  #include <linux/hugetlb.h>
>  #include <linux/string_helpers.h>
> +#include <linux/memory.h>
>  
>  #include <asm/pgtable.h>
>  #include <asm/pgalloc.h>
> @@ -34,6 +35,7 @@
>  
>  unsigned int mmu_pid_bits;
>  unsigned int mmu_base_pid;
> +unsigned int radix_mem_block_size;

static? __ro_after_init?

> @@ -266,6 +268,7 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
>  
>  static int __meminit create_physical_mapping(unsigned long start,
>  					     unsigned long end,
> +					     unsigned long max_mapping_size,
>  					     int nid, pgprot_t _prot)
>  {
>  	unsigned long vaddr, addr, mapping_size = 0;
> @@ -279,6 +282,8 @@ static int __meminit create_physical_mapping(unsigned long start,
>  		int rc;
>  
>  		gap = next_boundary(addr, end) - addr;
> +		if (gap > max_mapping_size)
> +			gap = max_mapping_size;
>  		previous_size = mapping_size;
>  		prev_exec = exec;
>  
> @@ -329,8 +334,9 @@ static void __init radix_init_pgtable(void)
>  
>  	/* We don't support slb for radix */
>  	mmu_slb_size = 0;
> +
>  	/*
> -	 * Create the linear mapping, using standard page size for now
> +	 * Create the linear mapping
>  	 */
>  	for_each_memblock(memory, reg) {
>  		/*
> @@ -346,6 +352,7 @@ static void __init radix_init_pgtable(void)
>  
>  		WARN_ON(create_physical_mapping(reg->base,
>  						reg->base + reg->size,
> +						radix_mem_block_size,
>  						-1, PAGE_KERNEL));
>  	}
>  
> @@ -486,6 +493,49 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
>  	return 1;
>  }
>  
> +static int __init probe_memory_block_size(unsigned long node, const char *uname, int
> +					  depth, void *data)
> +{
> +	const __be32 *block_size;
> +	int len;
> +
> +	if (depth != 1)
> +		return 0;
> +
> +	if (!strcmp(uname, "ibm,dynamic-reconfiguration-memory")) {

	if (strcmp(uname, "ibm,dynamic-reconfiguration-memory") != 0)
        	return 0;

Then you can de-indent the rest of the body.


> +		block_size = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
> +		if (!block_size || len < dt_root_size_cells * sizeof(__be32))

This will give us a sparse warning, please do the endian conversion
before looking at the value.

> +			/*
> +			 * Nothing in the device tree
> +			 */
> +			return MIN_MEMORY_BLOCK_SIZE;

> +
> +		return dt_mem_next_cell(dt_root_size_cells, &block_size);

Just of_read_number() ?

This is misusing the return value, as I explained on one of your other
recent patches. You should return !0 to indicate that scanning should
stop, and the actual value can go via the data pointer, or better just
set the global.


> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long radix_memory_block_size(void)
> +{
> +	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;

> +
> +	if (firmware_has_feature(FW_FEATURE_OPAL)) {
> +
> +		mem_block_size = 1UL * 1024 * 1024 * 1024;

We have 1GB hardcoded here and also in pnv_memory_block_size().

Shouldn't pnv_memory_block_size() at least be using radix_mem_block_size?

> +	} else if (firmware_has_feature(FW_FEATURE_LPAR)) {
> +		mem_block_size = of_scan_flat_dt(probe_memory_block_size, NULL);
> +		if (!mem_block_size)
> +			mem_block_size = MIN_MEMORY_BLOCK_SIZE;
> +	}
> +
> +	return mem_block_size;
> +}

It would probably be simpler if that was just inlined below.

> +
> +
>  void __init radix__early_init_devtree(void)
>  {
>  	int rc;
> @@ -494,17 +544,27 @@ void __init radix__early_init_devtree(void)
>  	 * Try to find the available page sizes in the device-tree
>  	 */
>  	rc = of_scan_flat_dt(radix_dt_scan_page_sizes, NULL);
> -	if (rc != 0)  /* Found */
> -		goto found;
> +	if (rc == 0) {
> +		/*
> +		 * no page size details found in device tree
> +		 * let's assume we have page 4k and 64k support

Capitals and punctuation please?

> +		 */
> +		mmu_psize_defs[MMU_PAGE_4K].shift = 12;
> +		mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
> +
> +		mmu_psize_defs[MMU_PAGE_64K].shift = 16;
> +		mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
> +	}

Moving that seems like an unrelated change. It's a reasonable change but
I'd rather you did it in a standalone patch.

>  	/*
> -	 * let's assume we have page 4k and 64k support
> +	 * Max mapping size used when mapping pages. We don't use
> +	 * ppc_md.memory_block_size() here because this get called
> +	 * early and we don't have machine probe called yet. Also
> +	 * the pseries implementation only check for ibm,lmb-size.
> +	 * All hypervisor supporting radix do expose that device
> +	 * tree node.
>  	 */
> -	mmu_psize_defs[MMU_PAGE_4K].shift = 12;
> -	mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
> -
> -	mmu_psize_defs[MMU_PAGE_64K].shift = 16;
> -	mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
> -found:
> +	radix_mem_block_size = radix_memory_block_size();

If you did that earlier in the function, before
radix_dt_scan_page_sizes(), the logic would be simpler.

>  	return;
>  }
>  
> @@ -856,7 +916,8 @@ int __meminit radix__create_section_mapping(unsigned long start,
>  		return -1;
>  	}
>  
> -	return create_physical_mapping(__pa(start), __pa(end), nid, prot);
> +	return create_physical_mapping(__pa(start), __pa(end),
> +				       radix_mem_block_size, nid, prot);
>  }
>  
>  int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
> index 3bc188da82ba..6e2f614590a3 100644
> --- a/arch/powerpc/platforms/powernv/setup.c
> +++ b/arch/powerpc/platforms/powernv/setup.c
> @@ -399,7 +399,15 @@ static void pnv_kexec_cpu_down(int crash_shutdown, int secondary)
>  #ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
>  static unsigned long pnv_memory_block_size(void)
>  {
> -	return 256UL * 1024 * 1024;
> +	/*
> +	 * We map the kernel linear region with 1GB large pages on radix. For
> +	 * memory hot unplug to work our memory block size must be at least
> +	 * this size.
> +	 */
> +	if (radix_enabled())
> +		return 1UL * 1024 * 1024 * 1024;
> +	else
> +		return 256UL * 1024 * 1024;
>  }
>  #endif
>  
> -- 
> 2.26.2


cheers
