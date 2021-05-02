Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F4A370E21
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 19:11:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYCMB6gTpz30HJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 03:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYCLs25lnz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 03:11:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FYCLk1tGfz9sSs;
 Sun,  2 May 2021 19:11:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_yajt1UMUz2; Sun,  2 May 2021 19:11:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FYCLk0h4nz9sSr;
 Sun,  2 May 2021 19:11:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D8AF48B771;
 Sun,  2 May 2021 19:11:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ehq1brbKQUpm; Sun,  2 May 2021 19:11:25 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 61B608B763;
 Sun,  2 May 2021 19:11:25 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/64s/radix: Enable huge vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210502110050.324953-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5d2548a4-876e-ac11-87f5-b8a2e8a04232@csgroup.eu>
Date: Sun, 2 May 2021 19:11:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502110050.324953-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/05/2021 à 13:00, Nicholas Piggin a écrit :
> This reduces TLB misses by nearly 30x on a `git diff` workload on a
> 2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
> to vfs hashes being allocated with 2MB pages.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v1:
> - Don't define MODULES_VADDR which has some other side effect (e.g.,
>    ptdump).
> - Fixed (hopefully) kbuild warning.
> - Keep __vmalloc_node_range call on 3 lines.
> 
>   .../admin-guide/kernel-parameters.txt          |  2 ++
>   arch/powerpc/Kconfig                           |  1 +
>   arch/powerpc/kernel/module.c                   | 18 +++++++++++++-----
>   3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1c0a3cf6fcc9..1be38b25c485 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3250,6 +3250,8 @@
>   
>   	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
>   
> +	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
> +
>   	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
>   			Equivalent to smt=1.
>   
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1e6230bea09d..c547a9d6a2dd 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -185,6 +185,7 @@ config PPC
>   	select GENERIC_VDSO_TIME_NS
>   	select HAVE_ARCH_AUDITSYSCALL
>   	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
> +	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
>   	select HAVE_ARCH_JUMP_LABEL
>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index fab84024650c..ea1fa55a6897 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -8,6 +8,7 @@
>   #include <linux/moduleloader.h>
>   #include <linux/err.h>
>   #include <linux/vmalloc.h>
> +#include <linux/mm.h>
>   #include <linux/bug.h>
>   #include <asm/module.h>
>   #include <linux/uaccess.h>
> @@ -88,17 +89,22 @@ int module_finalize(const Elf_Ehdr *hdr,
>   	return 0;
>   }
>   
> -#ifdef MODULES_VADDR
>   static __always_inline void *
>   __module_alloc(unsigned long size, unsigned long start, unsigned long end)
>   {
> -	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
> -				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> -				    __builtin_return_address(0));
> +	/*
> +	 * Don't do huge page allocations for modules yet until more testing
> +	 * is done. STRICT_MODULE_RWX may require extra work to support this
> +	 * too.
> +	 */
> +	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, PAGE_KERNEL_EXEC,
> +				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
> +				    NUMA_NO_NODE, __builtin_return_address(0));
>   }
>   
>   void *module_alloc(unsigned long size)
>   {
> +#ifdef CONFIG_PPC32

What then happens to PPC32 platforms that doesn't define MODULES_VADDR, for instance 4xx or booke ?

I think it should be:

#ifdef MODULES_VADDR

>   	unsigned long limit = (unsigned long)_etext - SZ_32M;
>   	void *ptr = NULL;
>   
> @@ -112,5 +118,7 @@ void *module_alloc(unsigned long size)
>   		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
>   
>   	return ptr;
> -}
> +#else
> +	return __module_alloc(size, VMALLOC_START, VMALLOC_END);
>   #endif
> +}
> 
