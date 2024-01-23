Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5860838D42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 12:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK4Mk4q4lz3vhS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 22:18:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK4Lx2r7mz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 22:17:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AAB21FB;
	Tue, 23 Jan 2024 03:17:58 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436DD3F762;
	Tue, 23 Jan 2024 03:17:09 -0800 (PST)
Message-ID: <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
Date: Tue, 23 Jan 2024 11:17:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/01/2024 11:02, David Hildenbrand wrote:
> On 23.01.24 11:48, David Hildenbrand wrote:
>> On 23.01.24 11:34, Ryan Roberts wrote:
>>> On 22/01/2024 19:41, David Hildenbrand wrote:
>>>> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
>>>> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
>>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    arch/arm/include/asm/pgtable.h   | 2 ++
>>>>    arch/arm64/include/asm/pgtable.h | 2 ++
>>>>    2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
>>>> index d657b84b6bf70..be91e376df79e 100644
>>>> --- a/arch/arm/include/asm/pgtable.h
>>>> +++ b/arch/arm/include/asm/pgtable.h
>>>> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>>>>    extern void __sync_icache_dcache(pte_t pteval);
>>>>    #endif
>>>>    +#define PFN_PTE_SHIFT        PAGE_SHIFT
>>>> +
>>>>    void set_ptes(struct mm_struct *mm, unsigned long addr,
>>>>                  pte_t *ptep, pte_t pteval, unsigned int nr);
>>>>    #define set_ptes set_ptes
>>>> diff --git a/arch/arm64/include/asm/pgtable.h
>>>> b/arch/arm64/include/asm/pgtable.h
>>>> index 79ce70fbb751c..d4b3bd96e3304 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -341,6 +341,8 @@ static inline void __sync_cache_and_tags(pte_t pte,
>>>> unsigned int nr_pages)
>>>>            mte_sync_tags(pte, nr_pages);
>>>>    }
>>>>    +#define PFN_PTE_SHIFT        PAGE_SHIFT
>>>
>>> I think this is buggy. And so is the arm64 implementation of set_ptes(). It
>>> works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
>>> kept contigously, so if you happen to be setting a mapping for which the
>>> physical memory block straddles bit 48, this won't work.
>>
>> Right, as soon as the PTE bits are not contiguous, this stops working,
>> just like set_ptes() would, which I used as orientation.
>>
>>>
>>> Today, only the 64K base page config can support 52 bits, and for this,
>>> OA[51:48] are stored in PTE[15:12]. But 52 bits for 4K and 16K base pages is
>>> coming (hopefully v6.9) and in this case OA[51:50] are stored in PTE[9:8].
>>> Fortunately we already have helpers in arm64 to abstract this.
>>>
>>> So I think arm64 will want to define its own pte_next_pfn():
>>>
>>> #define pte_next_pfn pte_next_pfn
>>> static inline pte_t pte_next_pfn(pte_t pte)
>>> {
>>>     return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
>>> }
>>>
> 
> Digging into the details, on arm64 we have:
> 
> #define pte_pfn(pte)           (__pte_to_phys(pte) >> PAGE_SHIFT)
> 
> and
> 
> #define __pte_to_phys(pte)     (pte_val(pte) & PTE_ADDR_MASK)
> 
> But that implies, that upstream the PFN is always contiguous, no?
> 


But __pte_to_phys() and __phys_to_pte_val() depend on a Kconfig. If PA bits is
52, the bits are not all contiguous:

#ifdef CONFIG_ARM64_PA_BITS_52
static inline phys_addr_t __pte_to_phys(pte_t pte)
{
	return (pte_val(pte) & PTE_ADDR_LOW) |
		((pte_val(pte) & PTE_ADDR_HIGH) << PTE_ADDR_HIGH_SHIFT);
}
static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
{
	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PTE_ADDR_MASK;
}
#else
#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_MASK)
#define __phys_to_pte_val(phys)	(phys)
#endif

