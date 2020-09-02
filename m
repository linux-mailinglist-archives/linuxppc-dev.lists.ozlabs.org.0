Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8525AB2F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhNd530wvzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 22:32:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhNZ61BYVzDqnl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 22:30:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhNYt56P8z9txSh;
 Wed,  2 Sep 2020 14:30:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4zXX1GLgvkCC; Wed,  2 Sep 2020 14:30:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhNYt4JQ1z9txSg;
 Wed,  2 Sep 2020 14:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F9378B7E5;
 Wed,  2 Sep 2020 14:30:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rcodqJoEqWLy; Wed,  2 Sep 2020 14:30:11 +0200 (CEST)
Received: from [10.25.210.31] (unknown [10.25.210.31])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 243378B7E6;
 Wed,  2 Sep 2020 14:30:11 +0200 (CEST)
Subject: Re: [PATCH v4 02/13] powerpc/mm: Move setting pte specific flags to
 pfn_pte
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-3-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <86a69650-e4da-9206-2a87-f910456f8dc0@csgroup.eu>
Date: Wed, 2 Sep 2020 14:30:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-3-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2020 à 13:42, Aneesh Kumar K.V a écrit :
> powerpc used to set the pte specific flags in set_pte_at(). This is
> different from other architectures. To be consistent with other
> architecture update pfn_pte to set _PAGE_PTE on ppc64. Also, drop now
> unused pte_mkpte.
> 
> We add a VM_WARN_ON() to catch the usage of calling set_pte_at()
> without setting _PAGE_PTE bit. We will remove that after a few releases.
> 
> With respect to huge pmd entries, pmd_mkhuge() takes care of adding the
> _PAGE_PTE bit.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Small nit below.

> ---
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 15 +++++++++------
>   arch/powerpc/include/asm/nohash/pgtable.h    |  5 -----
>   arch/powerpc/mm/pgtable.c                    |  5 -----
>   3 files changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 079211968987..2382fd516f6b 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -823,6 +818,14 @@ static inline int pte_none(pte_t pte)
>   static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>   				pte_t *ptep, pte_t pte, int percpu)
>   {
> +
> +	VM_WARN_ON(!(pte_raw(pte) & cpu_to_be64(_PAGE_PTE)));
> +	/*
> +	 * Keep the _PAGE_PTE added till we are sure we handle _PAGE_PTE
> +	 * in all the callers.
> +	 */
> +	 pte = __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));

Wrong alignment, there is a leading space.

> +
>   	if (radix_enabled())
>   		return radix__set_pte_at(mm, addr, ptep, pte, percpu);
>   	return hash__set_pte_at(mm, addr, ptep, pte, percpu);

Christophe
