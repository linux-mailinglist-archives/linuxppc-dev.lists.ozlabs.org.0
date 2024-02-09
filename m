Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263F84F1C6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 09:55:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSP536bGz3dDM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 19:55:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSNg71vwz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 19:55:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D4E6DA7;
	Fri,  9 Feb 2024 00:55:22 -0800 (PST)
Received: from [10.57.65.115] (unknown [10.57.65.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6688A3F762;
	Fri,  9 Feb 2024 00:54:36 -0800 (PST)
Message-ID: <3ba54c94-8e44-4dd6-9a25-2cf81b07336f@arm.com>
Date: Fri, 9 Feb 2024 08:54:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/25] Transparent Contiguous PTEs for User Mappings
To: Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <ZcUQqfg39zCS2BAv@FVFF77S0Q05N.cambridge.arm.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZcUQqfg39zCS2BAv@FVFF77S0Q05N.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/02/2024 17:34, Mark Rutland wrote:
> On Fri, Feb 02, 2024 at 08:07:31AM +0000, Ryan Roberts wrote:
>> Hi All,
> 
> Hi Ryan,
> 
> I assume this is the same as your 'features/granule_perf/contpte-lkml_v' branch
> on https://gitlab.arm.com/linux-arm/linux-rr/

Yep - great detective work! features/granule_perf/contpte-lkml_v5 corresponds
exactly to what I posted with all the dependencies in place.

> 
> I've taken a quick look, and I have a few initial/superficial comments before
> digging into the detail on the important changes.

Thanks for doing this!

> 
>> Patch Layout
>> ============
>>
>> In this version, I've split the patches to better show each optimization:
>>
>>   - 1-2:    mm prep: misc code and docs cleanups
> 
> I'm not confident enough to comment on patch 2, but these look reasonable to
> me.

Thanks. David has acked patch 2 already so I think we are good there.

> 
>>   - 3-8:    mm,arm,arm64,powerpc,x86 prep: Replace pte_next_pfn() with more
>>             general pte_advance_pfn()
> 
> These look fine to me.

Thanks!

> 
>>   - 9-18:   arm64 prep: Refactor ptep helpers into new layer
> 
> The result of patches 9-17 looks good to me, but the intermediate stages where
> some functions are converted is a bit odd, and it's a bit painful for review
> since you need to skip ahead a few patches to see the end result to tell that
> the conversions are consistent and complete.
> 
> IMO it'd be easier for review if that were three patches:
> 
> 1) Convert READ_ONCE() -> ptep_get()
> 2) Convert set_pte_at() -> set_ptes()
> 3) All the "New layer" renames and addition of the trivial wrappers

Yep that makes sense. I'll start prepping that today. I'll hold off reposting
until I have your comments on 19-25. I'm also hoping that David will repost the
zap series today so that it can get into mm-unstable by mid-next week. Then I'll
repost on top of that, hopefully by end of next week, folding in all your
comments. This should give planty of time to soak in linux-next.

Thanks,
Ryan

> 
> Patch 18 looks fine to me.
> 
>>   - 19:     functional contpte implementation
>>   - 20-25:  various optimizations on top of the contpte implementation
> 
> I'll try to dig into these over the next few days.
> 
> Mark.

