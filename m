Return-Path: <linuxppc-dev+bounces-13266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93035C06316
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 14:14:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMJp2nQmz3bsN;
	Fri, 24 Oct 2025 23:14:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761308058;
	cv=none; b=gVrae8qFTmnTCLxG3ypah46ciKO/O86DUPhV5bP0v/nHgDNF5CaGvWiKkFT7xzR5D1zao110uwyKOKa4dsHnPqD53bekpS1lNO8C7hIOmbVrcA09v+/uBwnaz+JfwGMT3YsVgpSa6yz3CzMnCTT177dut1GKLYqPbHtwDzUsLJVzS/fpu2xnyKA2QtTg6WpEMj2DYVw78u0LwJsZn9+/k1p4YoWotD3h8Ox3HgaeyiYVKs+ldbCEA6DqCmBjJFK10WGogA5kPkVe9kGcvCyLYKtoqyaM0Sodh+nFnvAvPIwk4gDBTHth4vnhk231fWAXNnLbIX9OP27P3BlDVcJNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761308058; c=relaxed/relaxed;
	bh=X3sXu4j8MfMq52gqBAavsMTcndSosYtjB52S1c8LUjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBIBudiNMpXPUWMEv9+tOKdPDbyqq9uSO59cgk+VwLeKXIh5drmI8bzi1LbrObHBNUuxgr2l+Lb/SflxJZnNPz9wDlAALIN75/smdkkCY+wdgBigrtFO0O76WgPK1gVv1QMhe4/bYjpMXr9GAzBSdXVeF8JIscO6AohdfcInfC6QVLONZz/vGHsIV/pNomKtdKpctx+cxSCkU22QII8C/TUctuyyl5tDJvM192sF4k0RI1KBRmT3+6swQJODHpRA4NlN7Nt3PQkLau3dO3hWApExytfk2I7gLVWx65X9qgxw6QuI3PRMMM75ph6r2h2AsrMc+JOqLN5ha4gXSWUc7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMJn31gvz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 23:14:17 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EA231515;
	Fri, 24 Oct 2025 05:13:38 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2833F66E;
	Fri, 24 Oct 2025 05:13:38 -0700 (PDT)
Message-ID: <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
Date: Fri, 24 Oct 2025 14:13:35 +0200
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
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
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
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23/10/2025 21:52, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> [...]
>>
>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>    followed by an immediate exit/rescheduling and some followed by a
>>    conditional exit. These functions assume that they are called
>>    with lazy MMU disabled and we cannot simply use pause()/resume()
>>    to address that. This patch leaves the situation unchanged by
>>    calling enable()/disable() in all cases.
>
> I'm confused, the function simply does
>
> (a) enables lazy mmu
> (b) does something on the page table
> (c) disables lazy mmu
> (d) does something expensive (split folio -> take sleepable locks,
>     flushes tlb)
> (e) go to (a)

That step is conditional: we exit right away if pte_offset_map_lock()
fails. The fundamental issue is that pause() must always be matched with
resume(), but as those functions look today there is no situation where
a pause() would always be matched with a resume().

Alternatively it should be possible to pause(), unconditionally resume()
after the expensive operations are done and then leave() right away in
case of failure. It requires restructuring and might look a bit strange,
but can be done if you think it's justified.

>
> Why would we use enable/disable instead?
>
>>
>> * x86/Xen is currently the only case where explicit handling is
>>    required for lazy MMU when context-switching. This is purely an
>>    implementation detail and using the generic lazy_mmu_mode_*
>>    functions would cause trouble when nesting support is introduced,
>>    because the generic functions must be called from the current task.
>>    For that reason we still use arch_leave() and arch_enter() there.
>
> How does this interact with patch #11? 

It is a requirement for patch 11, in fact. If we called disable() when
switching out a task, then lazy_mmu_state.enabled would (most likely) be
false when scheduling it again.

By calling the arch_* helpers when context-switching, we ensure
lazy_mmu_state remains unchanged. This is consistent with what happens
on all other architectures (which don't do anything about lazy_mmu when
context-switching). lazy_mmu_state is the lazy MMU status *when the task
is scheduled*, and should be preserved on a context-switch.

>
>>
>> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>> places, but only defines it if PARAVIRT_XXL is selected, and we are
>> removing the fallback in <linux/pgtable.h>. Add a new fallback
>> definition to <asm/pgtable.h> to keep things building.
>
> I can see a call in __kernel_map_pages() and
> arch_kmap_local_post_map()/arch_kmap_local_post_unmap().
>
> I guess that is ... harmless/irrelevant in the context of this series?

It should be. arch_flush_lazy_mmu_mode() was only used by x86 before
this series; we're adding new calls to it from the generic layer, but
existing x86 calls shouldn't be affected.

- Kevin

