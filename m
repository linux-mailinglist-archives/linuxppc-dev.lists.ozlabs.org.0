Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA63FFCE1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 11:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1Byc3lrRz303F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 19:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1By85K30z2yHW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 19:17:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H1By25Mpvz9sTF;
 Fri,  3 Sep 2021 11:16:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ij6FTKTMMlQS; Fri,  3 Sep 2021 11:16:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H1By249hhz9sTB;
 Fri,  3 Sep 2021 11:16:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 767348B8DB;
 Fri,  3 Sep 2021 11:16:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jM0WhLpLl04Y; Fri,  3 Sep 2021 11:16:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F37BF8B764;
 Fri,  3 Sep 2021 11:16:57 +0200 (CEST)
Subject: Re: [PATCH -next] powerpc/mm: check base flags in ioremap_prot
To: Nanyong Sun <sunnanyong@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, akpm@linux-foundation.org,
 npiggin@gmail.com, christophe.leroy@c-s.fr
References: <20210903090339.3671524-1-sunnanyong@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <90aa2b67-24c8-4a5f-d91a-b562054d5c5d@csgroup.eu>
Date: Fri, 3 Sep 2021 11:16:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903090339.3671524-1-sunnanyong@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/09/2021 à 11:03, Nanyong Sun a écrit :
> Some drivers who call ioremap_prot without setting base flags like
> ioremap_prot(addr, len, 0) may work well before
> commit 56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL flags in
> ioremap()"), but now they will get a virtual address "successfully"
> from ioremap_prot and badly fault on memory access later because that
> patch also dropped the hack adding of base flags for ioremap_prot.
> 
> So return NULL and throw a warning if the caller of ioremap_prot did
> not set base flags properly. Why not just hack adding PAGE_KERNEL flags
> in the ioremap_prot, because most scenarios can be covered by high level
> functions like ioremap(), ioremap_coherent(), ioremap_cache()...
> so it is better to keep max flexibility for this low level api.

As far as I can see, there is no user of this fonction that sets flags to 0 in the kernel tree.

Did you find any ? If you did, I think it is better to fix the caller.

Christophe

> 
> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
> ---
>   arch/powerpc/mm/ioremap.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
> index 57342154d2b0..b7eda0f0d04d 100644
> --- a/arch/powerpc/mm/ioremap.c
> +++ b/arch/powerpc/mm/ioremap.c
> @@ -46,6 +46,10 @@ void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long f
>   	pte_t pte = __pte(flags);
>   	void *caller = __builtin_return_address(0);
>   
> +	/* The caller should set base page flags properly */
> +	if (WARN_ON((flags & _PAGE_PRESENT) == 0))

This probably doesn't work for some plateforms like book3s/64. You should use helpers like 
pte_present().

See the comment at 
https://elixir.bootlin.com/linux/v5.14/source/arch/powerpc/include/asm/book3s/64/pgtable.h#L591

> +		return NULL;
> +
>   	/* writeable implies dirty for kernel addresses */
>   	if (pte_write(pte))
>   		pte = pte_mkdirty(pte);
> 
