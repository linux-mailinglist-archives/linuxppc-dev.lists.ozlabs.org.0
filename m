Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 605591ECA13
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 09:03:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cKcs5SGhzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 17:03:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cKZQ1T8qzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 17:01:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49cKZG5GGYz9v6Nc;
 Wed,  3 Jun 2020 09:01:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id paDA8QXXr0ZU; Wed,  3 Jun 2020 09:01:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49cKZG4TLCz9v6NZ;
 Wed,  3 Jun 2020 09:01:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DCAFF8B87E;
 Wed,  3 Jun 2020 09:01:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5KD_G84QwOrX; Wed,  3 Jun 2020 09:01:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 90AB48B76A;
 Wed,  3 Jun 2020 09:01:11 +0200 (CEST)
Subject: Re: [PATCH 2/5] powerpc/lib: Initialize a temporary mm for code
 patching
To: "Christopher M. Riedl" <cmr@informatik.wtf>,
 linuxppc-dev@lists.ozlabs.org, kernel-hardening@lists.openwall.com
References: <20200603051912.23296-1-cmr@informatik.wtf>
 <20200603051912.23296-3-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4ffced42-ee3a-841f-2d3f-34daec11b05b@csgroup.eu>
Date: Wed, 3 Jun 2020 09:01:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603051912.23296-3-cmr@informatik.wtf>
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



Le 03/06/2020 à 07:19, Christopher M. Riedl a écrit :
> When code patching a STRICT_KERNEL_RWX kernel the page containing the
> address to be patched is temporarily mapped with permissive memory
> protections. Currently, a per-cpu vmalloc patch area is used for this
> purpose. While the patch area is per-cpu, the temporary page mapping is
> inserted into the kernel page tables for the duration of the patching.
> The mapping is exposed to CPUs other than the patching CPU - this is
> undesirable from a hardening perspective.
> 
> Use the `poking_init` init hook to prepare a temporary mm and patching
> address. Initialize the temporary mm by copying the init mm. Choose a
> randomized patching address inside the temporary mm userspace address
> portion. The next patch uses the temporary mm and patching address for
> code patching.
> 
> Based on x86 implementation:
> 
> commit 4fc19708b165
> ("x86/alternatives: Initialize temporary mm for patching")
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>   arch/powerpc/lib/code-patching.c | 33 ++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 5ecf0d635a8d..599114f63b44 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -11,6 +11,8 @@
>   #include <linux/cpuhotplug.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
> +#include <linux/sched/task.h>
> +#include <linux/random.h>
>   
>   #include <asm/pgtable.h>
>   #include <asm/tlbflush.h>
> @@ -45,6 +47,37 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
>   }
>   
>   #ifdef CONFIG_STRICT_KERNEL_RWX
> +
> +static struct mm_struct *patching_mm __ro_after_init;
> +static unsigned long patching_addr __ro_after_init;
> +
> +void __init poking_init(void)
> +{
> +	spinlock_t *ptl; /* for protecting pte table */
> +	pte_t *ptep;
> +
> +	/*
> +	 * Some parts of the kernel (static keys for example) depend on
> +	 * successful code patching. Code patching under STRICT_KERNEL_RWX
> +	 * requires this setup - otherwise we cannot patch at all. We use
> +	 * BUG_ON() here and later since an early failure is preferred to
> +	 * buggy behavior and/or strange crashes later.
> +	 */
> +	patching_mm = copy_init_mm();
> +	BUG_ON(!patching_mm);
> +
> +	/*
> +	 * In hash we cannot go above DEFAULT_MAP_WINDOW easily.
> +	 * XXX: Do we want additional bits of entropy for radix?
> +	 */
> +	patching_addr = (get_random_long() & PAGE_MASK) %
> +		(DEFAULT_MAP_WINDOW - PAGE_SIZE);
> +
> +	ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
> +	BUG_ON(!ptep);
> +	pte_unmap_unlock(ptep, ptl);

Is this needed ? What's the point in getting the pte to unmap it 
immediatly without doing anything with it ?

Christophe

> +}
> +
>   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
>   
>   static int text_area_cpu_up(unsigned int cpu)
> 
