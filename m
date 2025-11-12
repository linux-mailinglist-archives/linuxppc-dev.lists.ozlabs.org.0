Return-Path: <linuxppc-dev+bounces-14123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF8C52150
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 12:50:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d61tr3KLkz301N;
	Wed, 12 Nov 2025 22:50:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762948244;
	cv=none; b=OiDLtWvd+JmzwKpEoLjQu7SxeTKrf+gQQV5GUPDjmygz1/FrMeCwNt+Ur29xmEhPbflEoSIlKwPvUOm3tDWlHV1j8DZ6KZf+lkJApHBhvraMmGHHFk94uqki173ycWKmHDW6l3sjNfjS6MAfNLfoocR550I0ddKVyZjyDYcnxAASKDcypeHrlTQULk1Uf1ChxGMAO3K7jk7jYN8HOp+6AG52pzjtq1h4dZV/5li1PBrjWmR9xxUkEGbdiACdcsoQPOgMIvNMYNnSD96it/hU31RIqoTUdEYoN+qKs4bjmMnlGuZ0uLSVQDJ/cLAvjp33QXnfHZbJXulakzgkKecsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762948244; c=relaxed/relaxed;
	bh=NbAH9ltoJxJkHN8bSWaXy1SJilPSqT6BewxNoTRwLHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6pAifVwNTgcauW1bGxKiWLCdns4jaW90+u0fyTT0eYGWe0NvLw/vHAmHGh64piCtRBRFtFN8PhxWl19r+ykrwMTSjxgGQdarK05vDIDj54I8RGKCn0L/KLi8Y7kY1MBZk+J4ZXAr8KzuSwGZJfwS3EoQq0hC0f9N07ymVHbittYckxlzCmbxKA/+wlN5GZY+ks/tzVkRqq2JoEBvFtgfXS+R8XGROALARknoWQsGR7vals1tlsvIz0gAzyoaz57R+mENeJDWGZj7L+ZpMFOdkz8eEYVi4ThM003Np9h3R1f3yPFlMAJaj5fRQkJgotYx1gzO3KQBqKQfj2u9HA4kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d61tq6RB2z2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 22:50:43 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d616J1lGlz9sSb;
	Wed, 12 Nov 2025 12:15:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDngTuJZ3gRw; Wed, 12 Nov 2025 12:15:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d616J0kqSz9sSZ;
	Wed, 12 Nov 2025 12:15:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 03A088B76E;
	Wed, 12 Nov 2025 12:15:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WbBSOMNQv6aS; Wed, 12 Nov 2025 12:15:35 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 69C278B764;
	Wed, 12 Nov 2025 12:15:35 +0100 (CET)
Message-ID: <caf091d5-6122-4cd7-bdbd-88b3f9a4029e@csgroup.eu>
Date: Wed, 12 Nov 2025 12:15:35 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc, mm: Fix mprotect on book3s 32-bit
To: Dave Vasilevsky <dave@vasilevsky.ca>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nadav Amit <nadav.amit@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ritesh Harjani <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mm@kvack.org
References: <20251111-vasi-mprotect-g3-v2-1-881c94afbc42@vasilevsky.ca>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251111-vasi-mprotect-g3-v2-1-881c94afbc42@vasilevsky.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 11/11/2025 à 22:42, Dave Vasilevsky a écrit :
> On 32-bit book3s with hash-MMUs, tlb_flush() was a no-op. This was
> unnoticed because all uses until recently were for unmaps, and thus
> handled by __tlb_remove_tlb_entry().
> 
> After commit 4a18419f71cd ("mm/mprotect: use mmu_gather") in kernel 5.19,
> tlb_gather_mmu() started being used for mprotect as well. This caused
> mprotect to simply not work on these machines:
> 
>    int *ptr = mmap(NULL, 4096, PROT_READ|PROT_WRITE,
>                    MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
>    *ptr = 1; // force HPTE to be created
>    mprotect(ptr, 4096, PROT_READ);
>    *ptr = 2; // should segfault, but succeeds
> 
> Fixed by making tlb_flush() actually flush TLB pages. This finally
> agrees with the behaviour of boot3s64's tlb_flush().
> 
> Fixes: 4a18419f71cd ("mm/mprotect: use mmu_gather")
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> Cc: stable@vger.kernel.org

A small comment below

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> Changes in v2:
> - Flush entire TLB if full mm is requested.
> - Link to v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20251027-vasi-mprotect-g3-v1-1-3c5187085f9a%40vasilevsky.ca&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C7b1beec4921c4c67c95108de216b416f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638984941704616710%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mJL3gS4YkTUAWmivSWL5AE9BlhAQ0R%2FI3eBwYwN26nA%3D&reserved=0
> ---
>   arch/powerpc/include/asm/book3s/32/tlbflush.h | 8 ++++++--
>   arch/powerpc/mm/book3s32/tlb.c                | 9 +++++++++
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> index e43534da5207aa3b0cb3c07b78e29b833c141f3f..b8c587ad2ea954f179246a57d6e86e45e91dcfdc 100644
> --- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> @@ -11,6 +11,7 @@
>   void hash__flush_tlb_mm(struct mm_struct *mm);
>   void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
>   void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
> +void hash__flush_gather(struct mmu_gather *tlb);
>   
>   #ifdef CONFIG_SMP
>   void _tlbie(unsigned long address);
> @@ -28,9 +29,12 @@ void _tlbia(void);
>    */
>   static inline void tlb_flush(struct mmu_gather *tlb)
>   {
> -	/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
> -	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
> +		hash__flush_gather(tlb);
> +	} else {
> +		/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
>   		_tlbia();
> +	}

You should keep the comment on 603 outside the if/else and remove the 
braces, in line with 
https://docs.kernel.org/process/coding-style.html#placing-braces-and-spaces

>   }
>   
>   static inline void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
> diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
> index 9ad6b56bfec96e989b96f027d075ad5812500854..e54a7b0112322e5818d80facd2e3c7722e6dd520 100644
> --- a/arch/powerpc/mm/book3s32/tlb.c
> +++ b/arch/powerpc/mm/book3s32/tlb.c
> @@ -105,3 +105,12 @@ void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
>   		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
>   }
>   EXPORT_SYMBOL(hash__flush_tlb_page);
> +
> +void hash__flush_gather(struct mmu_gather *tlb)
> +{
> +	if (tlb->fullmm || tlb->need_flush_all)
> +		hash__flush_tlb_mm(tlb->mm);
> +	else
> +		hash__flush_range(tlb->mm, tlb->start, tlb->end);
> +}
> +EXPORT_SYMBOL(hash__flush_gather);
> 
> ---
> base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
> change-id: 20251027-vasi-mprotect-g3-f8f5278d4140
> 
> Best regards,


