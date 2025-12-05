Return-Path: <linuxppc-dev+bounces-14641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB648CA7A98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 13:56:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNBGb0kDvz2xc2;
	Fri, 05 Dec 2025 23:56:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764939414;
	cv=none; b=nmYDdoyN+mQRRnKLFPYQSE0FS1giPpWZ8h/FM4idVBh+e/KFl4e/KWiZZDgWbl7t2m2zSrR0LmvobZWB5F7G4RTfeST66YxJSBZbe37eEtPerpLEBApa+Xrb27i0e26cgplpZAM+beLNMso9+SXoOad7ZcTsuA/PlukGHNjj2RGOmmr6kB7d8Wt0Rnj2ybg88qbwZv6v3yc4cJT/rDdloSjYAXJYsw0cSw09IcIbTSosqBCON1ujhoQLgL/jTZfFOVbq2MSVFrSlYucmDcehAtDmCjs6wUHYRVEBFyojS3zywMzFEcormZJp75+TktrIuujyN4lgslTkQ9Yqc51Ing==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764939414; c=relaxed/relaxed;
	bh=/5/J1xrrQ4v7y7EnDQHi7nPKin/NlY5YRzNA1rygu68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IznLBv1EwCJYUGm99WowJfptOLefoiigQmBr666/5M5fo84jSacdMy5dLcqC1zubO/WLYUM6a/9W6v0SGNsBCImBkcXEWWes4t29BrpjK8QsAN13YaYVFs6lu1XxabyYxXo6VHw24wWCDH0Vx9u5Gnfpvj8a4GVmPs7J1PEYxIuLrmKLQ1NdJl7sQlmQ//9+9dW0BpURcFeTXHnwlIgkKM8l6X5JJAoBZH3Dx+afgR9Mxp/6x1hXft/6reynQcxYv72fHjbcOJRohNkI04pcriGziYVyQJ22M6Z4VygrzLs9HPE6mEroqYFS9B7ykYnkLKCM9TlarcX8QpPCrvBi+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNBGZ0P2nz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 23:56:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48521575;
	Fri,  5 Dec 2025 04:56:14 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 903273F59E;
	Fri,  5 Dec 2025 04:56:14 -0800 (PST)
Message-ID: <89e76670-4a7b-46b6-ba55-d225dbb68cbd@arm.com>
Date: Fri, 5 Dec 2025 13:56:11 +0100
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
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04/12/2025 07:23, Anshuman Khandual wrote:
>> [...]
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 8ff6fdb4b13d..24fdb6f5c2e1 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -230,39 +230,140 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
>>   * held, but for kernel PTE updates, no lock is held). The mode is disabled in
>>   * interrupt context and calls to the lazy_mmu API have no effect.
>> - * Nesting is not permitted.
>> + *
>> + * The lazy MMU mode is enabled for a given block of code using:
>> + *
>> + *   lazy_mmu_mode_enable();
>> + *   <code>
>> + *   lazy_mmu_mode_disable();
>> + *
>> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
>> + * A nested call to enable() has no functional effect; however disable() causes
>> + * any batched architectural state to be flushed regardless of nesting. After a
> Just wondering if there is a method for these generic helpers to ensure that platform
> really does the required flushing on _disable() or the expected platform semantics is
> only described via this comment alone ?

From the generic layer's perspective, flushing means calling
arch_flush_lazy_mmu_mode(). Like the other arch_*_lazy_mmu_mode helpers,
the actual semantics is unspecified - an arch could choose not to do
anything on flush if that's not required for page table changes to be
visible. There is actually an example of this in the kpkeys page table
hardening series [1] (this isn't doing any batching so there is nothing
to flush either).

[1]
https://lore.kernel.org/linux-hardening/20250815085512.2182322-19-kevin.brodsky@arm.com/

>> + * call to disable(), the caller can therefore rely on all previous page table
>> + * modifications to have taken effect, but the lazy MMU mode may still be
>> + * enabled.
>> + *
>> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
>> + * This can be done using:
>> + *
>> + *   lazy_mmu_mode_pause();
>> + *   <code>
>> + *   lazy_mmu_mode_resume();
>> + *
>> + * pause() ensures that the mode is exited regardless of the nesting level;
>> + * resume() re-enters the mode at the same nesting level. Any call to the
>> + * lazy_mmu_mode_* API between those two calls has no effect. In particular,
>> + * this means that pause()/resume() pairs may nest.
>> + *
>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> + * currently enabled.
> Just wondering - could a corresponding test be included probably via KUNIT_TEST
> to ensure the above described semantics are being followed.

Checking that is_lazy_mmu_mode_active() returns the right value at
different call depths should be doable, yes. I suppose that could live
in some file under mm/tests/ (doesn't exist yet but that's the preferred
approach for KUnit tests).

- Kevin

