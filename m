Return-Path: <linuxppc-dev+bounces-13703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A4C2D98C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 19:09:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0fk00kvMz2yrm;
	Tue,  4 Nov 2025 05:09:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762193367;
	cv=none; b=egkchrZMTc+CIXstDCtCh7vdhleakMYoqfiwWE0Tb2VAPokFvfXALKLjP0SP6x0xIq11UOE6NldYjDa2FzEDPBmvBWzqoTKpNAO7PjvK/17yaImgmVD2W/VlCh3NNRGT2lX6UttLRiKwF2CPfRhCb5OBf6dW0+PRooBD4a2mahYvBc9IFym//iikPsp92IfiynTAPxBV/J/3s6sFkHbdHMvbxcaGosZzqNGabGBhR0Pb/jcg0eH3XVq+G87OkUTxkwp1fuV2TlrU8fGPEaUlZqA3p7Xsy4Kowr053fb7J4j8u33hqIuUg5urGL8NXNUzLMMmdr5T57P0e+UbkTcQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762193367; c=relaxed/relaxed;
	bh=oMupISCSYd/eNzrdMLFaLu2UlclpMU6/awU7/8GJBY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsBcpVnT9XcW5ge5FLF4NLJ90Tyu5PTQBDuthQfO9paukY3VEAyIbRh9GI1BMQekK47yTcQs64jp8EG0cNTkndLGmfQLOZ9u0RnyM34tTS/djpFnidLnzOa1g2qFQ6fWwPOH9S29lNQmzzHtQT59VBdJ5Rca43BtbFvjKGtqzWyvV0OgRUw8Bxf1NmZWxGhJYC9+p9cFyazFMvXn4Eap6hPEr8hxsGhAQTreRzfxkTHsaLocBMexPCvypRznIpRkKevedAwk0TeJ9+xH3QhC+TLB925R0GcKsiaayXtwggugoFkrTCSAOZlrOQ4tKb2Fu0ej8vVZkjJVUZlrMvso1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0fjz2xs7z2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 05:09:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DBAF2A6B;
	Mon,  3 Nov 2025 10:08:48 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463A43F694;
	Mon,  3 Nov 2025 10:08:48 -0800 (PST)
Message-ID: <1965fe85-3734-45e9-af89-651c65845e8a@arm.com>
Date: Mon, 3 Nov 2025 18:08:45 +0000
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
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <ae1236da-2647-4d53-bf4d-ff8fc32eb734@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ae1236da-2647-4d53-bf4d-ff8fc32eb734@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01/11/2025 12:22, David Hildenbrand wrote:
>
>>   static inline void lazy_mmu_mode_pause(void)
>>   {
>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +    VM_WARN_ON(state->nesting_level == 0 || !state->active);
>> +
>> +    state->active = false;
>>       arch_leave_lazy_mmu_mode();
>
> Just one question:
>
> Don't we want to allow for pause/resume when not enabled? Would seem
> valid to me, because pause/resume code should actually not worry about
> that, right?

This does sound sensible, thanks for the suggestion. The initial goal
was to allow functions that know they're called with lazy MMU enabled to
be able to pause it temporarily if they need batching disabled. But we
could generalise this to: if you know batching would break things, then
you can preemptively add a pause/resume pair, and it won't do anything
unless you're called with lazy MMU enabled.

I also like this as this removes an invalid usage situation - now as
long as you have balanced enable/disable and pause/resume calls, you're
good. Will make that change in v5.

- Kevin

>
> if (!state->nesting_level) {
>     VM_WARN_ON(state->active);
>     return;
> }
> VM_WARN_ON(!state->active);
> state->active = false;
> arch_leave_lazy_mmu_mode();
>

