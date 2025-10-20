Return-Path: <linuxppc-dev+bounces-13055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D791BF08CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 12:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqsGM39xjz300M;
	Mon, 20 Oct 2025 21:33:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760956411;
	cv=none; b=Qtxjnw3xzSt++gt8bb9MQPniTu2DqgfA1x2ulsF9+VavQD5aIbp9dzyySMniBLEEwwHtCFFDGTYh1t1rVrg7+qtav6XYoE8Fw65MswdSinu1qoOo3dLuy5oODQHdt179RV1xrG19PtGEnbclEdwxhrm+fBIBYlbr7j4RKNcMJe09zaZW24li/EpvVkvcW4dD8uxmQilUtf5Y5Y4zNCy8ZcAtdi2EfAOLGMvRzwdmaZRS6fBI5pkUEYIamVKrXUqb63Wveclk9m+4R2jEdd3urFsFP9F4btJMcVUkmijFa0ftzBHm0s4TU/hZA3cANH/aCBxeXSLCr4varzoj9FKHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760956411; c=relaxed/relaxed;
	bh=2AQxwufvO07AT5kQ2hNXxkfTUD6GA7CPz6wHF7lHZRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVshV5GDcYBzi1CBmxSwndGsKvxoBvMzjQ7HX+JDDgXthOqfOfEqPSTOcMk/iKyvxn7By42T4aC+W3rL2HHidhy4oeOD0suFwisPmzi1jdCut9zWQXPgobouJpgCpeEhoBxBRZozLj369z9gvCkpsVD+P9Mm46KNWJSzmChjnkGZat2cPQ0+CatpfDw6I3b9Tgg0iTrZBGVJ7qNGW7olUIwFheMbTUlyi0Md9z3WYS1bvSnF0Tuyogky2zPhJ9DFfVvNn96HnIT3QzRvDGK1AgasV9XJollXhieKLVDdTPatYsWgWJD3zwrz5/cAZ9sG0fKRr9mHZ+Ulf0cow5XgRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqsGL3NXYz2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 21:33:29 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C576E1063;
	Mon, 20 Oct 2025 03:32:48 -0700 (PDT)
Received: from [10.57.65.147] (unknown [10.57.65.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 924903F63F;
	Mon, 20 Oct 2025 03:32:48 -0700 (PDT)
Message-ID: <2338a99c-665c-4545-accb-c9ebffef45fa@arm.com>
Date: Mon, 20 Oct 2025 12:32:44 +0200
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
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <55f8b155-5468-43fc-b6fc-f509f4becd5b-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <55f8b155-5468-43fc-b6fc-f509f4becd5b-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/10/2025 17:54, Alexander Gordeev wrote:
> On Wed, Oct 15, 2025 at 09:27:20AM +0100, Kevin Brodsky wrote:
>
> Hi Kevin,
>
> ...
>> * lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
>>     This is for situations where the mode is temporarily disabled
>>     by first calling pause() and then resume() (e.g. to prevent any
>>     batching from occurring in a critical section).
> ...
>> +static inline void lazy_mmu_mode_pause(void)
>> +{
>> +	arch_leave_lazy_mmu_mode();
> I think it should have been arch_pause_lazy_mmu_mode(), wich defaults
> to  arch_leave_lazy_mmu_mode(), as we discussed in v2:
>
> https://lore.kernel.org/linux-mm/d407a381-099b-4ec6-a20e-aeff4f3d750f@arm.com/#t

See my comment on patch 7 - these new arch callbacks can easily be
introduced later, I don't see much point in introducing them now if they
default to leave/enter on every architecture.

- Kevin

