Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79667360706
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 12:24:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLb6s3mC9z3bTt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 20:24:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLb6X2Djdz2yhx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 20:24:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FLb6P11KFz9vBmb;
 Thu, 15 Apr 2021 12:23:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UXyUUAwc-f7L; Thu, 15 Apr 2021 12:23:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FLb6P0B0nz9vBK7;
 Thu, 15 Apr 2021 12:23:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1299A8B7F6;
 Thu, 15 Apr 2021 12:23:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wlkDENXExdjy; Thu, 15 Apr 2021 12:23:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 46D9D8B7F2;
 Thu, 15 Apr 2021 12:23:57 +0200 (CEST)
Subject: Re: [PATCH v13 14/14] powerpc/64s/radix: Enable huge vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20210317062402.533919-1-npiggin@gmail.com>
 <20210317062402.533919-15-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a5c57276-737d-930b-670c-58dc0c815501@csgroup.eu>
Date: Thu, 15 Apr 2021 12:23:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210317062402.533919-15-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Ding Tianhong <dingtianhong@huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

Le 17/03/2021 à 07:24, Nicholas Piggin a écrit :
> This reduces TLB misses by nearly 30x on a `git diff` workload on a
> 2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
> to vfs hashes being allocated with 2MB pages.
> 
> Cc: linuxppc-dev@lists.ozlabs.org
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  2 ++
>   arch/powerpc/Kconfig                          |  1 +
>   arch/powerpc/kernel/module.c                  | 22 +++++++++++++++----
>   3 files changed, 21 insertions(+), 4 deletions(-)
> 
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
> @@ -87,13 +88,26 @@ int module_finalize(const Elf_Ehdr *hdr,
>   	return 0;
>   }
>   
> -#ifdef MODULES_VADDR
>   void *module_alloc(unsigned long size)
>   {
> +	unsigned long start = VMALLOC_START;
> +	unsigned long end = VMALLOC_END;
> +
> +#ifdef MODULES_VADDR
>   	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> +	start = MODULES_VADDR;
> +	end = MODULES_END;
> +#endif
> +
> +	/*
> +	 * Don't do huge page allocations for modules yet until more testing
> +	 * is done. STRICT_MODULE_RWX may require extra work to support this
> +	 * too.
> +	 */
>   
> -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
> -				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,


I think you should add the following in <asm/pgtable.h>

#ifndef MODULES_VADDR
#define MODULES_VADDR VMALLOC_START
#define MODULES_END VMALLOC_END
#endif

And leave module_alloc() as is (just removing the enclosing #ifdef MODULES_VADDR and adding the 
VM_NO_HUGE_VMAP  flag)

This would minimise the conflits with the changes I did in powerpc/next reported by Stephen R.

> +	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
> +				    PAGE_KERNEL_EXEC,
> +				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
> +				    NUMA_NO_NODE,
>   				    __builtin_return_address(0));
>   }
> -#endif
> 
