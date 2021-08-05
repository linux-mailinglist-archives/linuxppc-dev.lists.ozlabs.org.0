Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A016F3E116B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNkB3Vr2z3cWV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:34:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgNjh3Wk2z3d76
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:34:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgNjZ5kr3z9sWG;
 Thu,  5 Aug 2021 11:34:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLFCP15Z8Qrl; Thu,  5 Aug 2021 11:34:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgNjZ4hSBz9sWW;
 Thu,  5 Aug 2021 11:34:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 851A48B7BD;
 Thu,  5 Aug 2021 11:34:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id liNPilBVWVym; Thu,  5 Aug 2021 11:34:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D96588B7C2;
 Thu,  5 Aug 2021 11:34:25 +0200 (CEST)
Subject: Re: [PATCH v5 6/8] powerpc: Rework and improve STRICT_KERNEL_RWX
 patching
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-7-cmr@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9c53e997-3609-20f8-74c0-7776c867ce6c@csgroup.eu>
Date: Thu, 5 Aug 2021 11:34:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713053113.4632-7-cmr@linux.ibm.com>
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/07/2021 à 07:31, Christopher M. Riedl a écrit :
> Rework code-patching with STRICT_KERNEL_RWX to prepare for the next
> patch which uses a temporary mm for patching under the Book3s64 Radix
> MMU. Make improvements by adding a WARN_ON when the patchsite doesn't
> match after patching and return the error from __patch_instruction()
> properly.
> 
> Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> 
> ---
> 
> v5:  * New to series.
> ---
>   arch/powerpc/lib/code-patching.c | 51 +++++++++++++++++---------------
>   1 file changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 3122d8e4cc013..9f2eba9b70ee4 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -102,11 +102,12 @@ static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
>   }
>   
>   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> +static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
>   
>   #if IS_BUILTIN(CONFIG_LKDTM)
>   unsigned long read_cpu_patching_addr(unsigned int cpu)
>   {
> -	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
> +	return per_cpu(cpu_patching_addr, cpu);
>   }
>   #endif
>   
> @@ -121,6 +122,7 @@ static int text_area_cpu_up(unsigned int cpu)
>   		return -1;
>   	}
>   	this_cpu_write(text_poke_area, area);
> +	this_cpu_write(cpu_patching_addr, (unsigned long)area->addr);
>   
>   	return 0;
>   }
> @@ -146,7 +148,7 @@ void __init poking_init(void)
>   /*
>    * This can be called for kernel text or a module.
>    */
> -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> +static int map_patch_area(void *addr)
>   {
>   	unsigned long pfn;
>   	int err;
> @@ -156,17 +158,20 @@ static int map_patch_area(void *addr, unsigned long text_poke_addr)
>   	else
>   		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
>   
> -	err = map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
> +	err = map_kernel_page(__this_cpu_read(cpu_patching_addr),
> +			      (pfn << PAGE_SHIFT), PAGE_KERNEL);
>   
> -	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err);
> +	pr_devel("Mapped addr %lx with pfn %lx:%d\n",
> +		 __this_cpu_read(cpu_patching_addr), pfn, err);
>   	if (err)
>   		return -1;
>   
>   	return 0;
>   }
>   
> -static inline int unmap_patch_area(unsigned long addr)
> +static inline int unmap_patch_area(void)
>   {
> +	unsigned long addr = __this_cpu_read(cpu_patching_addr);
>   	pte_t *ptep;
>   	pmd_t *pmdp;
>   	pud_t *pudp;
> @@ -175,23 +180,23 @@ static inline int unmap_patch_area(unsigned long addr)
>   
>   	pgdp = pgd_offset_k(addr);
>   	if (unlikely(!pgdp))
> -		return -EINVAL;
> +		goto out_err;
>   
>   	p4dp = p4d_offset(pgdp, addr);
>   	if (unlikely(!p4dp))
> -		return -EINVAL;
> +		goto out_err;
>   
>   	pudp = pud_offset(p4dp, addr);
>   	if (unlikely(!pudp))
> -		return -EINVAL;
> +		goto out_err;
>   
>   	pmdp = pmd_offset(pudp, addr);
>   	if (unlikely(!pmdp))
> -		return -EINVAL;
> +		goto out_err;
>   
>   	ptep = pte_offset_kernel(pmdp, addr);
>   	if (unlikely(!ptep))
> -		return -EINVAL;
> +		goto out_err;
>   
>   	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
>   
> @@ -202,15 +207,17 @@ static inline int unmap_patch_area(unsigned long addr)
>   	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>   
>   	return 0;
> +
> +out_err:
> +	pr_warn("failed to unmap %lx\n", addr);
> +	return -EINVAL;

Can you keep that in the caller of unmap_patch_area() instead of all those goto stuff ?

>   }
>   
>   static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
>   {
> -	int err;
> +	int err, rc = 0;
>   	u32 *patch_addr = NULL;
>   	unsigned long flags;
> -	unsigned long text_poke_addr;
> -	unsigned long kaddr = (unsigned long)addr;
>   
>   	/*
>   	 * During early early boot patch_instruction is called
> @@ -222,24 +229,20 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
>   
>   	local_irq_save(flags);
>   
> -	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
> -	if (map_patch_area(addr, text_poke_addr)) {
> -		err = -1;
> +	err = map_patch_area(addr);
> +	if (err)
>   		goto out;
> -	}
> -
> -	patch_addr = (u32 *)(text_poke_addr + (kaddr & ~PAGE_MASK));
>   
> -	__patch_instruction(addr, instr, patch_addr);
> +	patch_addr = (u32 *)(__this_cpu_read(cpu_patching_addr) | offset_in_page(addr));
> +	rc = __patch_instruction(addr, instr, patch_addr);
>   
> -	err = unmap_patch_area(text_poke_addr);
> -	if (err)
> -		pr_warn("failed to unmap %lx\n", text_poke_addr);
> +	err = unmap_patch_area();
>   
>   out:
>   	local_irq_restore(flags);
> +	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));

Why adding that WARN_ON(), what could make that happen that is worth a WARN_ON() ?

Patching is quite a critical fast path, I'm not sure we want to afford too many checks during 
patching, we want it quick at first.

>   
> -	return err;
> +	return rc ? rc : err;
>   }
>   #else /* !CONFIG_STRICT_KERNEL_RWX */
>   
> 
