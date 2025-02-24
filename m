Return-Path: <linuxppc-dev+bounces-6420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 442AFA4205A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hDQ6SbSz3041;
	Tue, 25 Feb 2025 00:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740403206;
	cv=none; b=WdcOIRu8JObfSyD5oYS8GhlMYgdRT+/qZ8GqPFUS0Lj/HuhF29XpqNu9Rw21CtP30oKxFqgngYNWMqNHpbdee/fgcNKola4IOpasdHe41RqyH247moJNVQoD/BWb//7a04I3tHt+Gaz/ndNiBTNrhfGoCYPm1QtVtJ0N5MzJPzSxrk7FKP/TxX0ok4GlEOHk+Z2t9R/LgXV5VadkQ8t9g7qvq0u2U6pMClYcAwEWC1Wn/d3fSQ0onA/gGY8R+HnR8YkYV9MCuyOExgZDMTCCZbtkseNLHhc9JxZkbGRevtvLy58RRf7u5UprqS0rDCCNmUjlr/udfUI9vsN1MvYUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740403206; c=relaxed/relaxed;
	bh=b2y2730+h5olY2zTaKSJ67hSsFoYftDZKsP50Yz3aC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtaitZnNkalbGkhl592JJUKybYVbZRmGD9wStvYC50Res4DzMUjFKxwB7tzTPc+9nWM3MbqleYm9prbxLiPEpEk7gC3HX7S5LBnwZslN59LkG3rvtB1cAijhILPCZAYIzCWuFWsvpvvxuW4HRHektD/kjp9fKwl1PXm2l6Ye006/+WxyIwW32iQuBF9PdCVSqRCFtzRoYA3aC8e2wCRSan2EuWHTdNchWvWb7mEEorSo89+hgduajEKO0/JfCdkAT7apQmN4pte8cD11/De9L02fB107rqqhOMn3Lrcf1K19Q4c7ierG3Fn8Vmwu1T9ZtDQy3yw/KNyIJAAUbfBc5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hDQ0j5Mz303d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1gjd65vLz9sST;
	Mon, 24 Feb 2025 13:56:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FR8LrDFc0wQ; Mon, 24 Feb 2025 13:56:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1gjd5FVWz9sSR;
	Mon, 24 Feb 2025 13:56:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D6D38B765;
	Mon, 24 Feb 2025 13:56:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id u3om1-aGR3l0; Mon, 24 Feb 2025 13:56:53 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BB268B763;
	Mon, 24 Feb 2025 13:56:53 +0100 (CET)
Message-ID: <f872c2ef-4adc-4daa-aa12-769e3108abc8@csgroup.eu>
Date: Mon, 24 Feb 2025 13:56:53 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] powerpc: mpic: Use str_enabled_disabled() helper
 function
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <ricardo@marliere.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250219112053.3352-2-thorsten.blum@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250219112053.3352-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

Le 19/02/2025 à 12:20, Thorsten Blum a écrit :
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
> warning.
> 
> Reviewed-by: Ricardo B. Marlière <ricardo@marliere.net>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---


When you resend a patch, please tell why here (below the ---) so that we 
know the reason.

At the time being I have several duplicated patches from you and I don't 
know what to do with them which one to keep and which one to drop.

The list is here:

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=89400

>   arch/powerpc/sysdev/mpic.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index d94cf36b0f65..25fc4ac91814 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -27,6 +27,7 @@
>   #include <linux/spinlock.h>
>   #include <linux/pci.h>
>   #include <linux/slab.h>
> +#include <linux/string_choices.h>
>   #include <linux/syscore_ops.h>
>   #include <linux/ratelimit.h>
>   #include <linux/pgtable.h>
> @@ -474,9 +475,9 @@ static void __init mpic_scan_ht_msi(struct mpic *mpic, u8 __iomem *devbase,
>   		addr = addr | ((u64)readl(base + HT_MSI_ADDR_HI) << 32);
>   	}
>   
> -	printk(KERN_DEBUG "mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
> -		PCI_SLOT(devfn), PCI_FUNC(devfn),
> -		flags & HT_MSI_FLAGS_ENABLE ? "enabled" : "disabled", addr);
> +	pr_debug("mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
> +		 PCI_SLOT(devfn), PCI_FUNC(devfn),
> +		 str_enabled_disabled(flags & HT_MSI_FLAGS_ENABLE), addr);
>   
>   	if (!(flags & HT_MSI_FLAGS_ENABLE))
>   		writeb(flags | HT_MSI_FLAGS_ENABLE, base + HT_MSI_FLAGS);


