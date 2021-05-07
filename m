Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C17F375FBC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 07:36:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbzgy3TK3z301q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 15:35:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbzgb25FKz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 15:35:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FbzgX14lSz9sYh;
 Fri,  7 May 2021 07:35:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvkRo4fEyAhD; Fri,  7 May 2021 07:35:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FbzgX05Trz9sYd;
 Fri,  7 May 2021 07:35:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D29EA8B812;
 Fri,  7 May 2021 07:35:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TWxeGLop58Vr; Fri,  7 May 2021 07:35:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF4D68B764;
 Fri,  7 May 2021 07:35:34 +0200 (CEST)
Subject: Re: [PATCH v12 6/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210506023449.3568630-1-jniethe5@gmail.com>
 <20210506023449.3568630-7-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3a1eef8c-a982-5321-bb1a-7a4ebe73f1d2@csgroup.eu>
Date: Fri, 7 May 2021 07:35:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506023449.3568630-7-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, cmr@codefail.de,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2021 à 04:34, Jordan Niethe a écrit :
> From: Russell Currey <ruscur@russell.cc>
> 
> To enable strict module RWX on powerpc, set:
> 
>      CONFIG_STRICT_MODULE_RWX=y
> 
> You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
> security benefit.
> 
> ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
> This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
> makes STRICT_MODULE_RWX *on by default* in configurations where
> STRICT_KERNEL_RWX is *unavailable*.
> 
> Since this doesn't make much sense, and module RWX without kernel RWX
> doesn't make much sense, having the same dependencies as kernel RWX
> works around this problem.
> 
> With STRICT_MODULE_RWX, now make module_alloc() allocate pages with
> KERNEL_PAGE protection rather than KERNEL_PAGE_EXEC.
> 
> Book32s/32 processors with a hash mmu (i.e. 604 core) can not set memory
> protection on a page by page basis so do not enable.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> [jpn: - predicate on !PPC_BOOK3S_604
>        - make module_alloc() use PAGE_KERNEL protection]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v10: - Predicate on !PPC_BOOK3S_604
>       - Make module_alloc() use PAGE_KERNEL protection
> v11: - Neaten up
> ---
>   arch/powerpc/Kconfig         | 1 +
>   arch/powerpc/kernel/module.c | 4 +++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index cce0a137b046..cb5d9d862c35 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -140,6 +140,7 @@ config PPC
>   	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>   	select ARCH_HAS_SET_MEMORY
>   	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
> +	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_604
>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UACCESS_FLUSHCACHE
>   	select ARCH_HAS_COPY_MC			if PPC64
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index 3f35c8d20be7..33e4011228b0 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
>   static __always_inline void *
>   __module_alloc(unsigned long size, unsigned long start, unsigned long end)
>   {
> +	pgprot_t prot = IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ? PAGE_KERNEL :
> +							       PAGE_KERNEL_EXEC;

I'm not sure this test is OK, because strict kernel/module rwx can be disabled at boottime.
There is a global variable 'rodata_enabled' to reflect that.

We have a helper in powerpc asm/mmu.h called strict_kernel_rwx_enabled() to check it.


>   	/*
>   	 * Don't do huge page allocations for modules yet until more testing
>   	 * is done. STRICT_MODULE_RWX may require extra work to support this
>   	 * too.
>   	 */
> -	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, PAGE_KERNEL_EXEC,
> +	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, prot,
>   				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
>   				    NUMA_NO_NODE, __builtin_return_address(0));
>   }
> 
