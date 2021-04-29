Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2836E464
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 07:04:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW3MM283Qz30DQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 15:04:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW3M22XRxz2xZ0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 15:04:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FW3Lx3YqYz9vDs;
 Thu, 29 Apr 2021 07:04:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRpeOGMYEeso; Thu, 29 Apr 2021 07:04:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FW3Lx2K7Yz9vDm;
 Thu, 29 Apr 2021 07:04:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96CD78B843;
 Thu, 29 Apr 2021 07:04:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TxEZKB0Ca0X7; Thu, 29 Apr 2021 07:04:09 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E906B8B765;
 Thu, 29 Apr 2021 07:04:08 +0200 (CEST)
Subject: Re: [PATCH v11 3/9] powerpc: Always define MODULES_{VADDR,END}
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210429031602.2606654-1-jniethe5@gmail.com>
 <20210429031602.2606654-4-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <111c8736-fff9-ba0a-4749-f9388b32c9bf@csgroup.eu>
Date: Thu, 29 Apr 2021 07:04:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429031602.2606654-4-jniethe5@gmail.com>
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



Le 29/04/2021 à 05:15, Jordan Niethe a écrit :
> If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
> VMALLOC_END respectively. This reduces the need for special cases. For
> example, powerpc's module_alloc() was previously predicated on
> MODULES_VADDR being defined but now is unconditionally defined.
> 
> This will be useful reducing conditional code in other places that need
> to allocate from the module region (i.e., kprobes).
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v10: New to series
> v11: - Consider more places MODULES_VADDR was being used
> ---
>   arch/powerpc/include/asm/pgtable.h    | 11 +++++++++++
>   arch/powerpc/kernel/module.c          |  5 +----
>   arch/powerpc/mm/kasan/kasan_init_32.c | 10 +++++-----
>   arch/powerpc/mm/ptdump/ptdump.c       |  4 ++--
>   4 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index c6a676714f04..882fda779648 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -39,6 +39,17 @@ struct mm_struct;
>   #define __S110	PAGE_SHARED_X
>   #define __S111	PAGE_SHARED_X
>   
> +#ifndef MODULES_VADDR
> +#define MODULES_VADDR VMALLOC_START
> +#define MODULES_END VMALLOC_END
> +#endif
> +
> +#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_STRICT_KERNEL_RWX)

No no.

TASK_SIZE > MODULES_VADDR is ALWAYS wrong, for any target, in any configuration.

Why is it a problem to leave the test as a BUILD_BUG_ON() in module_alloc() ?

> +#if TASK_SIZE > MODULES_VADDR
> +#error TASK_SIZE > MODULES_VADDR
> +#endif
> +#endif
> +
>   #ifndef __ASSEMBLY__
>   
>   /* Keep these as a macros to avoid include dependency mess */
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index fab84024650c..c60c7457ff47 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -15,6 +15,7 @@
>   #include <linux/sort.h>
>   #include <asm/setup.h>
>   #include <asm/sections.h>
> +#include <linux/mm.h>
>   
>   static LIST_HEAD(module_bug_list);
>   
> @@ -88,7 +89,6 @@ int module_finalize(const Elf_Ehdr *hdr,
>   	return 0;
>   }
>   
> -#ifdef MODULES_VADDR
>   static __always_inline void *
>   __module_alloc(unsigned long size, unsigned long start, unsigned long end)
>   {
> @@ -102,8 +102,6 @@ void *module_alloc(unsigned long size)
>   	unsigned long limit = (unsigned long)_etext - SZ_32M;
>   	void *ptr = NULL;
>   
> -	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> -
>   	/* First try within 32M limit from _etext to avoid branch trampolines */
>   	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
>   		ptr = __module_alloc(size, limit, MODULES_END);
> @@ -113,4 +111,3 @@ void *module_alloc(unsigned long size)
>   
>   	return ptr;
>   }
> -#endif
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
> index cf8770b1a692..42c057366ac7 100644
> --- a/arch/powerpc/mm/kasan/kasan_init_32.c
> +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> @@ -116,11 +116,11 @@ static void __init kasan_unmap_early_shadow_vmalloc(void)
>   
>   	kasan_update_early_region(k_start, k_end, __pte(0));
>   
> -#ifdef MODULES_VADDR
> -	k_start = (unsigned long)kasan_mem_to_shadow((void *)MODULES_VADDR);
> -	k_end = (unsigned long)kasan_mem_to_shadow((void *)MODULES_END);
> -	kasan_update_early_region(k_start, k_end, __pte(0));
> -#endif
> +	if (MODULES_VADDR != VMALLOC_START && MODULES_END != VMALLOC_END) {

Shouldn't it be an || ?

As soon as either MODULES_VADDR or MODULES_END differs from the vmalloc boundaries, it needs to be 
done I think.

> +		k_start = (unsigned long)kasan_mem_to_shadow((void *)MODULES_VADDR);
> +		k_end = (unsigned long)kasan_mem_to_shadow((void *)MODULES_END);
> +		kasan_update_early_region(k_start, k_end, __pte(0));
> +	}
>   }
>   
>   void __init kasan_mmu_init(void)
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index aca354fb670b..0431457f668f 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -73,7 +73,7 @@ struct addr_marker {
>   
>   static struct addr_marker address_markers[] = {
>   	{ 0,	"Start of kernel VM" },
> -#ifdef MODULES_VADDR
> +#if defined(CONFIG_BOOK32_32) && defined(CONFIG_STRICT_KERNEL_RWX)

Not valid anymore, see https://github.com/linuxppc/linux/commit/80edc68e0479 and 
https://github.com/linuxppc/linux/commit/9132a2e82adc

The best would be to be able to do something like:

#if MODULES_VADDR != VMALLOC_START

If it doesn't work, then it has to be

#if defined(CONFIG_BOOK32_32) || defined(CONFIG_PPC_8xx)

>   	{ 0,	"modules start" },
>   	{ 0,	"modules end" },
>   #endif
> @@ -359,7 +359,7 @@ static void populate_markers(void)
>   #else
>   	address_markers[i++].start_address = TASK_SIZE;
>   #endif
> -#ifdef MODULES_VADDR
> +#if defined(CONFIG_BOOK32_32) && defined(CONFIG_STRICT_KERNEL_RWX)

Same.

>   	address_markers[i++].start_address = MODULES_VADDR;
>   	address_markers[i++].start_address = MODULES_END;
>   #endif
> 
