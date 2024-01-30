Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A17841F9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 10:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPKkw37Nhz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 20:34:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPKjw4jmhz3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 20:33:55 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54663DA7;
	Tue, 30 Jan 2024 01:34:08 -0800 (PST)
Received: from [10.57.79.54] (unknown [10.57.79.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8A173F738;
	Tue, 30 Jan 2024 01:33:21 -0800 (PST)
Message-ID: <b2a8b612-1e7a-4cd2-97c3-cf9a304e9a3d@arm.com>
Date: Tue, 30 Jan 2024 09:33:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/9] mm/mmu_gather: add tlb_remove_tlb_entries()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-9-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129143221.263763-9-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Nick Piggin <npiggin@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/01/2024 14:32, David Hildenbrand wrote:
> Let's add a helper that lets us batch-process multiple consecutive PTEs.
> 
> Note that the loop will get optimized out on all architectures except on
> powerpc. We have to add an early define of __tlb_remove_tlb_entry() on
> ppc to make the compiler happy (and avoid making tlb_remove_tlb_entries() a
> macro).
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/powerpc/include/asm/tlb.h |  2 ++
>  include/asm-generic/tlb.h      | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
> index b3de6102a907..1ca7d4c4b90d 100644
> --- a/arch/powerpc/include/asm/tlb.h
> +++ b/arch/powerpc/include/asm/tlb.h
> @@ -19,6 +19,8 @@
>  
>  #include <linux/pagemap.h>
>  
> +static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
> +					  unsigned long address);
>  #define __tlb_remove_tlb_entry	__tlb_remove_tlb_entry
>  
>  #define tlb_flush tlb_flush
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index 428c3f93addc..bd00dd238b79 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -616,6 +616,26 @@ static inline void tlb_flush_p4d_range(struct mmu_gather *tlb,
>  		__tlb_remove_tlb_entry(tlb, ptep, address);	\
>  	} while (0)
>  
> +/**
> + * tlb_remove_tlb_entries - remember unmapping of multiple consecutive ptes for
> + *			    later tlb invalidation.
> + *
> + * Similar to tlb_remove_tlb_entry(), but remember unmapping of multiple
> + * consecutive ptes instead of only a single one.
> + */
> +static inline void tlb_remove_tlb_entries(struct mmu_gather *tlb,
> +		pte_t *ptep, unsigned int nr, unsigned long address)
> +{
> +	tlb_flush_pte_range(tlb, address, PAGE_SIZE * nr);
> +	for (;;) {
> +		__tlb_remove_tlb_entry(tlb, ptep, address);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		address += PAGE_SIZE;
> +	}
> +}
> +
>  #define tlb_remove_huge_tlb_entry(h, tlb, ptep, address)	\
>  	do {							\
>  		unsigned long _sz = huge_page_size(h);		\

