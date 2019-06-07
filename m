Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B3383CD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 07:39:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Krtw0YQWzDqhN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 15:39:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Dvlyzreu"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Krps3kkfzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 15:35:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Krpl68wTz9tygK;
 Fri,  7 Jun 2019 07:35:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Dvlyzreu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GlfedUmMl7Oc; Fri,  7 Jun 2019 07:35:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Krpl58gsz9tygJ;
 Fri,  7 Jun 2019 07:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559885743; bh=awtb2K2L/pY0LqP0uu2of3n3HarcCZpSOiH93bH5nw4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DvlyzreuELhDax09caib3ENJoKVeMqorlazus7kPoETmJfW+2lq/7VzcixdbbjDC2
 1GYxzyw8yk+j8qpcjRf0NYRSdmv1Lbt8HMAFmz6SFrdAt809s703py/AE9jug3s1N2
 +G9Go+XqHRv34U/tdSkOh7RqaYLTzEybEsstY/6M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 951A28B781;
 Fri,  7 Jun 2019 07:35:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JAlNUjQv0yZC; Fri,  7 Jun 2019 07:35:44 +0200 (CEST)
Received: from PO15451 (unknown [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 777268B75A;
 Fri,  7 Jun 2019 07:35:44 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/64s: __find_linux_pte synchronization vs
 pmdp_invalidate
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190607035636.5446-1-npiggin@gmail.com>
 <20190607035636.5446-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <46295970-4740-5648-efb4-513ab6a5c1c0@c-s.fr>
Date: Fri, 7 Jun 2019 07:35:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607035636.5446-2-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/06/2019 à 05:56, Nicholas Piggin a écrit :
> The change to pmdp_invalidate to mark the pmd with _PAGE_INVALID broke
> the synchronisation against lock free lookups, __find_linux_pte's
> pmd_none check no longer returns true for such cases.
> 
> Fix this by adding a check for this condition as well.
> 
> Fixes: da7ad366b497 ("powerpc/mm/book3s: Update pmd_present to look at _PAGE_PRESENT bit")
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/mm/pgtable.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index db4a6253df92..533fc6fa6726 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -372,13 +372,25 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
>   	pdshift = PMD_SHIFT;
>   	pmdp = pmd_offset(&pud, ea);
>   	pmd  = READ_ONCE(*pmdp);
> +
>   	/*
> -	 * A hugepage collapse is captured by pmd_none, because
> -	 * it mark the pmd none and do a hpte invalidate.
> +	 * A hugepage collapse is captured by this condition, see
> +	 * pmdp_collapse_flush.
>   	 */
>   	if (pmd_none(pmd))
>   		return NULL;
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	/*
> +	 * A hugepage split is captured by this condition, see
> +	 * pmdp_invalidate.
> +	 *
> +	 * Huge page modification can be caught here too.
> +	 */
> +	if (pmd_is_serializing(pmd))
> +		return NULL;
> +#endif
> +

Could get rid of that #ifdef by adding the following in book3s32 and 
nohash pgtable.h:

static inline bool pmd_is_serializing()  { return false; }

Christophe

>   	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
>   		if (is_thp)
>   			*is_thp = true;
> 
