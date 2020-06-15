Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CB1F938F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 11:34:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lmPN4lnyzDqVC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 19:34:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lmMl3DntzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 19:32:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49lmMb4rPNz9vBKc;
 Mon, 15 Jun 2020 11:32:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bMRFmJQeXFz6; Mon, 15 Jun 2020 11:32:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49lmMb29yWz9vBKb;
 Mon, 15 Jun 2020 11:32:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAE318B786;
 Mon, 15 Jun 2020 11:32:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ykKpLC_cKaHk; Mon, 15 Jun 2020 11:32:41 +0200 (CEST)
Received: from [172.25.101.66] (po15451.idsi0.si.c-s.fr [172.25.101.66])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AA3248B75F;
 Mon, 15 Jun 2020 11:32:41 +0200 (CEST)
Subject: Re: [PATCH] powerpc/8xx: use pmd_off() to access a PMD entry in
 pte_update()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200615092229.23142-1-rppt@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <717cb7ae-1859-8a97-281a-a6ecb68fccd0@csgroup.eu>
Date: Mon, 15 Jun 2020 11:32:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615092229.23142-1-rppt@kernel.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/06/2020 à 11:22, Mike Rapoport a écrit :
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The pte_update() implementation for PPC_8xx unfolds page table from the PGD
> level to access a PMD entry. Since 8xx has only 2-level page table this can
> be simplified with pmd_off() shortcut.
> 
> Replace explicit unfolding with pmd_off() and drop defines of pgd_index()
> and pgd_offset() that are no longer needed.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Nice. When I implemented this function, I was not able to use pmd_ptr()
due to some circular header inclusion (See comment in commit log). Looks
like since the replacement of pmd_ptr() by pmd_off(), it works.

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

Christophe

> ---
> 
> I think it's powerpc material, but I won't mind if Andrew picks it up :)
> 
> 
>   arch/powerpc/include/asm/nohash/32/pgtable.h | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
> index b56f14160ae5..5a590ceaec14 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -205,10 +205,6 @@ static inline void pmd_clear(pmd_t *pmdp)
>   	*pmdp = __pmd(0);
>   }
>   
> -/* to find an entry in a page-table-directory */
> -#define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
> -#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
> -
>   /*
>    * PTE updates. This function is called whenever an existing
>    * valid PTE is updated. This does -not- include set_pte_at()
> @@ -230,6 +226,8 @@ static inline void pmd_clear(pmd_t *pmdp)
>    * For other page sizes, we have a single entry in the table.
>    */
>   #ifdef CONFIG_PPC_8xx
> +static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
> +
>   static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
>   				     unsigned long clr, unsigned long set, int huge)
>   {
> @@ -237,7 +235,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
>   	pte_basic_t old = pte_val(*p);
>   	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
>   	int num, i;
> -	pmd_t *pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, addr), addr), addr), addr);
> +	pmd_t *pmd = pmd_off(mm, addr);
>   
>   	if (!huge)
>   		num = PAGE_SIZE / SZ_4K;
> 
