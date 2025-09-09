Return-Path: <linuxppc-dev+bounces-11919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1DDB4A699
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdGs1t3Xz3cYG;
	Tue,  9 Sep 2025 19:06:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757408789;
	cv=none; b=nGmKy0HlOflZ41tds+SINgUrF75CruEN2ZxXpnhRgD8ITNz26Pc91xRJFZmmRcigsu2O/fzcDgect0jK5uvbMnJN5VvWjnb0bDsiFkcmXmmKduppTsHF708NdRIrYJgUdWSqOAnR9snIr9U1IDa8F68MMjzZTy9FFS+E2MczUwKiV6lEyxijVU2ys7XmItYN+yjlbr0zKbD0uVKz8Sit8hdd08AtQVUAmyiIML1ZN6d/KUFqvoYoOqJfeyyAtlYoIR80y2dhvt+cEgVURTAnoJUr0DLYfpKHWCB7mCc7RZW/gGwD0OxrFrhpNgkku4BVGSpWIM5QLmTpmcMTf/PNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757408789; c=relaxed/relaxed;
	bh=ujoZwN7+39kxKbECl/cd7bSlB0kLqKwYgSZlv4ws8T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diJ/mbFCAqZw5rh3c0MDsCibo1F0Yamuy3mTuN7ZkEpZYNZ4nZyyeGxikSNMjcn6M6gfnGrAfZZC/SubKmPP3FGkqv86LVMckaAv64pEhxOyXu0qmuK5LVALTyWhxpnDhW6EkEjKB6EHgFj22+fCOmS7zrlPtw+oMRLJx+MGvFRXDeG1rrPwYUMmv6VrUr7w9Stqpdf/D0SmOXRwZqXcG0bhcca9qv33/ysRguMWbupcXPWO5w5kO99hPF6lB5/mH0JOM3pL6CBkPdVtYOVneUUu4Uq4dhX2c2FDUTwvpix++hHrCxcYYjgisEmgH426DaW+vekyz1ODXTVK3h446Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdGq34m0z3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:06:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E25F015A1;
	Tue,  9 Sep 2025 02:05:44 -0700 (PDT)
Received: from [10.57.60.124] (unknown [10.57.60.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7EF13F63F;
	Tue,  9 Sep 2025 02:05:39 -0700 (PDT)
Message-ID: <bd3958cc-f069-40a6-b201-7cab338e0cd9@arm.com>
Date: Tue, 9 Sep 2025 11:05:35 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09/09/2025 07:40, Andrew Morton wrote:
> On Mon,  8 Sep 2025 08:39:26 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>
>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>> (taking and returning no value). This is proving problematic in
>> situations where leave() needs to restore some context back to its
>> original state (before enter() was called). In particular, this
>> makes it difficult to support the nesting of lazy_mmu sections -
>> leave() does not know whether the matching enter() call occurred
>> while lazy_mmu was already enabled, and whether to disable it or
>> not.
>>
>> This patch gives all architectures the chance to store local state
>> while inside a lazy_mmu section by making enter() return some value,
>> storing it in a local variable, and having leave() take that value.
>> That value is typed lazy_mmu_state_t - each architecture defining
>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>> For now we define it as int everywhere, which is sufficient to
>> support nesting.
>>
>> The diff is unfortunately rather large as all the API changes need
>> to be done atomically. Main parts:
> This has a build error:
>
>   CC      arch/x86/kernel/asm-offsets.s
> In file included from ./arch/x86/include/asm/irqflags.h:102,
>                  from ./include/linux/irqflags.h:18,
>                  from ./include/linux/spinlock.h:59,
>                  from ./include/linux/swait.h:7,
>                  from ./include/linux/completion.h:12,
>                  from ./include/linux/crypto.h:15,
>                  from arch/x86/kernel/asm-offsets.c:9:
> ./arch/x86/include/asm/paravirt.h: In function 'arch_enter_lazy_mmu_mode':
> ./arch/x86/include/asm/paravirt.h:534:16: error: 'LAZY_MMU_DEFAULT' undeclared (first use in this function)
>   534 |         return LAZY_MMU_DEFAULT;
>       |                ^~~~~~~~~~~~~~~~
> ./arch/x86/include/asm/paravirt.h:534:16: note: each undeclared identifier is re
>
> which gets fixed up later in the series.

Oh indeed good catch! I don't think there's an easy way to fix this
cleanly due to the header soup. Since it's just a temporary change, I
suggest:

diff --git a/arch/x86/include/asm/paravirt.h
b/arch/x86/include/asm/paravirt.h
index 65a0d394fba1..67b9549b4255 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -531,7 +531,7 @@ static inline lazy_mmu_state_t
arch_enter_lazy_mmu_mode(void)
 {
     PVOP_VCALL0(mmu.lazy_mode.enter);
 
-    return LAZY_MMU_DEFAULT;
+    return 0; /* LAZY_MMU_DEFAULT */
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)


That will generate a trivial conflict with patch 4, naturally.

Should I send a v3 with that change?

- Kevin

