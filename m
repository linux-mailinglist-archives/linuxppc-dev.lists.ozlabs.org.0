Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDE383C5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 07:36:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Krq32KrfzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 15:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="rd7lAYCx"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KrnF4NXbzDqCC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 15:34:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Krn41rswz9tygK;
 Fri,  7 Jun 2019 07:34:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rd7lAYCx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZIofVS1H0sBm; Fri,  7 Jun 2019 07:34:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Krn40hwyz9tygJ;
 Fri,  7 Jun 2019 07:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559885656; bh=kGtibjlIZlULj8YHmg6ftLCzgtTySrwKRa3oWfrBn50=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rd7lAYCxpI+dYiwKM+1ogLbx9y04GjBj1Q0IxCj9QlRYK5X2LfUPvlqiT8GlK5e++
 bw7wMbXeLNrmTcyXqHLBfyGK2DePZ+lMeOefaJ1wl6KfYbfOnob4fnUMTAvRAOtD7m
 UlZolRWgu0ekrLudsSvhGFfVHBKN1CVAcK942Eys=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EBEBE8B781;
 Fri,  7 Jun 2019 07:34:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kTh9ZVcLQs8s; Fri,  7 Jun 2019 07:34:16 +0200 (CEST)
Received: from PO15451 (unknown [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C30CE8B75A;
 Fri,  7 Jun 2019 07:34:16 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/64s: Fix THP PMD collapse serialisation
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190607035636.5446-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <696d26a4-90e2-cb16-975f-d00cf6a01b67@c-s.fr>
Date: Fri, 7 Jun 2019 07:34:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607035636.5446-1-npiggin@gmail.com>
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
> Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
> in pte helpers") changed the actual bitwise tests in pte_access_permitted
> by using pte_write() and pte_present() helpers rather than raw bitwise
> testing _PAGE_WRITE and _PAGE_PRESENT bits.
> 
> The pte_present change now returns true for ptes which are !_PAGE_PRESENT
> and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
> synchronize access from lock-free lookups. pte_access_permitted is used by
> pmd_access_permitted, so allowing GUP lock free access to proceed with
> such PTEs breaks this synchronisation.
> 
> This bug has been observed on HPT host, with random crashes and corruption
> in guests, usually together with bad PMD messages in the host.
> 
> Fix this by adding an explicit check in pmd_access_permitted, and
> documenting the condition explicitly.
> 
> The pte_write() change should be okay, and would prevent GUP from falling
> back to the slow path when encountering savedwrite ptes, which matches
> what x86 (that does not implement savedwrite) does.
> 
> Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion in pte helpers")
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> I accounted for Aneesh's and Christophe's feedback, except I couldn't
> find a good way to replace the ifdef with IS_ENABLED because of
> _PAGE_INVALID etc., but at least cleaned that up a bit nicer.

I guess the standard way is to add a pmd_is_serializing() which return 
always false in book3s/32/pgtable.h and in nohash/pgtable.h

> 
> Patch 1 solves a problem I can hit quite reliably running HPT/HPT KVM.
> Patch 2 was noticed by Aneesh when inspecting code for similar bugs.
> They should probably both be merged in stable kernels after upstream.
> 
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 30 ++++++++++++++++++++
>   arch/powerpc/mm/book3s64/pgtable.c           |  3 ++
>   2 files changed, 33 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 7dede2e34b70..ccf00a8b98c6 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -876,6 +876,23 @@ static inline int pmd_present(pmd_t pmd)
>   	return false;
>   }
>   
> +static inline int pmd_is_serializing(pmd_t pmd)

should be static inline bool instead of int ?

Christophe

> +{
> +	/*
> +	 * If the pmd is undergoing a split, the _PAGE_PRESENT bit is clear
> +	 * and _PAGE_INVALID is set (see pmd_present, pmdp_invalidate).
> +	 *
> +	 * This condition may also occur when flushing a pmd while flushing
> +	 * it (see ptep_modify_prot_start), so callers must ensure this
> +	 * case is fine as well.
> +	 */
> +	if ((pmd_raw(pmd) & cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID)) ==
> +						cpu_to_be64(_PAGE_INVALID))
> +		return true;
> +
> +	return false;
> +}
> +
>   static inline int pmd_bad(pmd_t pmd)
>   {
>   	if (radix_enabled())
> @@ -1092,6 +1109,19 @@ static inline int pmd_protnone(pmd_t pmd)
>   #define pmd_access_permitted pmd_access_permitted
>   static inline bool pmd_access_permitted(pmd_t pmd, bool write)
>   {
> +	/*
> +	 * pmdp_invalidate sets this combination (which is not caught by
> +	 * !pte_present() check in pte_access_permitted), to prevent
> +	 * lock-free lookups, as part of the serialize_against_pte_lookup()
> +	 * synchronisation.
> +	 *
> +	 * This also catches the case where the PTE's hardware PRESENT bit is
> +	 * cleared while TLB is flushed, which is suboptimal but should not
> +	 * be frequent.
> +	 */
> +	if (pmd_is_serializing(pmd))
> +		return false;
> +
>   	return pte_access_permitted(pmd_pte(pmd), write);
>   }
>   
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 16bda049187a..ff98b663c83e 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -116,6 +116,9 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
>   	/*
>   	 * This ensures that generic code that rely on IRQ disabling
>   	 * to prevent a parallel THP split work as expected.
> +	 *
> +	 * Marking the entry with _PAGE_INVALID && ~_PAGE_PRESENT requires
> +	 * a special case check in pmd_access_permitted.
>   	 */
>   	serialize_against_pte_lookup(vma->vm_mm);
>   	return __pmd(old_pmd);
> 
