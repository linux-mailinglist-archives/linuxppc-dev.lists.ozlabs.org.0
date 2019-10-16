Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6407D972F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 18:24:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46td0w38XDzDqyY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 03:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=neo-zeon.de (client-ip=96.90.244.226; helo=neo-zeon.de;
 envelope-from=cam@neo-zeon.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neo-zeon.de
Received: from neo-zeon.de (neo-zeon.de [96.90.244.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tcy73dPDzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 03:22:07 +1100 (AEDT)
Received: from [192.168.0.55] (ukyo.nerv.lan [192.168.0.55])
 (authenticated bits=0)
 by neo-zeon.de (8.15.2/8.15.2) with ESMTPSA id x9GGLt5e042976
 (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NO);
 Wed, 16 Oct 2019 09:21:55 -0700 (PDT) (envelope-from cam@neo-zeon.de)
Subject: Re: [PATCH] powerpc/mm/book3s64/hash: Update 4k PAGE_SIZE kernel
 mapping
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
References: <20191016055130.10533-1-aneesh.kumar@linux.ibm.com>
From: Cameron Berkenpas <cam@neo-zeon.de>
Message-ID: <1703e33e-3529-7037-7b41-674448bf85da@neo-zeon.de>
Date: Wed, 16 Oct 2019 09:21:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016055130.10533-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Seems to work for me so far! I've tried successfully against 5.2.21 and 
5.3.6.

Thanks!

-Cameron

On 10/15/19 10:51 PM, Aneesh Kumar K.V wrote:
> With commit: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel
> regions in the same 0xc range"), kernel now split the 64TB address range
> into 4 contexts each of 16TB. That implies we can do only 16TB linear
> mapping. This results in boot failure on some P9 systems.
>
> Fix this by redoing the hash 4k mapping as below.
>
>   vmalloc start     = 0xd000000000000000
>   IO start          = 0xd000380000000000
>   vmemmap start     = 0xf000000000000000
>
> Vmalloc area is now 56TB in size and IO remap 8TB. We need to keep them in the
> same top nibble address because we map both of them in the Linux page table and they
> share the init_mm page table. We need a large vmalloc space because we use
> percpu embedded first chunk allocator.
>
> Both linear and vmemmap range is of 64TB size each and is mapped respectively
> using 0xc and 0xf top nibble.
>
> Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the same 0xc range")
> Reported-by: Cameron Berkenpas <cam@neo-zeon.de>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/book3s/64/hash-4k.h  | 54 ++++++++++--
>   arch/powerpc/include/asm/book3s/64/hash-64k.h | 73 ++++++++++++++++-
>   arch/powerpc/include/asm/book3s/64/hash.h     | 82 ++-----------------
>   3 files changed, 123 insertions(+), 86 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> index 8fd8599c9395..4cbb9fe22d76 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> @@ -12,23 +12,59 @@
>    * Hence also limit max EA bits to 64TB.
>    */
>   #define MAX_EA_BITS_PER_CONTEXT		46
> -
> -#define REGION_SHIFT		(MAX_EA_BITS_PER_CONTEXT - 2)
> +/*
> + * For 4k hash, considering we restricted by a page table sizing that
> + * limit our address range to 64TB, keep the kernel virtual
> + * mapping in 0xd region.
> + */
> +#define H_KERN_VIRT_START	ASM_CONST(0xd000000000000000)
>   
>   /*
> - * Our page table limit us to 64TB. Hence for the kernel mapping,
> - * each MAP area is limited to 16 TB.
> - * The four map areas are:  linear mapping, vmap, IO and vmemmap
> + * Top 4 bits are ignored in page table walk.
>    */
> -#define H_KERN_MAP_SIZE		(ASM_CONST(1) << REGION_SHIFT)
> +#define EA_MASK			(~(0xfUL << 60))
>   
>   /*
> - * Define the address range of the kernel non-linear virtual area
> - * 16TB
> + * Place vmalloc and IO in the 64TB range because we map them via linux page
> + * table and table size is limited to 64TB.
> + */
> +#define H_VMALLOC_START		H_KERN_VIRT_START
> +/*
> + * 56TB vmalloc size. We require large vmalloc space for percpu mapping.
>    */
> -#define H_KERN_VIRT_START	ASM_CONST(0xc000100000000000)
> +#define H_VMALLOC_SIZE		(56UL << 40)
> +#define H_VMALLOC_END		(H_VMALLOC_START + H_VMALLOC_SIZE)
> +
> +#define H_KERN_IO_START		H_VMALLOC_END
> +#define H_KERN_IO_SIZE		(8UL << 40)
> +#define H_KERN_IO_END		(H_KERN_IO_START + H_KERN_IO_SIZE)
> +
> +#define H_VMEMMAP_START		ASM_CONST(0xf000000000000000)
> +#define H_VMEMMAP_SIZE		(1UL << MAX_EA_BITS_PER_CONTEXT)
> +#define H_VMEMMAP_END		(H_VMEMMAP_START + H_VMEMMAP_SIZE)
>   
>   #ifndef __ASSEMBLY__
> +static inline int get_region_id(unsigned long ea)
> +{
> +	int id = (ea >> 60UL);
> +
> +	switch (id) {
> +	case 0x0:
> +		return USER_REGION_ID;
> +	case 0xc:
> +		return LINEAR_MAP_REGION_ID;
> +	case 0xd:
> +		if (ea < H_KERN_IO_START)
> +			return VMALLOC_REGION_ID;
> +		else
> +			return IO_REGION_ID;
> +	case 0xf:
> +		return VMEMMAP_REGION_ID;
> +	default:
> +		return INVALID_REGION_ID;
> +	}
> +}
> +
>   #define H_PTE_TABLE_SIZE	(sizeof(pte_t) << H_PTE_INDEX_SIZE)
>   #define H_PMD_TABLE_SIZE	(sizeof(pmd_t) << H_PMD_INDEX_SIZE)
>   #define H_PUD_TABLE_SIZE	(sizeof(pud_t) << H_PUD_INDEX_SIZE)
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
> index d1d9177d9ebd..fc44bc590ac8 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
> @@ -13,18 +13,61 @@
>    * is handled in the hotpath.
>    */
>   #define MAX_EA_BITS_PER_CONTEXT		49
> -#define REGION_SHIFT		MAX_EA_BITS_PER_CONTEXT
> +
> +/*
> + * Define the address range of the kernel non-linear virtual area
> + * 2PB
> + */
> +#define H_KERN_VIRT_START	ASM_CONST(0xc008000000000000)
>   
>   /*
>    * We use one context for each MAP area.
>    */
> +#define REGION_SHIFT		MAX_EA_BITS_PER_CONTEXT
>   #define H_KERN_MAP_SIZE		(1UL << MAX_EA_BITS_PER_CONTEXT)
>   
>   /*
> - * Define the address range of the kernel non-linear virtual area
> - * 2PB
> + * Top 2 bits are ignored in page table walk.
>    */
> -#define H_KERN_VIRT_START	ASM_CONST(0xc008000000000000)
> +#define EA_MASK			(~(0xcUL << 60))
> +
> +/*
> + * +------------------------------+
> + * |                              |
> + * |                              |
> + * |                              |
> + * +------------------------------+  Kernel virtual map end (0xc00e000000000000)
> + * |                              |
> + * |                              |
> + * |      512TB/16TB of vmemmap   |
> + * |                              |
> + * |                              |
> + * +------------------------------+  Kernel vmemmap  start
> + * |                              |
> + * |      512TB/16TB of IO map    |
> + * |                              |
> + * +------------------------------+  Kernel IO map start
> + * |                              |
> + * |      512TB/16TB of vmap      |
> + * |                              |
> + * +------------------------------+  Kernel virt start (0xc008000000000000)
> + * |                              |
> + * |                              |
> + * |                              |
> + * +------------------------------+  Kernel linear (0xc.....)
> + */
> +
> +#define H_VMALLOC_START		H_KERN_VIRT_START
> +#define H_VMALLOC_SIZE		H_KERN_MAP_SIZE
> +#define H_VMALLOC_END		(H_VMALLOC_START + H_VMALLOC_SIZE)
> +
> +#define H_KERN_IO_START		H_VMALLOC_END
> +#define H_KERN_IO_SIZE		H_KERN_MAP_SIZE
> +#define H_KERN_IO_END		(H_KERN_IO_START + H_KERN_IO_SIZE)
> +
> +#define H_VMEMMAP_START		H_KERN_IO_END
> +#define H_VMEMMAP_SIZE		H_KERN_MAP_SIZE
> +#define H_VMEMMAP_END		(H_VMEMMAP_START + H_VMEMMAP_SIZE)
>   
>   /*
>    * 64k aligned address free up few of the lower bits of RPN for us
> @@ -69,6 +112,28 @@
>   #ifndef __ASSEMBLY__
>   #include <asm/errno.h>
>   
> +#define NON_LINEAR_REGION_ID(ea)	((((unsigned long)(ea) - H_KERN_VIRT_START) >> REGION_SHIFT) + 2)
> +
> +static inline int get_region_id(unsigned long ea)
> +{
> +	int region_id;
> +	int id = (ea >> 60UL);
> +
> +	if (id == 0)
> +		return USER_REGION_ID;
> +
> +	if (id != (PAGE_OFFSET >> 60))
> +		return INVALID_REGION_ID;
> +
> +	if (ea < H_KERN_VIRT_START)
> +		return LINEAR_MAP_REGION_ID;
> +
> +	BUILD_BUG_ON(NON_LINEAR_REGION_ID(H_VMALLOC_START) != 2);
> +
> +	region_id = NON_LINEAR_REGION_ID(ea);
> +	return region_id;
> +}
> +
>   /*
>    * With 64K pages on hash table, we have a special PTE format that
>    * uses a second "half" of the page table to encode sub-page information
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
> index 2781ebf6add4..e279224629a2 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -11,6 +11,15 @@
>    *
>    */
>   #define H_PTE_NONE_MASK		_PAGE_HPTEFLAGS
> +/*
> + * Region IDs
> + */
> +#define USER_REGION_ID		0
> +#define LINEAR_MAP_REGION_ID	1
> +#define VMALLOC_REGION_ID	2
> +#define IO_REGION_ID		3
> +#define VMEMMAP_REGION_ID	4
> +#define INVALID_REGION_ID	5
>   
>   #ifdef CONFIG_PPC_64K_PAGES
>   #include <asm/book3s/64/hash-64k.h>
> @@ -29,10 +38,6 @@
>   #define H_PGTABLE_EADDR_SIZE	(H_PTE_INDEX_SIZE + H_PMD_INDEX_SIZE + \
>   				 H_PUD_INDEX_SIZE + H_PGD_INDEX_SIZE + PAGE_SHIFT)
>   #define H_PGTABLE_RANGE		(ASM_CONST(1) << H_PGTABLE_EADDR_SIZE)
> -/*
> - * Top 2 bits are ignored in page table walk.
> - */
> -#define EA_MASK			(~(0xcUL << 60))
>   
>   /*
>    * We store the slot details in the second half of page table.
> @@ -45,56 +50,6 @@
>   #define H_PUD_CACHE_INDEX	(H_PUD_INDEX_SIZE)
>   #endif
>   
> -/*
> - * +------------------------------+
> - * |                              |
> - * |                              |
> - * |                              |
> - * +------------------------------+  Kernel virtual map end (0xc00e000000000000)
> - * |                              |
> - * |                              |
> - * |      512TB/16TB of vmemmap   |
> - * |                              |
> - * |                              |
> - * +------------------------------+  Kernel vmemmap  start
> - * |                              |
> - * |      512TB/16TB of IO map    |
> - * |                              |
> - * +------------------------------+  Kernel IO map start
> - * |                              |
> - * |      512TB/16TB of vmap      |
> - * |                              |
> - * +------------------------------+  Kernel virt start (0xc008000000000000)
> - * |                              |
> - * |                              |
> - * |                              |
> - * +------------------------------+  Kernel linear (0xc.....)
> - */
> -
> -#define H_VMALLOC_START		H_KERN_VIRT_START
> -#define H_VMALLOC_SIZE		H_KERN_MAP_SIZE
> -#define H_VMALLOC_END		(H_VMALLOC_START + H_VMALLOC_SIZE)
> -
> -#define H_KERN_IO_START		H_VMALLOC_END
> -#define H_KERN_IO_SIZE		H_KERN_MAP_SIZE
> -#define H_KERN_IO_END		(H_KERN_IO_START + H_KERN_IO_SIZE)
> -
> -#define H_VMEMMAP_START		H_KERN_IO_END
> -#define H_VMEMMAP_SIZE		H_KERN_MAP_SIZE
> -#define H_VMEMMAP_END		(H_VMEMMAP_START + H_VMEMMAP_SIZE)
> -
> -#define NON_LINEAR_REGION_ID(ea)	((((unsigned long)ea - H_KERN_VIRT_START) >> REGION_SHIFT) + 2)
> -
> -/*
> - * Region IDs
> - */
> -#define USER_REGION_ID		0
> -#define LINEAR_MAP_REGION_ID	1
> -#define VMALLOC_REGION_ID	NON_LINEAR_REGION_ID(H_VMALLOC_START)
> -#define IO_REGION_ID		NON_LINEAR_REGION_ID(H_KERN_IO_START)
> -#define VMEMMAP_REGION_ID	NON_LINEAR_REGION_ID(H_VMEMMAP_START)
> -#define INVALID_REGION_ID	(VMEMMAP_REGION_ID + 1)
> -
>   /*
>    * Defines the address of the vmemap area, in its own region on
>    * hash table CPUs.
> @@ -112,25 +67,6 @@
>   #define H_PUD_BAD_BITS		(PMD_TABLE_SIZE-1)
>   
>   #ifndef __ASSEMBLY__
> -static inline int get_region_id(unsigned long ea)
> -{
> -	int region_id;
> -	int id = (ea >> 60UL);
> -
> -	if (id == 0)
> -		return USER_REGION_ID;
> -
> -	if (id != (PAGE_OFFSET >> 60))
> -		return INVALID_REGION_ID;
> -
> -	if (ea < H_KERN_VIRT_START)
> -		return LINEAR_MAP_REGION_ID;
> -
> -	BUILD_BUG_ON(NON_LINEAR_REGION_ID(H_VMALLOC_START) != 2);
> -
> -	region_id = NON_LINEAR_REGION_ID(ea);
> -	return region_id;
> -}
>   
>   #define	hash__pmd_bad(pmd)		(pmd_val(pmd) & H_PMD_BAD_BITS)
>   #define	hash__pud_bad(pud)		(pud_val(pud) & H_PUD_BAD_BITS)

