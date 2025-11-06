Return-Path: <linuxppc-dev+bounces-13873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DFCC3A459
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:32:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JRH229Cz3bvd;
	Thu,  6 Nov 2025 21:32:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762425147;
	cv=none; b=e7X8GrL/hkTlyHMxO5KrN8+MJuXq88j0FYffg+ZTLB1TPGCI73eT36C/5LEMi/EWyFabkfESXqFFmpkCn+D3VhU4J4aQpBNweqNIlc1ogoygIDTaqd3iFW67jqAGpHJJLJaD6kCzpj5S161pN+ujtoWjDJRwfASOyPFA2UY3Q7WnKTtlUPjiUJPDvpEFsnm1B3/JMxaXQMcVbtlwdd/T6JWBEb4HaBpM0yHcbGsSZDR0Sd8u0h6DLGgZVGVlw9kNtRf8mDi9tuZY9/k9LKnXbvhv+EIdOgi7RUGOl5ckQZ987/zUZtoBW4Mh/cTx4XN4tQzTf9kxPn8i0ils/6VfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762425147; c=relaxed/relaxed;
	bh=lxG5Nj7vA2GY+pfuaL7Y4EXztLcXNaDp/nJB+qgTjiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEqgDCPGT1v0g8C0fFyUqyc6EHsvl2UXLR+nRblzyly7fZfyc6RTAvhqoXeaj0YYuwcTtPCTFN+aGkgBGKTrlAoxkZTmVENGrz2GL0naCU4U4W5wrhKhcMRXv2+H9Vu+bVAOy+yTgNOM0AFQ7CvBbJfjZQYPsbZmsrBS49KXUovirv/HfYazdmmDYW8mJMhAiLro9YmLUkc4azLFIJQT2vVTLCQcO1hlwOByameVLzyGTIstzK4/N9kx+Zn2cE2RM4MWw4upsLgGOHgbnqxE5a9286qcPL7Z2MXAb9KNS6RXDo3rlbDMOxoCp0MN5aFzrBsZccis7NJ6GqpwzIHu9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JRG3TWXz3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:32:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87B131596;
	Thu,  6 Nov 2025 02:31:47 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32C3E3F66E;
	Thu,  6 Nov 2025 02:31:49 -0800 (PST)
Message-ID: <0276c749-9418-47ea-85f1-0b0ab93b0225@arm.com>
Date: Thu, 6 Nov 2025 10:31:46 +0000
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
Subject: Re: [PATCH v4 03/12] powerpc/mm: implement arch_flush_lazy_mmu_mode()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-4-kevin.brodsky@arm.com>
 <87pl9x41c5.ritesh.list@gmail.com> <87jz044xn4.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87jz044xn4.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/11/2025 09:49, Ritesh Harjani (IBM) wrote:
> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>
>> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>>
>>> Upcoming changes to the lazy_mmu API will cause
>>> arch_flush_lazy_mmu_mode() to be called when leaving a nested
>>> lazy_mmu section.
>>>
>>> Move the relevant logic from arch_leave_lazy_mmu_mode() to
>>> arch_flush_lazy_mmu_mode() and have the former call the latter.
>>>
>>> Note: the additional this_cpu_ptr() on the
>>> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
>>> patch.
>>>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>> index 146287d9580f..7704dbe8e88d 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>>  	batch->active = 1;
>>>  }
>>>  
>>> +static inline void arch_flush_lazy_mmu_mode(void)
>>> +{
>>> +	struct ppc64_tlb_batch *batch;
>>> +
>>> +	batch = this_cpu_ptr(&ppc64_tlb_batch);
>>> +
>>> +	if (batch->index)
>>> +		__flush_tlb_pending(batch);
>>> +}
>>> +
>> This looks a bit scary since arch_flush_lazy_mmu_mode() is getting
>> called from several of the places in later patches(). 
>>
>> Although I think arch_flush_lazy_mmu_mode() will only always be called
>> in nested lazy mmu case right?
>>
>> Do you think we can add a VM_BUG_ON(radix_enabled()); in above to make
>> sure the above never gets called in radix_enabled() case. 
>>
>> I am still going over the patch series, but while reviewing this I
>> wanted to take your opinion.
>>
>> Ohh wait.. There is no way of knowing the return value from
>> arch_enter_lazy_mmu_mode().. I think you might need a similar check to
>> return from arch_flush_lazy_mmu_mode() too, if radix_enabled() is true.
>>
> Now that I have gone through this series, it seems plaussible that since
> lazy mmu mode supports nesting, arch_flush_lazy_mmu_mode() can get
> called while the lazy mmu is active due to nesting.. 
>
> That means we should add the radix_enabled() check as I was talking in
> above i.e. 
>
> @@ -38,6 +38,9 @@ static inline void arch_flush_lazy_mmu_mode(void)
>  {
>         struct ppc64_tlb_batch *batch;
>
> +       if (radix_enabled())
> +               return;
> +
>         batch = this_cpu_ptr(&ppc64_tlb_batch);
>
>         if (batch->index)
>
> Correct? Although otherwise also I don't think it should be a problem
> because batch->index is only valid during hash, but I still think we can
> add above check so that we don't have to call this_cpu_ptr() to check
> for batch->index whenever flush is being called.

You're right! I missed this because v3 had an extra patch (13) that
turned all the lazy_mmu_mode_* into no-ops if radix_enabled(). The
optimisation didn't seem to be worth the noise so I dropped it, but it
does mean that arch_flush() will now be called in the nested case
regardless of radix_enabled().

Will fix in v5, thanks!

- Kevin

