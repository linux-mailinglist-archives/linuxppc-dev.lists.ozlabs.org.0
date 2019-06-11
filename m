Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9D3C3F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:30:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NKqV75S4zDqVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:29:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="OdWbQDWO"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NKnS1TX1zDqTR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:28:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45NKnL21w3z9v01D;
 Tue, 11 Jun 2019 08:28:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OdWbQDWO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I0XfYMZYnj09; Tue, 11 Jun 2019 08:28:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45NKnL0yfcz9v00y;
 Tue, 11 Jun 2019 08:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560234486; bh=NP+Agrn1OAyI0Ns0U/ifZeNqzBdhV2IDaWscEoINg6I=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=OdWbQDWOniZvyJna1wUdRp8nPOzhcHZNpF5VmUAxGV2HxAnBytiXMbH0UGjDnQjMS
 0paMQgP8aXigPCYP9rL5Tl2F+86Jl7YFDx0HhY2kO6z7eXegE5ZB+khIV7O/hrpv4x
 60p0Sr7u3acsdGaLJsNCLOUk9Aysy8BxjF890wqc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0AC708B7D4;
 Tue, 11 Jun 2019 08:28:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id u9l5BfALZqwZ; Tue, 11 Jun 2019 08:28:06 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 778EE8B75B;
 Tue, 11 Jun 2019 08:28:06 +0200 (CEST)
Subject: Re: [PATCH 1/3] powerpc/64: __ioremap_at clean up in the error case
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5d358284-c31c-5e01-240a-54b3491a8915@c-s.fr>
Date: Tue, 11 Jun 2019 08:28:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610030818.17965-1-npiggin@gmail.com>
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
> __ioremap_at error handling is wonky, it requires caller to clean up
> after it. Implement a helper that does the map and error cleanup and
> remove the requirement from the caller.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> This series is a different approach to the problem, using the generic
> ioremap_page_range directly which reduces added code, and moves
> the radix specific code into radix files. Thanks to Christophe for
> pointing out various problems with the previous patch.
> 
>   arch/powerpc/mm/pgtable_64.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
> index d2d976ff8a0e..6bd3660388aa 100644
> --- a/arch/powerpc/mm/pgtable_64.c
> +++ b/arch/powerpc/mm/pgtable_64.c
> @@ -108,14 +108,30 @@ unsigned long ioremap_bot;
>   unsigned long ioremap_bot = IOREMAP_BASE;
>   #endif
>   
> +static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < size; i += PAGE_SIZE) {
> +		int err = map_kernel_page(ea + i, pa + i, prot);

Missing a blank line

> +		if (err) {

I'd have done the following to reduce indentation depth

		if (!err)
			continue

> +			if (slab_is_available())
> +				unmap_kernel_range(ea, size);

Shouldn't it be unmap_kernel_range(ea, i) ?

Christophe

> +			else
> +				WARN_ON_ONCE(1); /* Should clean up */
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * __ioremap_at - Low level function to establish the page tables
>    *                for an IO mapping
>    */
>   void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
>   {
> -	unsigned long i;
> -
>   	/* We don't support the 4K PFN hack with ioremap */
>   	if (pgprot_val(prot) & H_PAGE_4K_PFN)
>   		return NULL;
> @@ -129,9 +145,8 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
>   	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
>   	WARN_ON(size & ~PAGE_MASK);
>   
> -	for (i = 0; i < size; i += PAGE_SIZE)
> -		if (map_kernel_page((unsigned long)ea + i, pa + i, prot))
> -			return NULL;
> +	if (ioremap_range((unsigned long)ea, pa, size, prot, NUMA_NO_NODE))
> +		return NULL;
>   
>   	return (void __iomem *)ea;
>   }
> @@ -182,8 +197,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
>   
>   		area->phys_addr = paligned;
>   		ret = __ioremap_at(paligned, area->addr, size, prot);
> -		if (!ret)
> -			vunmap(area->addr);
>   	} else {
>   		ret = __ioremap_at(paligned, (void *)ioremap_bot, size, prot);
>   		if (ret)
> 
