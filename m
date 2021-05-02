Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C5370AB8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 09:35:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXyZ26YKbz30CL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 17:35:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXyYc2xDVz2xYk
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 17:34:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FXyYR0Tcbz9sSg;
 Sun,  2 May 2021 09:34:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkPdFyBnIYvX; Sun,  2 May 2021 09:34:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FXyYQ6Md6z9sSf;
 Sun,  2 May 2021 09:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CD208B771;
 Sun,  2 May 2021 09:34:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MO1bULbEkRVi; Sun,  2 May 2021 09:34:50 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF8E68B763;
 Sun,  2 May 2021 09:34:49 +0200 (CEST)
Subject: Re: [PATCH] powerpc/64s/radix: Enable huge vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210502045615.237268-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <60e4f5d6-67ae-42a9-5edd-bed2dfde2eb3@csgroup.eu>
Date: Sun, 2 May 2021 09:34:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502045615.237268-1-npiggin@gmail.com>
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



Le 02/05/2021 à 06:56, Nicholas Piggin a écrit :
> This reduces TLB misses by nearly 30x on a `git diff` workload on a
> 2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
> to vfs hashes being allocated with 2MB pages.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This was in the -mm tree but was dropped at the last minute after
> clashing with a patch in powerpc next.
> 
> Now all prerequisites are upstream, this can be merged as is. Probably
> makes sense now to go via powerpc tree.
> 
> This is rebased and retested on upstream.
> 
>   Documentation/admin-guide/kernel-parameters.txt |  2 ++
>   arch/powerpc/Kconfig                            |  1 +
>   arch/powerpc/include/asm/pgtable.h              |  5 +++++
>   arch/powerpc/kernel/module.c                    | 16 +++++++++++++---
>   4 files changed, 21 insertions(+), 3 deletions(-)
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
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index c6a676714f04..1678e4b08fc3 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -39,6 +39,11 @@ struct mm_struct;
>   #define __S110	PAGE_SHARED_X
>   #define __S111	PAGE_SHARED_X
>   
> +#ifndef MODULES_VADDR
> +#define MODULES_VADDR	VMALLOC_START
> +#define MODULES_END	VMALLOC_END
> +#endif

This will also require some changes in a few places, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210429031602.2606654-4-jniethe5@gmail.com/

> +
>   #ifndef __ASSEMBLY__
>   
>   /* Keep these as a macros to avoid include dependency mess */
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index fab84024650c..77aefcbbd276 100644
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
> @@ -88,17 +89,24 @@ int module_finalize(const Elf_Ehdr *hdr,
>   	return 0;
>   }
>   
> -#ifdef MODULES_VADDR
>   static __always_inline void *
>   __module_alloc(unsigned long size, unsigned long start, unsigned long end)
>   {
> +	/*
> +	 * Don't do huge page allocations for modules yet until more testing
> +	 * is done. STRICT_MODULE_RWX may require extra work to support this
> +	 * too.
> +	 */
>   	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
> -				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> +				    PAGE_KERNEL_EXEC,
> +				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
> +				    NUMA_NO_NODE,
>   				    __builtin_return_address(0));

Can we avoid so many lines ? Doesn't it fit on 3 lines now that 100 chars per line are tolerated ?

>   }
>   
>   void *module_alloc(unsigned long size)
>   {
> +#ifdef CONFIG_PPC32

Can we just add an IS_ENABLED(CONFIG_PPC32) in the 'if' instead of this #ifdef/#else ?

>   	unsigned long limit = (unsigned long)_etext - SZ_32M;
>   	void *ptr = NULL;
>   
> @@ -112,5 +120,7 @@ void *module_alloc(unsigned long size)
>   		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
>   
>   	return ptr;
> -}
> +#else
> +	return __module_alloc(size, MODULES_VADDR, MODULES_END);
>   #endif
> +}
> 
