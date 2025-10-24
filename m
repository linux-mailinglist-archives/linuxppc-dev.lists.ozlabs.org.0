Return-Path: <linuxppc-dev+bounces-13281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51968C06CF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 16:55:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQtl69pGz3c5j;
	Sat, 25 Oct 2025 01:55:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761317727;
	cv=none; b=B4h1Iz0zfkiTeZZN3lgtIedWJQcYpkycAxkM3dPusnFAiXnW6ZR0sgr6shedY6brYwffzmNue1r3m0gQmiEaoTFhDrDTOcCc16pqEBxB72y69N8N4BafmAE6zkF1u52tzLqjIXer61VnbsL1eBlC9SCyj22v+B/9pr3a40jmDZOlU2eayb9cytNTSMd/YIofAGuuvM4tHe9LitPxzJtRrMDKFwvz0qwazbzlzRVeSlEKiw5OFh6LzU3hY40C1qQMJB+P5ehV+IxkrD+UiIVQqkhLWok6P42yazp8Hn1lnApc3imQkTAl/orzGVk7zAEDQJsyYIN0PVy7sW1Yce6eBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761317727; c=relaxed/relaxed;
	bh=TLTn/UbQmcHWmadVul4cDw8XkcAbkv+aTx0AlM7M7aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgbQYB9CDniI/U70fb75TCZApAxRdD0DWjWu9mA9nF0iVyqqpqNIpKDfVyd5eKz9iQqEchb0YuAbJAcBQLpyvTLc5ulBEMS2svn/YVpeFgvNg5O1YwekAg9dqQDc6qdDgq7EiKwQRudaAImHKeIhYQeFjHS2EIZ/U8t2O9KHF2nNtAGZOziLeDoasmRrVn0zhjCCty51qVSAkWSldmI4yBSQoRhCEU+cld8p80t968cOzapwXtgs2M+Ska7BlNHr3oBUq1pAokCqhnMUgpzbAe/Ar0pXznKnC/Ca51IcYnapbX0z/xnKvtyFkmaykfuWYYtPGXeNOm5l/9B6jEi/pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQtl04BTz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 01:55:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AF2F1424;
	Fri, 24 Oct 2025 07:54:47 -0700 (PDT)
Received: from [10.57.67.38] (unknown [10.57.67.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10A0E3F63F;
	Fri, 24 Oct 2025 07:54:47 -0700 (PDT)
Message-ID: <1b658758-73dc-4e53-aa7f-696f59067067@arm.com>
Date: Fri, 24 Oct 2025 16:54:44 +0200
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
Subject: Re: [PATCH v3 03/13] powerpc/mm: implement arch_flush_lazy_mmu_mode()
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-4-kevin.brodsky@arm.com>
 <60c55686-87dd-46d0-884e-80f7d423663b@redhat.com>
 <604f26cb-46c6-4533-8110-0b174eed821d@arm.com>
 <5d5a85ec-0213-4af3-92a9-c02bb13da073@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5d5a85ec-0213-4af3-92a9-c02bb13da073@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/10/2025 16:42, David Hildenbrand wrote:
> On 24.10.25 14:09, Kevin Brodsky wrote:
>> On 23/10/2025 21:36, David Hildenbrand wrote:
>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>> [...]
>>>>
>>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>>> b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>>> index 146287d9580f..7704dbe8e88d 100644
>>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>>> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>>>        batch->active = 1;
>>>>    }
>>>>    +static inline void arch_flush_lazy_mmu_mode(void)
>>>> +{
>>>> +    struct ppc64_tlb_batch *batch;
>>>> +
>>>> +    batch = this_cpu_ptr(&ppc64_tlb_batch);
>>>
>>> The downside is the double this_cpu_ptr() now on the
>>> arch_leave_lazy_mmu_mode() path.
>>
>> This is only temporary, patch 9 removes it from arch_enter(). I don't
>> think having a redundant this_cpu_ptr() for a few commits is really a
>> concern?
>
> Oh, right. Consider mentioning in the patch description
>
> "Note that follow-up patches will remove the double this_cpu_ptr() on
> the arch_leave_lazy_mmu_mode() path again." 

Sounds good, will do.

- Kevin

