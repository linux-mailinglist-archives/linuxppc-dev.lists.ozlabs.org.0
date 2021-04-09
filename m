Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6033598F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:16:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGsvC6sXLz3bvx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:16:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGsts70ffz30HC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:16:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGstj6Xt5z9vBLm;
 Fri,  9 Apr 2021 11:15:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aoj9GNiSLPS0; Fri,  9 Apr 2021 11:15:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGstj5712z9vBLh;
 Fri,  9 Apr 2021 11:15:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE2688B7E0;
 Fri,  9 Apr 2021 11:15:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MgQO5aHk9mtP; Fri,  9 Apr 2021 11:15:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30DC68B7DE;
 Fri,  9 Apr 2021 11:15:58 +0200 (CEST)
Subject: Re: [PATCH v3 4/9] powerpc/mm/book3s64: Fix possible build error
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
 <20210330060752.592769-5-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4967af87-26be-ee91-b313-8c4729c42458@csgroup.eu>
Date: Fri, 9 Apr 2021 11:15:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330060752.592769-5-aneesh.kumar@linux.ibm.com>
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
Cc: joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2021 à 08:07, Aneesh Kumar K.V a écrit :
> Update _tlbiel_pid() such that we can avoid build errors like below when
> using this function in other places.
> 
> arch/powerpc/mm/book3s64/radix_tlb.c: In function ‘__radix__flush_tlb_range_psize’:
> arch/powerpc/mm/book3s64/radix_tlb.c:114:2: warning: ‘asm’ operand 3 probably does not match constraints
>    114 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
>        |  ^~~
> arch/powerpc/mm/book3s64/radix_tlb.c:114:2: error: impossible constraint in ‘asm’
> make[4]: *** [scripts/Makefile.build:271: arch/powerpc/mm/book3s64/radix_tlb.o] Error 1
> m
> 
> With this fix, we can also drop the __always_inline in __radix_flush_tlb_range_psize
> which was added by commit e12d6d7d46a6 ("powerpc/mm/radix: mark __radix__flush_tlb_range_psize() as __always_inline")
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/mm/book3s64/radix_tlb.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 409e61210789..817a02ef6032 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -291,22 +291,30 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
>   /*
>    * We use 128 set in radix mode and 256 set in hpt mode.
>    */
> -static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
> +static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
>   {
>   	int set;
>   
>   	asm volatile("ptesync": : :"memory");
>   
> -	/*
> -	 * Flush the first set of the TLB, and if we're doing a RIC_FLUSH_ALL,
> -	 * also flush the entire Page Walk Cache.
> -	 */
> -	__tlbiel_pid(pid, 0, ric);
> +	switch (ric) {
> +	case RIC_FLUSH_PWC:
>   
> -	/* For PWC, only one flush is needed */
> -	if (ric == RIC_FLUSH_PWC) {
> +		/* For PWC, only one flush is needed */
> +		__tlbiel_pid(pid, 0, RIC_FLUSH_PWC);
>   		ppc_after_tlbiel_barrier();
>   		return;
> +	case RIC_FLUSH_TLB:
> +		__tlbiel_pid(pid, 0, RIC_FLUSH_TLB);
> +		break;
> +	case RIC_FLUSH_ALL:
> +	default:
> +		/*
> +		 * Flush the first set of the TLB, and if
> +		 * we're doing a RIC_FLUSH_ALL, also flush
> +		 * the entire Page Walk Cache.
> +		 */
> +		__tlbiel_pid(pid, 0, RIC_FLUSH_ALL);
>   	}
>   
>   	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
> @@ -1176,7 +1184,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
>   	}
>   }
>   
> -static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
> +static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
>   				unsigned long start, unsigned long end,
>   				int psize, bool also_pwc)
>   {
> 
