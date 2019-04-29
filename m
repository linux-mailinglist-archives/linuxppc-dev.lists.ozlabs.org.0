Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F9E6AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:37:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t81664ZbzDqGq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:37:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Q5o3w0VV"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7zN5pDwzDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:35:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t7z96kGcz9vD31;
 Mon, 29 Apr 2019 17:35:49 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Q5o3w0VV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kbO7e4z3Oado; Mon, 29 Apr 2019 17:35:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t7z95Zr4z9vD30;
 Mon, 29 Apr 2019 17:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556552149; bh=XXe83/pZb9AFMZAVXoUoxnryoMR8eaO+qKHpnqnFOB8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q5o3w0VVtDkuaQJ720CrXVg1D1EEff1tyfslomh/gdc4+yk1/Dkug0ZmjOpliak9E
 SNq24Cb/75QU4Vbo8GkPeMa5ZqrlcCuuxHVxWzptG/UbSIeVfGgHzF9GoK962b/vuv
 2GQOk16RVxWf7DSmpu538h1my8dNOApiD0oga2ow=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDA2C8B8B4;
 Mon, 29 Apr 2019 17:35:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id P3bLUxeO-Wfq; Mon, 29 Apr 2019 17:35:54 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEE718B8B3;
 Mon, 29 Apr 2019 17:35:54 +0200 (CEST)
Subject: Re: [RESEND PATCH v3 09/11] powerpc/mm/radix: mark
 __radix__flush_tlb_range_psize() as __always_inline
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-10-yamada.masahiro@socionext.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <40b48947-b80e-7971-376d-52b594e26d17@c-s.fr>
Date: Mon, 29 Apr 2019 17:35:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423034959.13525-10-yamada.masahiro@socionext.com>
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
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mathieu Malaterre <malat@debian.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/04/2019 à 05:49, Masahiro Yamada a écrit :
> This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> place. We need to eliminate potential issues beforehand.

How did you identify the functions requiring __always_inline as this one 
? Just by 'test and see if it fails', or did you have some script or so ?

Here the problem is that one of the parameters of the function are used 
as "immediate" constraint for the inline assembly, therefore requiring 
the function to always be inline.

I guess this should be explained in the commit log and I'm wondering how 
you ensure that you did identify all functions like this.

Christophe

> 
> If it is enabled for powerpc, the following error is reported:
> 
> arch/powerpc/mm/tlb-radix.c: In function '__radix__flush_tlb_range_psize':
> arch/powerpc/mm/tlb-radix.c:104:2: error: asm operand 3 probably doesn't match constraints [-Werror]
>    asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
>    ^~~
> arch/powerpc/mm/tlb-radix.c:104:2: error: impossible constraint in 'asm'
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3: None
> Changes in v2:
>    - split into a separate patch
> 
>   arch/powerpc/mm/tlb-radix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/tlb-radix.c b/arch/powerpc/mm/tlb-radix.c
> index 6a23b9ebd2a1..a2b2848f0ae3 100644
> --- a/arch/powerpc/mm/tlb-radix.c
> +++ b/arch/powerpc/mm/tlb-radix.c
> @@ -928,7 +928,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
>   	tlb->need_flush_all = 0;
>   }
>   
> -static inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
> +static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
>   				unsigned long start, unsigned long end,
>   				int psize, bool also_pwc)
>   {
> 
