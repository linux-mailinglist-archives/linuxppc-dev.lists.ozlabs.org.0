Return-Path: <linuxppc-dev+bounces-14458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F72FC81100
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 15:37:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFT1S14TJz30Vf;
	Tue, 25 Nov 2025 01:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763995036;
	cv=none; b=YrrEMuH81FVDz8wlz1VAVH/y5jMEF9Fxan6V+o0GkdQco6JywlQQh/CJUBkFCHeC1mUB8eH0Z6VTYp9UsAkNETLKN5r+YqXr/YdC6zBA76WjpIyQn9UWM00BxzJVhpzPQ6FVLY9Lk81YZRs0af/uZDTwuMOf3Vr/7pSp4DXrhfmaT7sO8Fk6p8CT2W3yIWynzqULYwBh8L7EJhwjgbUskjUaiD3XtKeJPaPpTOmTUFgdDm/bWEZA3PNLrgj9SvebeK5ncm7aTjZUbWostSluLouQsDdlX/w3j3wYB8klmQkVLdBSDpGebiTwSH0YZpDrak9D0FJXzOOtkQd8+vmzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763995036; c=relaxed/relaxed;
	bh=YJ471huPf3AbbCsoCzRDaoFvk+dd/VjhisJknTSiicY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YprkUSk/FI88kiRn7tc8J1L+qbv8FvqP4p6PHc5kDREMXpKBGg2L3YkpBwfxWcREL8/dUfDrqEu6Zo2SCXxu3qFzuZ8kl2fw2C2xMaaBWcO28lCtkp1E6UHI1aX7UwOogtfoMNDTVT3vroSnJvKzyG13GopVA9BVLVxvl79p5E8n3T20jJlyg+h72W6dyhHIM1NKBIgaKlKai1m8R/8NS6CNdCCBQ6PDzj1hsIt8WD018D3TCq1hQI2NHDnf5KD1hK4Tszy912tsfusH4cQSnyTTP7+J4VeqePUqNTFyaTXAa4GvGeTJ68WwowrOJeg3cjb4zs/d5PHoFeI5KUoCTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFT1Q6mDpz302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 01:37:12 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80775497;
	Mon, 24 Nov 2025 06:36:32 -0800 (PST)
Received: from [10.57.88.238] (unknown [10.57.88.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94CBA3F6A8;
	Mon, 24 Nov 2025 06:36:34 -0800 (PST)
Message-ID: <b52726c7-ea9c-4743-a68d-3eafce4e5c61@arm.com>
Date: Mon, 24 Nov 2025 14:36:32 +0000
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
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
 <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
 <f36ebc15-c724-487a-8e4a-9ca95edc544a@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <f36ebc15-c724-487a-8e4a-9ca95edc544a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/11/2025 12:47, Kevin Brodsky wrote:
> On 10/11/2025 11:45, Kevin Brodsky wrote:
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index b8d37eb037fc..d9c8e94f140f 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -731,7 +731,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>>>  		return -EINVAL;
>>>>  
>>>>  	mutex_lock(&pgtable_split_lock);
>>>> -	arch_enter_lazy_mmu_mode();
>>>> +	lazy_mmu_mode_enable();
>>>>  
>>>>  	/*
>>>>  	 * The split_kernel_leaf_mapping_locked() may sleep, it is not a
>>> This is a bit unfortunate, IMHO. The rest of this comment explains that although
>>> you're not supposed to sleep inside lazy mmu mode, it's fine for arm64's
>>> implementation. But we are no longer calling arm64's implementation; we are
>>> calling a generic function, which does who knows what.
>>>
>>> I think it all still works, but we are no longer containing our assumptions in
>>> arm64 code. We are relying on implementation details of generic code.
>> I see your point. The change itself is still correct (and required
>> considering patch 8), but maybe the documentation of the generic
>> interface should be clarified to guarantee that the generic layer can
>> itself cope with sleeping - without any guarantee regarding the
>> behaviour of arch_*_lazy_mmu_mode.
> 
> Re-reading the existing comment in <linux/pgtable.h>, I think it already
> makes clear that sleeping is not forbidden by design:
> 
>>  * In the general case, no lock is guaranteed to be held between entry
>> and exit
>>  * of the lazy mode. So the implementation must assume preemption may
>> be enabled
>>  * and cpu migration is possible; it must take steps to be robust
>> against this.
> 
> The arch implementation may disable preemption, but arm64 code can rely
> on the arm64 implementation allowing sleeping.

Yeah ok, I buy that!

> 
> - Kevin
> 


