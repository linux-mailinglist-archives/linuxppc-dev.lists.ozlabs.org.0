Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CCC3B36F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 21:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9qpZ2tCnz3c0L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 05:25:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9qp92JDvz308R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 05:24:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G9qp2207VzBD3X;
 Thu, 24 Jun 2021 21:24:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YITgDW9CgO7X; Thu, 24 Jun 2021 21:24:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G9qp20n50zBCf1;
 Thu, 24 Jun 2021 21:24:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E621E8B7EC;
 Thu, 24 Jun 2021 21:24:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lffGXMs8fonU; Thu, 24 Jun 2021 21:24:41 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 26E218B764;
 Thu, 24 Jun 2021 21:24:41 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] mm: pagewalk: Fix walk for hugepage tables
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
References: <cover.1618828806.git.christophe.leroy@csgroup.eu>
 <db6981c69f96a8c9c6dcf688b7f485e15993ddef.1618828806.git.christophe.leroy@csgroup.eu>
Message-ID: <d22d196a-45ea-0960-b748-caab0e996c7c@csgroup.eu>
Date: Thu, 24 Jun 2021 21:24:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <db6981c69f96a8c9c6dcf688b7f485e15993ddef.1618828806.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, linux-mm@kvack.org,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Le 19/04/2021 à 12:47, Christophe Leroy a écrit :
> Pagewalk ignores hugepd entries and walk down the tables
> as if it was traditionnal entries, leading to crazy result.
> 
> Add walk_hugepd_range() and use it to walk hugepage tables.

I see you took patch 2 and 3 of the series.

Do you expect Andrew to take patch 1 via mm tree, and then you'll take patch 4 once mm tree is merged ?

Christophe

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2:
> - Add a guard for NULL ops->pte_entry
> - Take mm->page_table_lock when walking hugepage table, as suggested by follow_huge_pd()
> ---
>   mm/pagewalk.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e81640d9f177..9b3db11a4d1d 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -58,6 +58,45 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   	return err;
>   }
>   
> +#ifdef CONFIG_ARCH_HAS_HUGEPD
> +static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
> +			     unsigned long end, struct mm_walk *walk, int pdshift)
> +{
> +	int err = 0;
> +	const struct mm_walk_ops *ops = walk->ops;
> +	int shift = hugepd_shift(*phpd);
> +	int page_size = 1 << shift;
> +
> +	if (!ops->pte_entry)
> +		return 0;
> +
> +	if (addr & (page_size - 1))
> +		return 0;
> +
> +	for (;;) {
> +		pte_t *pte;
> +
> +		spin_lock(&walk->mm->page_table_lock);
> +		pte = hugepte_offset(*phpd, addr, pdshift);
> +		err = ops->pte_entry(pte, addr, addr + page_size, walk);
> +		spin_unlock(&walk->mm->page_table_lock);
> +
> +		if (err)
> +			break;
> +		if (addr >= end - page_size)
> +			break;
> +		addr += page_size;
> +	}
> +	return err;
> +}
> +#else
> +static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
> +			     unsigned long end, struct mm_walk *walk, int pdshift)
> +{
> +	return 0;
> +}
> +#endif
> +
>   static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>   			  struct mm_walk *walk)
>   {
> @@ -108,7 +147,10 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>   				goto again;
>   		}
>   
> -		err = walk_pte_range(pmd, addr, next, walk);
> +		if (is_hugepd(__hugepd(pmd_val(*pmd))))
> +			err = walk_hugepd_range((hugepd_t *)pmd, addr, next, walk, PMD_SHIFT);
> +		else
> +			err = walk_pte_range(pmd, addr, next, walk);
>   		if (err)
>   			break;
>   	} while (pmd++, addr = next, addr != end);
> @@ -157,7 +199,10 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>   		if (pud_none(*pud))
>   			goto again;
>   
> -		err = walk_pmd_range(pud, addr, next, walk);
> +		if (is_hugepd(__hugepd(pud_val(*pud))))
> +			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
> +		else
> +			err = walk_pmd_range(pud, addr, next, walk);
>   		if (err)
>   			break;
>   	} while (pud++, addr = next, addr != end);
> @@ -189,7 +234,9 @@ static int walk_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>   			if (err)
>   				break;
>   		}
> -		if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
> +		if (is_hugepd(__hugepd(p4d_val(*p4d))))
> +			err = walk_hugepd_range((hugepd_t *)p4d, addr, next, walk, P4D_SHIFT);
> +		else if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
>   			err = walk_pud_range(p4d, addr, next, walk);
>   		if (err)
>   			break;
> @@ -224,8 +271,9 @@ static int walk_pgd_range(unsigned long addr, unsigned long end,
>   			if (err)
>   				break;
>   		}
> -		if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry ||
> -		    ops->pte_entry)
> +		if (is_hugepd(__hugepd(pgd_val(*pgd))))
> +			err = walk_hugepd_range((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);
> +		else if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry || ops->pte_entry)
>   			err = walk_p4d_range(pgd, addr, next, walk);
>   		if (err)
>   			break;
> 
