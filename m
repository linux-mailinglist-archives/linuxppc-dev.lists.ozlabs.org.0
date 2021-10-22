Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52E43723D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 08:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbFNg40dcz3ckS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 17:50:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbFMS0JWrz3cF0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 17:49:38 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HbFMJ2ZmSz9sSV;
 Fri, 22 Oct 2021 08:49:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhF9nhYYZaR2; Fri, 22 Oct 2021 08:49:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HbFMJ1ZlKz9sST;
 Fri, 22 Oct 2021 08:49:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1800C8B816;
 Fri, 22 Oct 2021 08:49:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 83NdOcUUUAmc; Fri, 22 Oct 2021 08:49:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.57])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB77B8B764;
 Fri, 22 Oct 2021 08:49:31 +0200 (CEST)
Subject: Re: [PATCH v3 13/18] powerpc/64e: remove mmu_linear_psize
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-14-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8e03d7e9-b56a-0d87-3852-b9c5099e1273@csgroup.eu>
Date: Fri, 22 Oct 2021 08:49:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021223013.2641952-14-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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



Le 22/10/2021 à 00:30, Nicholas Piggin a écrit :
> mmu_linear_psize is only set at boot once on 64e, is not necessarily
> the correct size of the linear map pages, and is never used anywhere.
> Remove it.

mmu_linear_psize is defined as a macro in:

     arch/powerpc/include/asm/book3s/32/mmu-hash.h, line 152 (as a macro)
     arch/powerpc/include/asm/nohash/32/mmu-40x.h, line 66 (as a macro)
     arch/powerpc/include/asm/nohash/32/mmu-44x.h, line 150 (as a macro)
     arch/powerpc/include/asm/nohash/32/mmu-8xx.h, line 173 (as a macro)

Is that needed at all or should is be cleaned, if nothing else than 64s 
uses it ?

Otherwise, why not do the same with 64e and define it as a macro ? Maybe 
that would help minimising the amount of ifdefs.


> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/mm/nohash/tlb.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
> index 5872f69141d5..8c1523ae7f7f 100644
> --- a/arch/powerpc/mm/nohash/tlb.c
> +++ b/arch/powerpc/mm/nohash/tlb.c
> @@ -150,7 +150,6 @@ static inline int mmu_get_tsize(int psize)
>    */
>   #ifdef CONFIG_PPC64
>   
> -int mmu_linear_psize;		/* Page size used for the linear mapping */
>   int mmu_pte_psize;		/* Page size used for PTE pages */
>   int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
>   int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
> @@ -655,14 +654,6 @@ static void early_init_this_mmu(void)
>   
>   static void __init early_init_mmu_global(void)
>   {
> -	/* XXX This will have to be decided at runtime, but right
> -	 * now our boot and TLB miss code hard wires it. Ideally
> -	 * we should find out a suitable page size and patch the
> -	 * TLB miss code (either that or use the PACA to store
> -	 * the value we want)
> -	 */
> -	mmu_linear_psize = MMU_PAGE_1G;
> -
>   	/* XXX This should be decided at runtime based on supported
>   	 * page sizes in the TLB, but for now let's assume 16M is
>   	 * always there and a good fit (which it probably is)
> 
