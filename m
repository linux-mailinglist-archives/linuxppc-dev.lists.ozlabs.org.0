Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E529382477
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 08:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk8bC6VJ5z30D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:38:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk8Zs2pXqz2xtr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:37:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fk8Zl3qFqz9sYq;
 Mon, 17 May 2021 08:37:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3pCbAgC_8q6; Mon, 17 May 2021 08:37:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fk8Zl2qX1z9sYN;
 Mon, 17 May 2021 08:37:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 44B5C8B784;
 Mon, 17 May 2021 08:37:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oDG8ORIn4yZo; Mon, 17 May 2021 08:37:51 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0575E8B783;
 Mon, 17 May 2021 08:37:51 +0200 (CEST)
Subject: Re: [PATCH v14 3/9] powerpc/modules: Make module_alloc() Strict
 Module RWX aware
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210517032810.129949-1-jniethe5@gmail.com>
 <20210517032810.129949-4-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <04311ba7-8b91-6837-2bc5-1f55f49da253@csgroup.eu>
Date: Mon, 17 May 2021 08:36:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517032810.129949-4-jniethe5@gmail.com>
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



Le 17/05/2021 à 05:28, Jordan Niethe a écrit :
> Make module_alloc() use PAGE_KERNEL protections instead of
> PAGE_KERNEL_EXEX if Strict Module RWX is enabled.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v14: - Split out from powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
>       - Add and use strict_module_rwx_enabled() helper
> ---
>   arch/powerpc/include/asm/mmu.h | 5 +++++
>   arch/powerpc/kernel/module.c   | 4 +++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 607168b1aef4..7710bf0cbf8a 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -357,6 +357,11 @@ static inline bool strict_kernel_rwx_enabled(void)
>   	return false;
>   }
>   #endif
> +
> +static inline bool strict_module_rwx_enabled(void)
> +{
> +	return IS_ENABLED(CONFIG_STRICT_MODULE_RWX) && strict_kernel_rwx_enabled();
> +}

Looking at arch/Kconfig, I have the feeling that it is possible to select CONFIG_STRICT_MODULE_RWX 
without selecting CONFIG_STRICT_KERNEL_RWX.

In that case, strict_kernel_rwx_enabled() will return false.

>   #endif /* !__ASSEMBLY__ */
>   
>   /* The kernel use the constants below to index in the page sizes array.
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index 3f35c8d20be7..ed04a3ba66fe 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
>   static __always_inline void *
>   __module_alloc(unsigned long size, unsigned long start, unsigned long end)
>   {
> +	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
> +
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
