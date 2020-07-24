Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CE122C494
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 13:53:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCnfV1WDgzDrhk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 21:53:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCncb3pxVzF09T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 21:52:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i/LmSdSX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BCncb1dwVz9sR4;
 Fri, 24 Jul 2020 21:52:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595591535;
 bh=4KMhG3cq+LtWg000CfGkBDIp2ezTmgVGTZ3DvDInEQo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i/LmSdSXJhh4VUE473lS03jZtJrcMAbl+LZ+rZZj9lrG1vPabFevtcmAcyn3PgQil
 CieKG/LRlTx+3+nfv/KoZ+louvk0P/5XJ5B770rV3g6oH1s8dvroNOpdbW00kQ5wCL
 Xrk2m3jMkjFUVO8VAkk+XxxFEmMMIixuc9lp4r/SA3FxoMhkwKBjUzP+7W8UJOi2BF
 96iwb240Xgci5QTDJ/DOtOdnhNhaB/vlJqhMQuezIYG8hhAZc3a35gTRUyS176RlsP
 w1IYx7sp/xn85ezKJ/0LrjtA1QPpXM6A6K++U6hEdR4HVwaB0vXI4q9JUzFGIjlpwk
 ZoiRxEDQBiCNQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bharata@linux.ibm.com
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
In-Reply-To: <20200722060506.GO7902@in.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
 <87r1tb1rw2.fsf@linux.ibm.com> <87tuy1sksv.fsf@mpe.ellerman.id.au>
 <20200721032959.GN7902@in.ibm.com> <87ft9lrr55.fsf@mpe.ellerman.id.au>
 <20200722060506.GO7902@in.ibm.com>
Date: Fri, 24 Jul 2020 21:52:14 +1000
Message-ID: <87mu3pp1u9.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:
> On Tue, Jul 21, 2020 at 10:25:58PM +1000, Michael Ellerman wrote:
>> Bharata B Rao <bharata@linux.ibm.com> writes:
>> > On Tue, Jul 21, 2020 at 11:45:20AM +1000, Michael Ellerman wrote:
>> >> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> >> > "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> >> >> This is the next version of the fixes for memory unplug on radix.
>> >> >> The issues and the fix are described in the actual patches.
>> >> >
>> >> > I guess this isn't actually causing problems at runtime right now, but I
>> >> > notice calls to resize_hpt_for_hotplug() from arch_add_memory() and
>> >> > arch_remove_memory(), which ought to be mmu-agnostic:
>> >> >
>> >> > int __ref arch_add_memory(int nid, u64 start, u64 size,
>> >> > 			  struct mhp_params *params)
>> >> > {
>> >> > 	unsigned long start_pfn = start >> PAGE_SHIFT;
>> >> > 	unsigned long nr_pages = size >> PAGE_SHIFT;
>> >> > 	int rc;
>> >> >
>> >> > 	resize_hpt_for_hotplug(memblock_phys_mem_size());
>> >> >
>> >> > 	start = (unsigned long)__va(start);
>> >> > 	rc = create_section_mapping(start, start + size, nid,
>> >> > 				    params->pgprot);
>> >> > ...
>> >> 
>> >> Hmm well spotted.
>> >> 
>> >> That does return early if the ops are not setup:
>> >> 
>> >> int resize_hpt_for_hotplug(unsigned long new_mem_size)
>> >> {
>> >> 	unsigned target_hpt_shift;
>> >> 
>> >> 	if (!mmu_hash_ops.resize_hpt)
>> >> 		return 0;
>> >> 
>> >> 
>> >> And:
>> >> 
>> >> void __init hpte_init_pseries(void)
>> >> {
>> >> 	...
>> >> 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
>> >> 		mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;
>> >> 
>> >> And that comes in via ibm,hypertas-functions:
>> >> 
>> >> 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
>> >> 
>> >> 
>> >> But firmware is not necessarily going to add/remove that call based on
>> >> whether we're using hash/radix.
>> >
>> > Correct but hpte_init_pseries() will not be called for radix guests.
>> 
>> Yeah, duh. You'd think the function name would have been a sufficient
>> clue for me :)
>> 
>> >> So I think a follow-up patch is needed to make this more robust.
>> >> 
>> >> Aneesh/Bharata what platform did you test this series on? I'm curious
>> >> how this didn't break.
>> >
>> > I have tested memory hotplug/unplug for radix guest on zz platform and
>> > sanity-tested this for hash guest on P8.
>> >
>> > As noted above, mmu_hash_ops.resize_hpt will not be set for radix
>> > guest and hence we won't see any breakage.
>> 
>> OK.
>> 
>> That's probably fine as it is then. Or maybe just a comment in
>> resize_hpt_for_hotplug() pointing out that resize_hpt will be NULL if
>> we're using radix.
>
> Or we could move these calls to hpt-only routines like below?

That looks like it would be equivalent, and would nicely isolate those
calls in hash specific code. So yeah I think that's worth sending as a
proper patch, even better if you can test it.

> David - Do you remember if there was any particular reason to have
> these two hpt-resize calls within powerpc-generic memory hotplug code?

I think the HPT resizing was developed before or concurrently with the
radix support, so I would guess it was just not something we thought
about at the time.

cheers

> diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
> index c89b32443cff..1e6fa371cc38 100644
> --- a/arch/powerpc/include/asm/sparsemem.h
> +++ b/arch/powerpc/include/asm/sparsemem.h
> @@ -17,12 +17,6 @@ extern int create_section_mapping(unsigned long start, unsigned long end,
>  				  int nid, pgprot_t prot);
>  extern int remove_section_mapping(unsigned long start, unsigned long end);
>  
> -#ifdef CONFIG_PPC_BOOK3S_64
> -extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
> -#else
> -static inline int resize_hpt_for_hotplug(unsigned long new_mem_size) { return 0; }
> -#endif
> -
>  #ifdef CONFIG_NUMA
>  extern int hot_add_scn_to_nid(unsigned long scn_addr);
>  #else
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index eec6f4e5e481..5daf53ec7600 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -787,7 +787,7 @@ static unsigned long __init htab_get_table_size(void)
>  }
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -int resize_hpt_for_hotplug(unsigned long new_mem_size)
> +static int resize_hpt_for_hotplug(unsigned long new_mem_size)
>  {
>  	unsigned target_hpt_shift;
>  
> @@ -821,6 +821,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
>  		return -1;
>  	}
>  
> +	resize_hpt_for_hotplug(memblock_phys_mem_size());
> +
>  	rc = htab_bolt_mapping(start, end, __pa(start),
>  			       pgprot_val(prot), mmu_linear_psize,
>  			       mmu_kernel_ssize);
> @@ -838,6 +840,10 @@ int hash__remove_section_mapping(unsigned long start, unsigned long end)
>  	int rc = htab_remove_mapping(start, end, mmu_linear_psize,
>  				     mmu_kernel_ssize);
>  	WARN_ON(rc < 0);
> +
> +	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
> +		pr_warn("Hash collision while resizing HPT\n");
> +
>  	return rc;
>  }
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index c2c11eb8dcfc..9dafc636588f 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -127,8 +127,6 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
>  	int rc;
>  
> -	resize_hpt_for_hotplug(memblock_phys_mem_size());
> -
>  	start = (unsigned long)__va(start);
>  	rc = create_section_mapping(start, start + size, nid,
>  				    params->pgprot);
> @@ -161,9 +159,6 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
>  	 * hit that section of memory
>  	 */
>  	vm_unmap_aliases();
> -
> -	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
> -		pr_warn("Hash collision while resizing HPT\n");
>  }
>  #endif
>  
> -- 
> 2.26.2
