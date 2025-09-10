Return-Path: <linuxppc-dev+bounces-11996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C021B51D2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 18:12:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMQh45qmLz3dFH;
	Thu, 11 Sep 2025 02:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757520756;
	cv=none; b=imuSLEtnhItJh3eT5wbY9HsXHvWEMEqwVK0zsX80Jgz/iQQwIIyswMfEZW4SNJpcLe9V6ugqoGtY9lWB43tVyddS58USGI23Y7Tusc1Wtdi94kNd/YwG1hUQwbUYt1Se/Vj/PmlV7UxFIC/g0SDJrmL/OT1RrMvYIWlzKYD2iFp9Jt7wf6jPLgOaNrxNBzxeChG97yWS8Ke67o7bGJcx+T6iWSBebSDKk8GkUQbG6xBVNfWqVjVLsPhpXPdsoi2Px3AammpBNW7KIK0bWpkLS0UgUQqlfDMTvJx638rOVW2mpyemDayMPLtH0zh2m50KeQJdUNhPL72TYnB/FQsaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757520756; c=relaxed/relaxed;
	bh=cdS8DQ91Fk2KRig7JcdWAE1Tb1sePXx/4ByqYYrByXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIzWaHRmwWgljkIJITRXUmI0QqUIlnk4o0hJizM/xCTexqDtQHsN4fGyPF98XG+JgJWCeGnSfd5z4HnZvy9SD6MzB1Z8XJxNUJUNMyvY/o/tpiziyQcHCrEgRH4FJc5BByhCN5PaLdq48NfXVVwXywINyjLxnbPj3o+tyLjrTAYhkW6vrcnHI5lpXjWLzgEJxchX8Feuv5N/gMuF7dHKOk1vEN2TI2Z9/VGxamW1b4U234CTADuXh+Uzghgn6vb2s0m1qj2J3mniqLY+uZfgGRZpXzbmFseh/fdIiom/DtgXjUDlPF9sfuZvlwtuwzldlImKd6ia6MCfbGa5c4UIoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMQh35s1Bz3dBY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 02:12:35 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B91C716F2;
	Wed, 10 Sep 2025 09:11:55 -0700 (PDT)
Received: from [10.57.67.148] (unknown [10.57.67.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F3D43F63F;
	Wed, 10 Sep 2025 09:11:56 -0700 (PDT)
Message-ID: <250835cd-f07a-4b8a-bc01-ace24b407efc@arm.com>
Date: Wed, 10 Sep 2025 18:11:54 +0200
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <b2e52967-7ca1-411e-9c66-8d3483624ca7-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09/09/2025 16:38, Alexander Gordeev wrote:
>>>>> Would that integrate well with LAZY_MMU_DEFAULT etc?
>>>> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
>>>> want to use it - at least that is how I read the description above.
>>>>
>>>> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
>>>> that do not follow this pattern, and it looks as a problem to me.
>> This discussion also made me realise that this is problematic, as the
>> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
>> convenience, not for generic code (where lazy_mmu_state_t should ideally
>> be an opaque type as mentioned above). It almost feels like the kasan
>> case deserves a different API, because this is not how enter() and
>> leave() are meant to be used. This would mean quite a bit of churn
>> though, so maybe just introduce another arch-defined value to pass to
>> leave() for such a situation - for instance,
>> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?
> What about to adjust the semantics of apply_to_page_range() instead?
>
> It currently assumes any caller is fine with apply_to_pte_range() to
> enter the lazy mode. By contrast, kasan_(de)populate_vmalloc_pte() are
> not fine at all and must leave the lazy mode. That literally suggests
> the original assumption is incorrect.
>
> We could change int apply_to_pte_range(..., bool create, ...) to e.g.
> apply_to_pte_range(..., unsigned int flags, ...) and introduce a flag
> that simply skips entering the lazy mmu mode.

This is pretty much what Ryan proposed [1r] some time ago, although for
a different purpose (avoiding nesting). There wasn't much appetite for
it then, but I agree that this would be a more logical way to go about it.

- Kevin

[1r]
https://lore.kernel.org/all/20250530140446.2387131-4-ryan.roberts@arm.com/

