Return-Path: <linuxppc-dev+bounces-12037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E5FB538F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 18:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN2q90pWJz3020;
	Fri, 12 Sep 2025 02:20:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757607653;
	cv=none; b=QYQEi4bot8Fmx3jEpnEBvTlgDFScFCu6bnxNzSauJvVF6mFHH+w83qkJcwylZufqkWCf1jMH1CbGVWqONdeEDcLbu1oIEFmm4HQODQEQ7O/qmu6arI/Hstt2QNETfkkMZ339XgO/rpkIKmtxxFP9pJv4uo8mgGLUIiChn83P1wEf7LV1CaFn52SIYboMYTB0NgwPFZGhuGwfVaXF3y84jk847S6NuQPqAehfADQ/cJk0zQH7zIC+U6nboZIoQhyInNbzYTSQ4V5blFXA9L8zP73nbKk9nd5s1sZr9TYHCrFC2DhAYjJsNP5AhqSZp/OU8hnTjZocXricABOnQctpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757607653; c=relaxed/relaxed;
	bh=P4KuZTZsXU0ugaI7cID3g5r9oTH3zieIMz1tYktcbHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPvxsmRHedNOYCHpGFe9A69Bxrw1ybxTSwXeljOTz59t/KOc8w9cBmwQ1ALeGi52YLtTr3SjwpQBcI09QoNzE/Uzz9FryCqbeQ8y4g2P8yJQGoF+owMRcL+xYHetPmIlfHSVCjr3S+UYxoGzJbtKDXlCpeLtnf7bDV3jBC4iJqQNY/I4WFE9REVNZt5twDHF9LpGQchYgAOZ/4cgl41JnR3jLLgNj5wFUIKTd6mUGqhAvvvvDWpLx38C6IbR+iHsPulgXTVUCA+N9qFxEqpkl3Gg4M1zFX0LpbTicBVmPxEp2f+Hlh7edDRSUx2uQcIzi3EKkwkdZxfjv/JnjPQlDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN2q82XkKz301K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 02:20:52 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43CB1756;
	Thu, 11 Sep 2025 09:20:12 -0700 (PDT)
Received: from [10.57.70.14] (unknown [10.57.70.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 462913F694;
	Thu, 11 Sep 2025 09:20:14 -0700 (PDT)
Message-ID: <076c7f16-fe56-49a8-910e-7d71d3f8f0b4@arm.com>
Date: Thu, 11 Sep 2025 18:20:11 +0200
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
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <b2e52967-7ca1-411e-9c66-8d3483624ca7-agordeev@linux.ibm.com>
 <250835cd-f07a-4b8a-bc01-ace24b407efc@arm.com>
 <80be36e5-d6e1-4b37-a1ca-47e92ac21b02-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <80be36e5-d6e1-4b37-a1ca-47e92ac21b02-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/09/2025 14:06, Alexander Gordeev wrote:
> On Wed, Sep 10, 2025 at 06:11:54PM +0200, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> On 09/09/2025 16:38, Alexander Gordeev wrote:
>>>>>>> Would that integrate well with LAZY_MMU_DEFAULT etc?
>>>>>> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
>>>>>> want to use it - at least that is how I read the description above.
>>>>>>
>>>>>> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
>>>>>> that do not follow this pattern, and it looks as a problem to me.
>>>> This discussion also made me realise that this is problematic, as the
>>>> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
>>>> convenience, not for generic code (where lazy_mmu_state_t should ideally
>>>> be an opaque type as mentioned above). It almost feels like the kasan
>>>> case deserves a different API, because this is not how enter() and
>>>> leave() are meant to be used. This would mean quite a bit of churn
>>>> though, so maybe just introduce another arch-defined value to pass to
>>>> leave() for such a situation - for instance,
>>>> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?
>>> What about to adjust the semantics of apply_to_page_range() instead?
>>>
>>> It currently assumes any caller is fine with apply_to_pte_range() to
>>> enter the lazy mode. By contrast, kasan_(de)populate_vmalloc_pte() are
>>> not fine at all and must leave the lazy mode. That literally suggests
>>> the original assumption is incorrect.
>>>
>>> We could change int apply_to_pte_range(..., bool create, ...) to e.g.
>>> apply_to_pte_range(..., unsigned int flags, ...) and introduce a flag
>>> that simply skips entering the lazy mmu mode.
>> This is pretty much what Ryan proposed [1r] some time ago, although for
>> a different purpose (avoiding nesting). There wasn't much appetite for
>> it then, but I agree that this would be a more logical way to go about it.
>>
>> - Kevin
>>
>> [1r]
>> https://lore.kernel.org/all/20250530140446.2387131-4-ryan.roberts@arm.com/
> May be I missing the point, but I read it as an opposition to the whole
> series in general and to the way apply_to_pte_range() would be altered
> in particular:
>
>  static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  				     unsigned long addr, unsigned long end,
>  				     pte_fn_t fn, void *data, bool create,
> -				     pgtbl_mod_mask *mask)
> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>
> The idea of instructing apply_to_page_range() to skip the lazy mmu mode
> was not countered. Quite opposite, Liam suggested exactly the same:

Yes that's a fair point. It would be sensible to post a new series
trying to eliminate the leave()/enter() calls in mm/kasan as you
suggested. Still I think that it makes sense to define an API to handle
that situation ("pausing" lazy_mmu), as discussed with David H.

- Kevin

>
> <quote>
> Could we do something like the pgtbl_mod_mask or zap_details and pass
> through a struct or one unsigned int for create and lazy_mmu?
>
> These wrappers are terrible for readability and annoying for argument
> lists too.
>
> Could we do something like the pgtbl_mod_mask or zap_details and pass
> through a struct or one unsigned int for create and lazy_mmu?
>
> At least we'd have better self-documenting code in the wrappers.. and if
> we ever need a third boolean, we could avoid multiplying the wrappers
> again.
> <quote>
>
> Thanks!

