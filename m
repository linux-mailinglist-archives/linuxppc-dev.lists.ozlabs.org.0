Return-Path: <linuxppc-dev+bounces-14840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F1CC8B1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 17:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWf1T2qVxz301Y;
	Thu, 18 Dec 2025 03:11:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765987885;
	cv=none; b=TP2JajUemNhJUiC5O5PdewCKdfVyYd//YDMj3gV8cJ+2gSNlGlSGSE2fb67iF2+wXEVoz+w4lh2w+j0rSXs/yi1M/n6lrvmURNYJB6mMubfZdqlZ4iXRlqiH6dT6Fiv5xj/o6MRVJ2c0pt6G06MqFFqvZIjpROersWiycyD/K/onWD4Ixa+EQGCrOJPPUSBBVbi4pV6VrOSMvCa4PyGa9TdPzRcBbiccCsRpRUbWGRQpsgRJ1+OnRUxRcwXIpduO0qlvzT2KsFz1WurQVTC5v8cnjzOCkQW4UjkQqEIHXOIurkxzX5WrdaAHXOGuOr4UIcJCno3VMZ5gPaiMu1EpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765987885; c=relaxed/relaxed;
	bh=FNCYahkh/fcmBqFzNzZ6qSdYyO44Ef+U9jbV1jmR+8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYsQtxCejFZkB6IdK2pmoJqe85s1vsoHe4QN6cb2Et9ePp+62O3SUUL55B4Av/JBwsUlmsxZMwmbuGonnLRTtq5a5RFQfVLuD/WSQm1SvgqZWU1E5vhJNsueA+VIPldDpun9O9IVZmsujcSGe2G+f5G89zldnxDSZAIgyRTE4wz1VfCob8/T+MvbrQDXwt4XqVjwnPW9JNlVrd7my00jk924I+M7jDGkDEMDrdO6aiW9AK2uCtsCquHijut+BBC+vpprFfSezTUrEqH2aUeIYXJVarHX2Sj9nE5AK/1nXSWKBJY8DMQaBk+qYZmTx59e+P8PVkdC031ZwMBm3B6qgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWf1S2PNhz300F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 03:11:23 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70ACCFEC;
	Wed, 17 Dec 2025 08:10:45 -0800 (PST)
Received: from [10.57.47.3] (unknown [10.57.47.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E837B3F5CA;
	Wed, 17 Dec 2025 08:10:44 -0800 (PST)
Message-ID: <799bdcb5-cb18-4b7a-b33f-bea1553f3650@arm.com>
Date: Wed, 17 Dec 2025 17:10:40 +0100
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
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
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
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-15-kevin.brodsky@arm.com>
 <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
 <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com>
 <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
 <87a4zhkt6h.ritesh.list@gmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <87a4zhkt6h.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/12/2025 16:46, Ritesh Harjani (IBM) wrote:
> Ryan Roberts <ryan.roberts@arm.com> writes:
>
>> On 17/12/2025 09:26, Kevin Brodsky wrote:
>>> On 17/12/2025 05:14, Andrew Morton wrote:
>>>> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>>>
>>>>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>>>>> ensure that it appears active when it should, depending on how
>>>>> enable/disable and pause/resume pairs are nested.
>>>> I needed this for powerpc allmodconfig;
>>>>
>>>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
>>>> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
>>>> @@ -30,6 +30,7 @@
>>>>  #include <trace/events/thp.h>
>>>>  
>>>>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>>>> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>>>>  
>>>>  /*
>>>>   * A linux PTE was changed and the corresponding hash table entry
>>>> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>>>>  		flush_hash_range(i, local);
>>>>  	batch->index = 0;
>>>>  }
>>>> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>>>>  
>>>>  void hash__tlb_flush(struct mmu_gather *tlb)
>>>>  {
>>>> _
>>> Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
>>> refer to those symbols on powerpc... Maybe a bit overkill to export
>>> those just for a test module, but I'm not sure there's a good
>>> alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
>>> force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.
>> Does EXPORT_SYMBOL_IF_KUNIT() help?
>>
> yes, that make sense. Thanks for the suggestion!
> I guess we will need a diff like this in that case -
>
>
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index fbdeb8981ae7..ec2941cec815 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -25,11 +25,12 @@
>  #include <asm/tlb.h>
>  #include <asm/bug.h>
>  #include <asm/pte-walk.h>
> -
> +#include <kunit/visibility.h>
>  
>  #include <trace/events/thp.h>
>  
>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
> +EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch);
>  
>  /*
>   * A linux PTE was changed and the corresponding hash table entry
> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
>                 flush_hash_range(i, local);
>         batch->index = 0;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending);
>  
>  void hash__tlb_flush(struct mmu_gather *tlb)
>  {
> diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
> index 2720eb995714..340d7cda9096 100644
> --- a/mm/tests/lazy_mmu_mode_kunit.c
> +++ b/mm/tests/lazy_mmu_mode_kunit.c
> @@ -69,3 +69,4 @@ kunit_test_suite(lazy_mmu_mode_test_suite);
>  
>  MODULE_DESCRIPTION("Tests for the lazy MMU mode");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Indeed, that's pretty much what I was about to send :)

- Kevin

