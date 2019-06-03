Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1800F329F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:45:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRtp1TV0zDqQm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:45:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Qtv3gOPH"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRrR5WKszDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:43:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45HRnF5Fgnz9tyqw;
 Mon,  3 Jun 2019 09:41:05 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Qtv3gOPH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dsy0c5Yur4an; Mon,  3 Jun 2019 09:41:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45HRnF46nqz9tyqn;
 Mon,  3 Jun 2019 09:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559547665; bh=Y8cfuzmoIUD2uZtBZ3hVZsVK552cgO2EazLDuN4FCbg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Qtv3gOPH08lZc7zm6sTjvP6SZccZhvq4jBSN0knmn+pETmpAPadopY67L/2F7JzPM
 pmSIAYKGIMqG4zU2Nk6cpbwZdnokKILH/IYmgrOqqzWOAgjrin/nA3lIodcALz2p6T
 XDvXlEVO/6ketciaUzqiDQMHtwn0IvT8unnemBms=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 326D38B7B1;
 Mon,  3 Jun 2019 09:41:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kKga41XuLrYB; Mon,  3 Jun 2019 09:41:10 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 172368B7A1;
 Mon,  3 Jun 2019 09:41:10 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc/64s: __find_linux_pte synchronization vs
 pmdp_invalidate
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190603064408.14735-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b7732d44-a83c-321c-b158-87e0fd6af007@c-s.fr>
Date: Mon, 3 Jun 2019 09:41:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603064408.14735-1-npiggin@gmail.com>
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



Le 03/06/2019 à 08:44, Nicholas Piggin a écrit :
> The pmd_none check does not catch hugepage collapse, nor does the
> pmd_present check in pmd_trans_huge, because hugepage collapse sets
> !_PAGE_PRESENT && _PAGE_INVALID (which results in !pmd_none and
> pmd_present).
> 
> Aneesh noticed we might need this check as well.
> 
> ---
>   arch/powerpc/mm/pgtable.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index db4a6253df92..7a702d21400a 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -372,13 +372,20 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
>   	pdshift = PMD_SHIFT;
>   	pmdp = pmd_offset(&pud, ea);
>   	pmd  = READ_ONCE(*pmdp);
> -	/*
> -	 * A hugepage collapse is captured by pmd_none, because
> -	 * it mark the pmd none and do a hpte invalidate.
> -	 */
> +
>   	if (pmd_none(pmd))
>   		return NULL;
>   
> +#ifdef CONFIG_PPC_BOOK3S_64

I can't see anything that would build fail on other subarches. Wouldn't 
be better to use

if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && (pmd_val(pmd) & 
(_PAGE_PRESENT|_PAGE_INVALID) == _PAGE_INVALID))


> +	if (pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_INVALID) == _PAGE_INVALID) {

Maybe using pmd_raw() instead as in all the book3s64 helpers ?

Christophe


> +		/*
> +		 * A hugepage collapse is captured by this condition, see
> +		 * pmdp_invalidate.
> +		 */
> +		return NULL;
> +	}
> +#endif
> +
>   	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
>   		if (is_thp)
>   			*is_thp = true;
> 
