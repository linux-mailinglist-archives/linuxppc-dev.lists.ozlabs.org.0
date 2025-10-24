Return-Path: <linuxppc-dev+bounces-13276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B836C06B5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 16:34:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQQ611sVz3c5f;
	Sat, 25 Oct 2025 01:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761316446;
	cv=none; b=RUDmdwCN0yFn3jSdrZRsuMwPEB+RLotktL3Dz7Tt6CFaziR+TRVxIIX5+RjmpJVBy9zOfWmyefYtVSlgfSC9ROifpe0GotBLtZx56W6+V9J84cyWUUsqZ1NE/Oek4IzdX26uD6avYD+Q6J4vhUoLa2tiPwtBrYoN4GCZL+tZTme/MvHaQFI0MIFuzB1gkNa4qcla4bNLvTRnTyJtkpj2LXeKGDnUPLpZDcllB+jguXDitrd0CVzlJlHaQO+qKzGYQsNHvgxZHtBmVSlbGfJHsj/G5zldxg6Wdc/2s39OXW47ouMTmZQuVHDnNPRTvIym/cpzYowIYOEzu9ZhGU8K5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761316446; c=relaxed/relaxed;
	bh=a+NzFcJxTQ88UObe6RCiomPcPFxCGLX+axvPSVA7A04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mI4Xc3nfNOkOUVUJ3731PG2+1ku59vReWHQFOlyrMCKxVqfsxb+Q+tOGPS0xrL01vHdIs5bBEl5nJpjclJg53Ql0ABpASIk/j12SiVf7uylRPe2g9zaTlNUZWuaEzqZlWGnrUE9+cKUMwk2LYdUbfkwjL3FtMDJPg4OTxeCJaeoSj4/Un/2n3UNlud8v12WmxsU4fl53Q8gJVkJL/bsHuSYd5exJLdSGD/wK+2flPXwlXR5aEvspdwRhqC/VvEEkl1n84CNVEZZ3Gdcp3+Pem0Z4dpSrsoIf+X2w0gLv4Id+RzcoYH2UfxDzub+1ZSSM1x3YZZc8Cy5+2i7nFxKP1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQQ52ghQz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 01:34:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66B1C1516;
	Fri, 24 Oct 2025 07:33:26 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7FEF3F66E;
	Fri, 24 Oct 2025 07:33:25 -0700 (PDT)
Message-ID: <f458fbed-266b-48a5-a6e0-745dc2893a34@arm.com>
Date: Fri, 24 Oct 2025 16:33:21 +0200
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
Subject: Re: [PATCH v3 07/13] mm: enable lazy_mmu sections to nest
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
 <20251015082727.2395128-8-kevin.brodsky@arm.com>
 <2073294c-8003-451a-93e0-9aab81de4d22@redhat.com>
 <7a4e136b-66a5-4244-ab07-f0bcc3a26a83@arm.com>
 <af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/10/2025 15:23, David Hildenbrand wrote:
>>>> + * currently enabled.
>>>>     */
>>>>    #ifdef CONFIG_ARCH_LAZY_MMU
>>>>    static inline void lazy_mmu_mode_enable(void)
>>>>    {
>>>> -    arch_enter_lazy_mmu_mode();
>>>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +    VM_BUG_ON(state->count == U8_MAX);
>>>
>>> No VM_BUG_ON() please.
>>
>> I did wonder if this would be acceptable!
>
> Use VM_WARN_ON_ONCE() and let early testing find any such issues.
>
> VM_* is active in debug kernels only either way! :)

That was my intention - I don't think the checking overhead is justified
in production.

>
> If you'd want to handle this in production kernels you'd need
>
> if (WARN_ON_ONCE()) {
>     /* Try to recover */
> }
>
> And that seems unnecessary/overly-complicated for something that
> should never happen, and if it happens, can be found early during testing.

Got it. Then I guess I'll go for a VM_WARN_ON_ONCE() (because indeed
once the overflow/underflow occurs it'll go wrong on every
enable/disable pair).

>
>>
>> What should we do in case of underflow/overflow then? Saturate or just
>> let it wrap around? If an overflow occurs we're probably in some
>> infinite recursion and we'll crash anyway, but an underflow is likely
>> due to a double disable() and saturating would probably allow to
>> recover.
>>
>>>
>>>> +    /* enable() must not be called while paused */
>>>> +    VM_WARN_ON(state->count > 0 && !state->enabled);
>>>> +
>>>> +    if (state->count == 0) {
>>>> +        arch_enter_lazy_mmu_mode();
>>>> +        state->enabled = true;
>>>> +    }
>>>> +    ++state->count;
>>>
>>> Can do
>>>
>>> if (state->count++ == 0) {
>>
>> My idea here was to have exactly the reverse order between enable() and
>> disable(), so that arch_enter() is called before lazy_mmu_state is
>> updated, and arch_leave() afterwards. arch_* probably shouldn't rely on
>> this (or care), but I liked the symmetry.
>
> I see, but really the arch callback should never have to care about that
> value -- unless something is messed up :)

Fair enough, then I can fold those increments/decrements ;)

- Kevin

