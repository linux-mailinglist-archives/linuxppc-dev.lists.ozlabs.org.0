Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B763C4A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 09:02:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NLY24wLxzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:02:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="VQ7g75zB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NLC12W4gzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:46:53 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45NLBx1Wqrz9v015;
 Tue, 11 Jun 2019 08:46:49 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VQ7g75zB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id f7OsxJbZeV2Z; Tue, 11 Jun 2019 08:46:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45NLBx0RTJz9v013;
 Tue, 11 Jun 2019 08:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560235609; bh=eKjPOj9Av/YD5HtBqv1DIO9AX8MVJPrAt8W4ynMJjw4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=VQ7g75zB2JeHIgMwEYUZIxyyq0cLCLHjG6kGvH0tjIP6mVlhmwx5MlRQUlLy33ryE
 uk94i82B5omHuhYvP0g2Z63osFM+SExv3RYdfnOynXx03TIx55y5Np7liK62kyGeWF
 +goAVytI6bOl2U+qxQKFCXBOoUG5JxZ3Mf/MsHQc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 00F318B7D8;
 Tue, 11 Jun 2019 08:46:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vaTIeEivx0dC; Tue, 11 Jun 2019 08:46:49 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 700038B75B;
 Tue, 11 Jun 2019 08:46:49 +0200 (CEST)
Subject: Re: [PATCH 2/3] powerpc/64s/radix: ioremap use ioremap_page_range
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <20190610030818.17965-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1a9a36aa-f2bb-1ce8-78d5-ddf24e336078@c-s.fr>
Date: Tue, 11 Jun 2019 08:46:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610030818.17965-2-npiggin@gmail.com>
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



Le 10/06/2019 à 05:08, Nicholas Piggin a écrit :
> Radix can use ioremap_page_range for ioremap, after slab is available.
> This makes it possible to enable huge ioremap mapping support.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/book3s/64/radix.h |  3 +++
>   arch/powerpc/mm/book3s64/pgtable.c         | 21 +++++++++++++++++++++
>   arch/powerpc/mm/book3s64/radix_pgtable.c   | 21 +++++++++++++++++++++
>   arch/powerpc/mm/pgtable_64.c               |  2 +-
>   4 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 574eca33f893..e04a839cb5b9 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -266,6 +266,9 @@ extern void radix__vmemmap_remove_mapping(unsigned long start,
>   extern int radix__map_kernel_page(unsigned long ea, unsigned long pa,
>   				 pgprot_t flags, unsigned int psz);
>   
> +extern int radix__ioremap_range(unsigned long ea, phys_addr_t pa,
> +				unsigned long size, pgprot_t prot, int nid);
> +

'extern' is pointless here, and checkpatch will cry.

>   static inline unsigned long radix__get_tree_size(void)
>   {
>   	unsigned long rts_field;
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index ff98b663c83e..953850a602f7 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -450,3 +450,24 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
>   
>   	return true;
>   }
> +
> +int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
> +{
> +	unsigned long i;
> +
> +	if (radix_enabled())
> +		return radix__ioremap_range(ea, pa, size, prot, nid);

This function looks pretty similar to the one in the previous patch.
Since radix_enabled() is available and return false for all other 
subarches, I think the above could go in the generic ioremap_range(), 
you'll only need to move the function declaration in a common file, for 
instance asm/io.h

> +
> +	for (i = 0; i < size; i += PAGE_SIZE) {
> +		int err = map_kernel_page(ea + i, pa + i, prot);
> +		if (err) {
> +			if (slab_is_available())
> +				unmap_kernel_range(ea, size);
> +			else
> +				WARN_ON_ONCE(1); /* Should clean up */
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index c9bcf428dd2b..db993bc1aef3 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -11,6 +11,7 @@
>   
>   #define pr_fmt(fmt) "radix-mmu: " fmt
>   
> +#include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/sched/mm.h>
>   #include <linux/memblock.h>
> @@ -1122,3 +1123,23 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
>   
>   	set_pte_at(mm, addr, ptep, pte);
>   }
> +
> +int radix__ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,
> +			pgprot_t prot, int nid)
> +{
> +	if (likely(slab_is_available())) {
> +		int err = ioremap_page_range(ea, ea + size, pa, prot);
> +		if (err)
> +			unmap_kernel_range(ea, size);
> +		return err;
> +	} else {
> +		unsigned long i;
> +
> +		for (i = 0; i < size; i += PAGE_SIZE) {
> +			int err = map_kernel_page(ea + i, pa + i, prot);
> +			if (WARN_ON_ONCE(err)) /* Should clean up */
> +				return err;
> +		}

Same loop again.

What about not doing a radix specific function and just putting 
something like below in the core ioremap_range() function ?

	if (likely(slab_is_available()) && radix_enabled()) {
		int err = ioremap_page_range(ea, ea + size, pa, prot);

		if (err)
			unmap_kernel_range(ea, size);
		return err;
	}

Because I'm pretty sure will more and more use ioremap_page_range().

> +		return 0;
> +	}
> +}
> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
> index 6bd3660388aa..63cd81130643 100644
> --- a/arch/powerpc/mm/pgtable_64.c
> +++ b/arch/powerpc/mm/pgtable_64.c
> @@ -108,7 +108,7 @@ unsigned long ioremap_bot;
>   unsigned long ioremap_bot = IOREMAP_BASE;
>   #endif
>   
> -static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
> +int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)

Hum. Weak functions remain in unused in vmlinux unless 
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is selected.

Also, they are some how dangerous because people might change them 
without seeing that it is overridden for some particular configuration.

Christophe

>   {
>   	unsigned long i;
>   
> 
