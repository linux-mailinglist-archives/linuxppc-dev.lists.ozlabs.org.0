Return-Path: <linuxppc-dev+bounces-14002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA13C460BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mcg129mz2yv0;
	Mon, 10 Nov 2025 21:49:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762771747;
	cv=none; b=S0dCx55gtDfOho7b+qtjnEqPVWzalm65zwSNbRONqg+QjK19OPOWPAzogevteoxIGgfnYgRC7b18B5qruvqV0cKIVWYnzzoLvLU1jEvVKhx10Td61l5K7PK/n9Deq8CK7o2+Qpb7fDN5UcmtfPOgGS7yTQsuR9l1DSQ8EqIEYqrASeVYvrcfZb4QCHzpVLldNXTtc6v+lBHb8N+8qp9NHoQV4yuh5XLtNp+kvtMIpEtE0Wm+YqOMCcCl4TFmiXbkeVz0mjDH8P/VZj1xkc4+brePO1Q1dPuqeYFtP3DTJqx4AyJdeNsHLcfRtrX+JI62Y7FS1F2NgrtEBmYdyOxx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762771747; c=relaxed/relaxed;
	bh=xJe9RrZUlICJVKVCCId7WIyPyCMLhCd5HXbbl2Kr8tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I40alA+PizFiFNlpux+59G//QTV0PJdtuSgYPErT7/dxUylcDWIP7CnWP7uJXP4JZIOXwRgzvZ59j2UcbxUYyrposZZA2RQt/Q+CBEEyKoCTQVQr0ffJaZEpYlfGNzrzKvsb8+KEGGB0Tve1RguA0B2BejN/k6N/OhPZUFZqaxbGK4fIp6TthjKNnKHzL1MDt2FRlmYOV43ujz1xEjzXBbF1qOZnPbnmjQI3Z+++jlkr1YtSQHx6LE4RvvmIuPjOPSa9Q+fhXFyTGw1ERSqUMVIatLGQbeLQ207O9FJrz4+Vh7/eFdhjhAYAUfDupjKepq7XHkWeKdvZuNC+oXqinw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mcf2XZhz2xql
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 21:49:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BB20497;
	Mon, 10 Nov 2025 02:48:27 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51E03F66E;
	Mon, 10 Nov 2025 02:48:27 -0800 (PST)
Message-ID: <f7ed51e6-c3f6-402c-b328-8af5f970006d@arm.com>
Date: Mon, 10 Nov 2025 11:48:24 +0100
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
Subject: Re: [PATCH v4 12/12] mm: bail out of lazy_mmu_mode_* in interrupt
 context
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-13-kevin.brodsky@arm.com>
 <8a38db66-4d1a-4296-a2dc-e0276c6cdde8@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <8a38db66-4d1a-4296-a2dc-e0276c6cdde8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/11/2025 15:42, Ryan Roberts wrote:
> On 29/10/2025 10:09, Kevin Brodsky wrote:
>> The lazy MMU mode cannot be used in interrupt context. This is
>> documented in <linux/pgtable.h>, but isn't consistently handled
>> across architectures.
>>
>> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
>> interrupt context, because such calls do occur in certain
>> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
>> batching in interrupt contexts"). Other architectures do not check
>> this situation, most likely because it hasn't occurred so far.
>>
>> Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
>> disabled while in interrupt mode (see queue_pte_barriers() and
>> xen_get_lazy_mode() respectively).
>>
>> Let's handle this in the new generic lazy_mmu layer, in the same
>> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt(), and
>> have in_lazy_mmu_mode() return false to disable any optimisation.
>> Also remove the arm64 handling that is now redundant; x86/Xen has
>> its own internal tracking so it is left unchanged.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 17 +----------------
>>  include/linux/pgtable.h          | 16 ++++++++++++++--
>>  include/linux/sched.h            |  3 +++
>>  3 files changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 61ca88f94551..96987a49e83b 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -62,37 +62,22 @@ static inline void emit_pte_barriers(void)
>>  
>>  static inline void queue_pte_barriers(void)
>>  {
>> -	if (in_interrupt()) {
>> -		emit_pte_barriers();
>> -		return;
>> -	}
>> -
>>  	if (in_lazy_mmu_mode())
>>  		test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);
>>  	else
>>  		emit_pte_barriers();
>>  }
>>  
>> -static inline void arch_enter_lazy_mmu_mode(void)
>> -{
>> -	if (in_interrupt())
>> -		return;
>> -}
>> +static inline void arch_enter_lazy_mmu_mode(void) {}
>>  
>>  static inline void arch_flush_lazy_mmu_mode(void)
>>  {
>> -	if (in_interrupt())
>> -		return;
>> -
>>  	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>>  		emit_pte_barriers();
>>  }
>>  
>>  static inline void arch_leave_lazy_mmu_mode(void)
>>  {
>> -	if (in_interrupt())
>> -		return;
>> -
>>  	arch_flush_lazy_mmu_mode();
>>  }
> Ahh ok, by the time you get to the final state, I think a most of my
> comments/concerns are solved. Certainly this now looks safe for the interrupt
> case, whereas I think the intermediate state when you initially introduce
> nesting is broken. So perhaps you want to look at how to rework it to prevent that.


Agreed, as discussed on patch 7. I might split this patch - first add
the in_interrupt() checks before patch 7, and then remove the
now-redundant checks on arm64.

- Kevin

