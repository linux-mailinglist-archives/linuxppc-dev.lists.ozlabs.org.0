Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A38582DF545
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 12:41:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzLJd1HtKzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 22:40:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzLFG0lfxzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 22:37:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CzLDv0SFtz9tyt4;
 Sun, 20 Dec 2020 12:37:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X1AU_5tc4Ftt; Sun, 20 Dec 2020 12:37:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CzLDt6dpsz9tyt3;
 Sun, 20 Dec 2020 12:37:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A71D8B77E;
 Sun, 20 Dec 2020 12:37:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id drW-rd6jzlLm; Sun, 20 Dec 2020 12:37:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B607E8B75B;
 Sun, 20 Dec 2020 12:37:37 +0100 (CET)
Subject: Re: [RFC PATCH 1/5] powerpc/64s: update_mmu_cache inline the radix
 test
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201219234813.830747-1-npiggin@gmail.com>
 <20201219234813.830747-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7190cf34-af03-ca35-d2b5-aa152d300ec0@csgroup.eu>
Date: Sun, 20 Dec 2020 12:37:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201219234813.830747-2-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/12/2020 à 00:48, Nicholas Piggin a écrit :
> This allows the function to be entirely noped if hash support is
> compiled out (not possible yet).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/book3s/pgtable.h | 11 ++++++++++-
>   arch/powerpc/mm/book3s32/mmu.c            |  4 ++--
>   arch/powerpc/mm/book3s64/hash_utils.c     |  7 ++-----
>   3 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
> index 0e1263455d73..914e9fc7b069 100644
> --- a/arch/powerpc/include/asm/book3s/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/pgtable.h
> @@ -35,7 +35,16 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
>    * corresponding HPTE into the hash table ahead of time, instead of
>    * waiting for the inevitable extra hash-table miss exception.
>    */
> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
> +void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
> +
> +static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
> +{
> +#ifdef CONFIG_PPC64

You shouldn't need that ifdef. radix_enabled() is always defined.

> +	if (radix_enabled())
> +		return;
> +#endif
> +	hash__update_mmu_cache(vma, address, ptep);
> +}
>   
>   #endif /* __ASSEMBLY__ */
>   #endif
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> index 859e5bd603ac..c5a570ca37ff 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -325,8 +325,8 @@ static void hash_preload(struct mm_struct *mm, unsigned long ea)
>    *
>    * This must always be called with the pte lock held.
>    */
> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
> -		      pte_t *ptep)
> +void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
> +			    pte_t *ptep)

Now the limit is 100 chars per line. This should fit on a single line I think.

>   {
>   	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
>   		return;
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 73b06adb6eeb..d52a3dee7cf2 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1667,8 +1667,8 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
>    *
>    * This must always be called with the pte lock held.
>    */
> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
> -		      pte_t *ptep)
> +void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
> +			    pte_t *ptep)

Now the limit is 100 chars per line. This should fit on a single line I think.

>   {
>   	/*
>   	 * We don't need to worry about _PAGE_PRESENT here because we are
> @@ -1677,9 +1677,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
>   	unsigned long trap;
>   	bool is_exec;
>   
> -	if (radix_enabled())
> -		return;
> -
>   	/* We only want HPTEs for linux PTEs that have _PAGE_ACCESSED set */
>   	if (!pte_young(*ptep) || address >= TASK_SIZE)
>   		return;
> 
