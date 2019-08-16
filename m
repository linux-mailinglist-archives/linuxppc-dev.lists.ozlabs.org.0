Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD73C8FD11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 10:06:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468wrL3wFZzDrMX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 18:06:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="FEQpuqzB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468wpJ66YKzDrM8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 18:04:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 468wpB2JnLz9tyXh;
 Fri, 16 Aug 2019 10:04:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FEQpuqzB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lA6E5j-wl7KL; Fri, 16 Aug 2019 10:04:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 468wpB18g7z9tyXf;
 Fri, 16 Aug 2019 10:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565942674; bh=IwjKUZFfoo6+PRRG4jenIhfB1rMdpLyzjhvMP8dxpr0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FEQpuqzBrSVbeKFBFK3dRok8Kmm2wsRcRJPMtfdKsxfbahPS7sr6PMMsWl2suPWGA
 Yu2x+G04O+sjac27nfrX3XV2zznq3SWOQr22f4N3r8WqLh3hr80tXr3bVPGcJG6UMI
 Gd9xxHOvnsFzfvNbpwctNnmfrjDPHOg4ZztFnpgw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F3288B776;
 Fri, 16 Aug 2019 10:04:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lzTZTjOCDTZS; Fri, 16 Aug 2019 10:04:35 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D22958B754;
 Fri, 16 Aug 2019 10:04:34 +0200 (CEST)
Subject: Re: [PATCH v4 3/3] x86/kasan: support KASAN_VMALLOC
To: Daniel Axtens <dja@axtens.net>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, aryabinin@virtuozzo.com,
 glider@google.com, luto@kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, dvyukov@google.com
References: <20190815001636.12235-1-dja@axtens.net>
 <20190815001636.12235-4-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d8d2d0ae-8ebc-d572-7a62-f17f28cb1bac@c-s.fr>
Date: Fri, 16 Aug 2019 10:04:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815001636.12235-4-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/08/2019 à 02:16, Daniel Axtens a écrit :
> In the case where KASAN directly allocates memory to back vmalloc
> space, don't map the early shadow page over it.

If early shadow page is not mapped, any bad memory access will Oops on 
the shadow access instead of Oopsing on the real bad access.

You should still map early shadow page, and replace it with real page 
when needed.

Christophe

> 
> We prepopulate pgds/p4ds for the range that would otherwise be empty.
> This is required to get it synced to hardware on boot, allowing the
> lower levels of the page tables to be filled dynamically.
> 
> Acked-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> 
> ---
> 
> v2: move from faulting in shadow pgds to prepopulating
> ---
>   arch/x86/Kconfig            |  1 +
>   arch/x86/mm/kasan_init_64.c | 61 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 222855cc0158..40562cc3771f 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -134,6 +134,7 @@ config X86
>   	select HAVE_ARCH_JUMP_LABEL
>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>   	select HAVE_ARCH_KASAN			if X86_64
> +	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
>   	select HAVE_ARCH_KGDB
>   	select HAVE_ARCH_MMAP_RND_BITS		if MMU
>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if MMU && COMPAT
> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
> index 296da58f3013..2f57c4ddff61 100644
> --- a/arch/x86/mm/kasan_init_64.c
> +++ b/arch/x86/mm/kasan_init_64.c
> @@ -245,6 +245,52 @@ static void __init kasan_map_early_shadow(pgd_t *pgd)
>   	} while (pgd++, addr = next, addr != end);
>   }
>   
> +static void __init kasan_shallow_populate_p4ds(pgd_t *pgd,
> +		unsigned long addr,
> +		unsigned long end,
> +		int nid)
> +{
> +	p4d_t *p4d;
> +	unsigned long next;
> +	void *p;
> +
> +	p4d = p4d_offset(pgd, addr);
> +	do {
> +		next = p4d_addr_end(addr, end);
> +
> +		if (p4d_none(*p4d)) {
> +			p = early_alloc(PAGE_SIZE, nid, true);
> +			p4d_populate(&init_mm, p4d, p);
> +		}
> +	} while (p4d++, addr = next, addr != end);
> +}
> +
> +static void __init kasan_shallow_populate_pgds(void *start, void *end)
> +{
> +	unsigned long addr, next;
> +	pgd_t *pgd;
> +	void *p;
> +	int nid = early_pfn_to_nid((unsigned long)start);
> +
> +	addr = (unsigned long)start;
> +	pgd = pgd_offset_k(addr);
> +	do {
> +		next = pgd_addr_end(addr, (unsigned long)end);
> +
> +		if (pgd_none(*pgd)) {
> +			p = early_alloc(PAGE_SIZE, nid, true);
> +			pgd_populate(&init_mm, pgd, p);
> +		}
> +
> +		/*
> +		 * we need to populate p4ds to be synced when running in
> +		 * four level mode - see sync_global_pgds_l4()
> +		 */
> +		kasan_shallow_populate_p4ds(pgd, addr, next, nid);
> +	} while (pgd++, addr = next, addr != (unsigned long)end);
> +}
> +
> +
>   #ifdef CONFIG_KASAN_INLINE
>   static int kasan_die_handler(struct notifier_block *self,
>   			     unsigned long val,
> @@ -352,9 +398,24 @@ void __init kasan_init(void)
>   	shadow_cpu_entry_end = (void *)round_up(
>   			(unsigned long)shadow_cpu_entry_end, PAGE_SIZE);
>   
> +	/*
> +	 * If we're in full vmalloc mode, don't back vmalloc space with early
> +	 * shadow pages. Instead, prepopulate pgds/p4ds so they are synced to
> +	 * the global table and we can populate the lower levels on demand.
> +	 */
> +#ifdef CONFIG_KASAN_VMALLOC
> +	kasan_shallow_populate_pgds(
> +		kasan_mem_to_shadow((void *)PAGE_OFFSET + MAXMEM),
> +		kasan_mem_to_shadow((void *)VMALLOC_END));
> +
> +	kasan_populate_early_shadow(
> +		kasan_mem_to_shadow((void *)VMALLOC_END + 1),
> +		shadow_cpu_entry_begin);
> +#else
>   	kasan_populate_early_shadow(
>   		kasan_mem_to_shadow((void *)PAGE_OFFSET + MAXMEM),
>   		shadow_cpu_entry_begin);
> +#endif
>   
>   	kasan_populate_shadow((unsigned long)shadow_cpu_entry_begin,
>   			      (unsigned long)shadow_cpu_entry_end, 0);
> 
