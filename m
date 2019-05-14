Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0131C9C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:00:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453K7q42rrzDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 00:00:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453K5T6qdjzDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 23:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kUyhj5B+"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 453K5S6DVzz8tSP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 23:58:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 453K5S5ByHz9sML; Tue, 14 May 2019 23:58:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kUyhj5B+"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 453K5R6J0dz9sBb
 for <linuxppc-dev@ozlabs.org>; Tue, 14 May 2019 23:58:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453K5M2J7bz9vBn7;
 Tue, 14 May 2019 15:57:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kUyhj5B+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nMQCvUZIP_ek; Tue, 14 May 2019 15:57:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453K5M135xz9v0Yd;
 Tue, 14 May 2019 15:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557842279; bh=/vHdtd/WAOb2tZEuTLD9XTnMy+aemzJPynBwW/70qEk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kUyhj5B+mAxSacAKAKUdFqBoxDFhmUR5aVMgA4+apipqIIi9JlXw4C6ME/aHKjONW
 mtSQ3MVAymxLcHz0FEasiRyYHWJOk4+ldN5PEpLRLAehgnMDXCbqAOwTzSvKrua/0o
 /pCSHiJ/rb0PL2Xi/qPV1nIgjPZ+GagMGWOCjSCI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 908F18B8DD;
 Tue, 14 May 2019 15:58:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mt2OC2OinwrU; Tue, 14 May 2019 15:58:00 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E178D8B8DB;
 Tue, 14 May 2019 15:57:59 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm: Fix crashes with hugepages & 4K pages
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20190514134321.25575-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d46dfb90-ce9d-8099-b718-022436e40b37@c-s.fr>
Date: Tue, 14 May 2019 15:57:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514134321.25575-1-mpe@ellerman.id.au>
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
Cc: aneesh.kumar@linux.vnet.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/05/2019 à 15:43, Michael Ellerman a écrit :
> The recent commit to cleanup ifdefs in the hugepage initialisation led
> to crashes when using 4K pages as reported by Sachin:
> 
>    BUG: Kernel NULL pointer dereference at 0x0000001c
>    Faulting instruction address: 0xc000000001d1e58c
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>    ...
>    CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      5.1.0-next-20190507-autotest #1
>    NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
>    REGS: c000000004937890 TRAP: 0300
>    MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: 00000000
>    CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: 0
>    ...
>    NIP kmem_cache_alloc+0xbc/0x5a0
>    LR  kmem_cache_alloc+0x7c/0x5a0
>    Call Trace:
>      huge_pte_alloc+0x580/0x950
>      hugetlb_fault+0x9a0/0x1250
>      handle_mm_fault+0x490/0x4a0
>      __do_page_fault+0x77c/0x1f00
>      do_page_fault+0x28/0x50
>      handle_page_fault+0x18/0x38
> 
> This is caused by us trying to allocate from a NULL kmem cache in
> __hugepte_alloc(). The kmem cache is NULL because it was never
> allocated in hugetlbpage_init(), because add_huge_page_size() returned
> an error.
> 
> The reason add_huge_page_size() returned an error is a simple typo, we
> are calling check_and_get_huge_psize(size) when we should be passing
> shift instead.
> 
> The fact that we're able to trigger this path when the kmem caches are
> NULL is a separate bug, ie. we should not advertise any hugepage sizes
> if we haven't setup the required caches for them.
> 
> This was only seen with 4K pages, with 64K pages we don't need to
> allocate any extra kmem caches because the 16M hugepage just occupies
> a single entry at the PMD level.
> 
> Fixes: 723f268f19da ("powerpc/mm: cleanup ifdef mess in add_huge_page_size()")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/mm/hugetlbpage.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index c5c9ff2d7afc..b5d92dc32844 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -556,7 +556,7 @@ static int __init add_huge_page_size(unsigned long long size)
>   	if (size <= PAGE_SIZE || !is_power_of_2(size))
>   		return -EINVAL;
>   
> -	mmu_psize = check_and_get_huge_psize(size);
> +	mmu_psize = check_and_get_huge_psize(shift);
>   	if (mmu_psize < 0)
>   		return -EINVAL;
>   
> 
