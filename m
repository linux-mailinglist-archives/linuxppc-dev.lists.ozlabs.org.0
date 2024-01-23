Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8548838C28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 11:35:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK3Q75Pl9z3cVk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 21:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK3Pj0H9Qz30h8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 21:35:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C5E1FB;
	Tue, 23 Jan 2024 02:35:14 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD0EF3F5A1;
	Tue, 23 Jan 2024 02:34:23 -0800 (PST)
Message-ID: <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
Date: Tue, 23 Jan 2024 10:34:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240122194200.381241-2-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/01/2024 19:41, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm/include/asm/pgtable.h   | 2 ++
>  arch/arm64/include/asm/pgtable.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> index d657b84b6bf70..be91e376df79e 100644
> --- a/arch/arm/include/asm/pgtable.h
> +++ b/arch/arm/include/asm/pgtable.h
> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>  extern void __sync_icache_dcache(pte_t pteval);
>  #endif
>  
> +#define PFN_PTE_SHIFT		PAGE_SHIFT
> +
>  void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		      pte_t *ptep, pte_t pteval, unsigned int nr);
>  #define set_ptes set_ptes
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 79ce70fbb751c..d4b3bd96e3304 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -341,6 +341,8 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
>  		mte_sync_tags(pte, nr_pages);
>  }
>  
> +#define PFN_PTE_SHIFT		PAGE_SHIFT

I think this is buggy. And so is the arm64 implementation of set_ptes(). It
works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
kept contigously, so if you happen to be setting a mapping for which the
physical memory block straddles bit 48, this won't work.

Today, only the 64K base page config can support 52 bits, and for this,
OA[51:48] are stored in PTE[15:12]. But 52 bits for 4K and 16K base pages is
coming (hopefully v6.9) and in this case OA[51:50] are stored in PTE[9:8].
Fortunately we already have helpers in arm64 to abstract this.

So I think arm64 will want to define its own pte_next_pfn():

#define pte_next_pfn pte_next_pfn
static inline pte_t pte_next_pfn(pte_t pte)
{
	return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
}

I'll do a separate patch to fix the already broken arm64 set_ptes() implementation.

I'm not sure if this type of problem might also apply to other arches?


> +
>  static inline void set_ptes(struct mm_struct *mm,
>  			    unsigned long __always_unused addr,
>  			    pte_t *ptep, pte_t pte, unsigned int nr)

