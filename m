Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9386D8B856A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 07:46:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NnsivhnX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTmKH1Z7Mz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 15:46:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NnsivhnX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTmJX11fnz3c3x
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 15:46:03 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ee1b203f30so2126588a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 22:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714542359; x=1715147159; darn=lists.ozlabs.org;
        h=in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GSmQ+rMoqUhYYCpL2R8O/o7ZIHYa0c47lts/YCI3Ris=;
        b=NnsivhnXvUJnj9LyWEVis83B6SjQpA6KjjFJHzpyaHZjSr0PV7uLb9SKmooVIbsQ0J
         cYAgbB1kXsAR2TZN5ALpAyRKPRqiaNfby09iFpZWNUMwrSiftMn5LrO5+glDdBVriUh2
         eDs4/wmXGtq7YztbjKCdOG92HpSGTZwU4oMKeoeMbcCOuyyScwgzWUn4xtopPM6KAxPe
         VoeKSNHWoWdsmCWGmdLG6kcNLN2am0wuhOAR5yDC7rfCX+fOZ5YfEfJq0R1yhNHzpjJY
         sCoPRV5U8WkiPpvFoK/BE/5NPvevu6LS3rSAHjzVbR+NxA+r4nddZg0cD93A7Oog/gC9
         hMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714542359; x=1715147159;
        h=in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSmQ+rMoqUhYYCpL2R8O/o7ZIHYa0c47lts/YCI3Ris=;
        b=R/ku2ch/Mgv8QfVi6JWVnI5i+tR/yrRF8Bkdk2ecU3ImJrJGfxbS4CGz9dkqikjuCf
         fOG6ZOw2b/miBs0wAlXP3LT/H4hV4yVGpZ1Ba6XllFGr2pE4GGepbI5hMcP6CChfDLam
         Jvo5Wz6UQjFYkUkhu8sQGefXFvquokyQibYKHC4R668eyR+VuaYx/zzFfMkZUtG3dgaa
         wzhHvR4hqiryRVlqVw5Hm+UZTNyKvaSKowscWsDROOPf5WlRdrPwxOYKrXENQCSDX/v5
         jFziLx50isakjlPtNsG6XBVAAymwyJlzv51TbxNaOgFtPlsmhrHcvDCGOgoGdWX/LvZN
         V7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX5O4wYMF8/hgjrUxm1R3IiZK4GN3s0BloYCtO2xEyyHEH/qRM0kxeW4xHlNJhSMPBzjGy2/lzb4so1AFR/QF55s8PPpn6u4vvbXuKF9A==
X-Gm-Message-State: AOJu0YwjSU3hqz0TDNfJcF1laST3DZMoBkuMPTvZ6yAWisIvt5XosVN1
	iz7QBez06GVLlGCHxzweQpvtTwrUsDk8ubxuy+oz7ZZ1elhncjuk
X-Google-Smtp-Source: AGHT+IH4p/X3V0HuUhhvtCebzFlZs6pwKyBVkXP+xon5EWCQvTIf0MNcCGsKl11dluF5znV2izGn7g==
X-Received: by 2002:a9d:7549:0:b0:6eb:7ce8:3e72 with SMTP id b9-20020a9d7549000000b006eb7ce83e72mr1655649otl.7.1714542359011;
        Tue, 30 Apr 2024 22:45:59 -0700 (PDT)
Received: from dw-tp ([171.76.84.250])
        by smtp.gmail.com with ESMTPSA id bq15-20020a056a02044f00b005f806498270sm17029090pgb.9.2024.04.30.22.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 22:45:58 -0700 (PDT)
Date: Wed, 01 May 2024 11:15:48 +0530
Message-Id: <87r0em3x0z.fsf@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] radix/kfence: map __kfence_pool at page granularity
In-Reply-To: <20240424110926.184077-1-hbathini@linux.ibm.com>
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
Cc: Marco Elver <elver@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Potapenko <glider@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:

> When KFENCE is enabled, total system memory is mapped at page level
> granularity. But in radix MMU mode, ~3GB additional memory is needed
> to map 100GB of system memory at page level granularity when compared
> to using 2MB direct mapping. This is not desired considering KFENCE is
> designed to be enabled in production kernels [1]. Also, mapping memory
> allocated for KFENCE pool at page granularity seems sufficient enough
> to enable KFENCE support. So, allocate __kfence_pool during bootup and
> map it at page granularity instead of mapping all system memory at
> page granularity.
>
> Without patch:
>     # cat /proc/meminfo
>     MemTotal:       101201920 kB
>
> With patch:
>     # cat /proc/meminfo
>     MemTotal:       104483904 kB
>
> All kfence_test.c testcases passed with this patch.
>
> [1] https://lore.kernel.org/all/20201103175841.3495947-2-elver@google.com/
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kfence.h        |  5 ++++
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 34 ++++++++++++++++++------
>  arch/powerpc/mm/init_64.c                | 14 ++++++++++

New at this. But the patch looked interesting, hence my review comments.

>  3 files changed, 45 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
> index 424ceef82ae6..18ec2b06ba1e 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -8,6 +8,7 @@
>  #ifndef __ASM_POWERPC_KFENCE_H
>  #define __ASM_POWERPC_KFENCE_H
>  
> +#include <linux/kfence.h>
>  #include <linux/mm.h>
>  #include <asm/pgtable.h>
>  
> @@ -15,6 +16,10 @@
>  #define ARCH_FUNC_PREFIX "."
>  #endif
>  
> +#ifdef CONFIG_KFENCE
> +extern bool kfence_early_init;
> +#endif
> +
>  static inline bool arch_kfence_init_pool(void)
>  {
>  	return true;

Shouldn't we return false for !kfence_early_init?
Because otherwise, this patch may break the late init case which your
next patch is fixing, and maybe git bisect will break?


> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 15e88f1439ec..fccbf92f279b 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -31,6 +31,7 @@
>  #include <asm/uaccess.h>
>  #include <asm/ultravisor.h>
>  #include <asm/set_memory.h>
> +#include <asm/kfence.h>
>  
>  #include <trace/events/thp.h>
>  
> @@ -291,9 +292,8 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
>  	return end;
>  }
>  
> -static int __meminit create_physical_mapping(unsigned long start,
> -					     unsigned long end,
> -					     int nid, pgprot_t _prot)
> +static int __meminit create_physical_mapping(unsigned long start, unsigned long end, int nid,
> +					     pgprot_t _prot, unsigned long mapping_sz_limit)

lines over 80 chars.

>  {
>  	unsigned long vaddr, addr, mapping_size = 0;
>  	bool prev_exec, exec = false;
> @@ -301,7 +301,10 @@ static int __meminit create_physical_mapping(unsigned long start,
>  	int psize;
>  	unsigned long max_mapping_size = memory_block_size;
>  
> -	if (debug_pagealloc_enabled_or_kfence())
> +	if (mapping_sz_limit < max_mapping_size)
> +		max_mapping_size = mapping_sz_limit;
> +
> +	if (debug_pagealloc_enabled())
>  		max_mapping_size = PAGE_SIZE;
>  
>  	start = ALIGN(start, PAGE_SIZE);
> @@ -358,6 +361,7 @@ static int __meminit create_physical_mapping(unsigned long start,
>  
>  static void __init radix_init_pgtable(void)
>  {
> +	phys_addr_t kfence_pool __maybe_unused;
>  	unsigned long rts_field;
>  	phys_addr_t start, end;
>  	u64 i;
> @@ -365,6 +369,13 @@ static void __init radix_init_pgtable(void)
>  	/* We don't support slb for radix */
>  	slb_set_size(0);
>  
> +#ifdef CONFIG_KFENCE
> +	if (kfence_early_init) {
> +		kfence_pool = memblock_phys_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);

What if memblock_phys_alloc() failed? error handling?
> +		memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
> +	}
> +#endif
> +

Instead of #ifdef CONFIG_KFENCE in the function,
maybe we can define radix_kfence_alloc_pool()? Then we won't need
__maybe_unused too.

>  	/*
>  	 * Create the linear mapping
>  	 */
> @@ -380,10 +391,18 @@ static void __init radix_init_pgtable(void)
>  			continue;
>  		}
>  
> -		WARN_ON(create_physical_mapping(start, end,
> -						-1, PAGE_KERNEL));
> +		WARN_ON(create_physical_mapping(start, end, -1, PAGE_KERNEL, ~0UL));
>  	}
>  
> +#ifdef CONFIG_KFENCE
> +	if (kfence_early_init) {
> +		create_physical_mapping(kfence_pool, kfence_pool + KFENCE_POOL_SIZE, -1,
> +					PAGE_KERNEL, PAGE_SIZE);

Even this can return an error. Maybe WARN_ON_ONCE()? or disabling kfence
for an error?

> +		memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
> +		__kfence_pool = __va(kfence_pool);
> +	}
> +#endif
> +

This #ifdef can be called as radix_kfence_map_pool() then?


>  	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
>  			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
>  		/*
> @@ -874,8 +893,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
>  		return -1;
>  	}
>  
> -	return create_physical_mapping(__pa(start), __pa(end),
> -				       nid, prot);
> +	return create_physical_mapping(__pa(start), __pa(end), nid, prot, ~0UL);
>  }
>  
>  int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index d96bbc001e73..8155bfd6c16b 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -64,6 +64,20 @@
>  
>  #include <mm/mmu_decl.h>
>  
> +#ifdef CONFIG_KFENCE
> +bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
> +
> +static int __init parse_kfence_early_init(char *arg)
> +{
> +	int val;
> +
> +	if (get_option(&arg, &val))
> +		kfence_early_init = !!val;
> +	return 0;
> +}
> +early_param("kfence.sample_interval", parse_kfence_early_init);
> +#endif
> +
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP
>  /*
>   * Given an address within the vmemmap, determine the page that
> -- 
> 2.44.0
