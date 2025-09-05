Return-Path: <linuxppc-dev+bounces-11787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5D6B45763
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 14:12:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJFbG4BDTz3c3y;
	Fri,  5 Sep 2025 22:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757074346;
	cv=none; b=YOyNVZGe3Z/9Hx+/WedZEkrPEDoCg3aP56UKuHKZaxD2jpQ9FBsuzbYBdSY0lBNnwUJIRDruCGcu1xL/ov43DFJvcSqJW+uQtXxAh73b/o/scyuATVB8zDFDRHMZRf2AgMPXS4L56HgjqGMqPWoaXNimYFrBxXEVuOsGWCjuuOx/YnpXhaAAkpbKp1otel6EpDCN5oOh1k3kEbjQKlQsP4JsKdNicQbgEN+IYlmsdOCwi+0hBmlmEk6eocgH52Fv1uBZhe9eziGYgh+c0ZKOjb4Y8w5myZzYJIF+u2bi++vTOfcCQJR00mBXZ6nFCrgaKKHaJoY1cR7eiVTmRJksfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757074346; c=relaxed/relaxed;
	bh=AYbnAayVJ5j0xB1k23z8SMycFu9vSF8PiQYLB5iMyog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpQN7GBiWNdEYRLuCUIeX9o2nERfgFNXaRzPYat1nu0nD7iLFvl0Mm27Ouk4CbGbNaVBjnNe7n7krKpZ7xv/Uh3z9WUQzb1SX5A10RnVIuGAMUhHIknPM4NExZk4gb/YJuKaixf0xfN/LwGSCZxMwaMMd4ww1p5eXmVdfuTXVBVZ+oNcINR0Wmd+/TJaUov6Q3Evc4eVD7/81u64S/BZolpe9bc/tVJy8BGPXg99bLVPWf9pkWTG9EAe2rPMcQRUiO6UDohBBX/Lp+wzjPt78kZEnNxebCFMK42ls77swnQ/MpzQhOoxvT6IJgCDToszRgsSJK1G6fAOPwO/7uyR0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJFbF5BTsz3bq4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 22:12:23 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0A1B153B;
	Fri,  5 Sep 2025 05:11:42 -0700 (PDT)
Received: from [10.57.60.42] (unknown [10.57.60.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65F093F63F;
	Fri,  5 Sep 2025 05:11:45 -0700 (PDT)
Message-ID: <66335cf3-d49d-4b27-a37b-0a8a5e2c5d78@arm.com>
Date: Fri, 5 Sep 2025 14:11:43 +0200
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
Subject: Re: [PATCH 0/7] Nesting support for lazy MMU mode
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
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <9fd076c7-f163-4b92-8201-d8a259a338c1-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <9fd076c7-f163-4b92-8201-d8a259a338c1-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/09/2025 11:46, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:29PM +0100, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> When the lazy MMU mode was introduced eons ago, it wasn't made clear
>> whether such a sequence was legal:
>>
>> 	arch_enter_lazy_mmu_mode()
>> 	...
>> 		arch_enter_lazy_mmu_mode()
>> 		...
>> 		arch_leave_lazy_mmu_mode()
>> 	...
>> 	arch_leave_lazy_mmu_mode()
> I did not take too deep - sorry if you already answered this.
> Quick question - whether a concern Ryan expressed is addressed
> in general case?

The short answer is yes - it's good that you're asking because I failed
to clarify this in the cover letter!

> https://lore.kernel.org/all/3cad01ea-b704-4156-807e-7a83643917a8@arm.com/
>
> 	enter_lazy_mmu
> 		for_each_pte {
> 			read/modify-write pte
>
> 			alloc_page
> 				enter_lazy_mmu
> 					make page valid
> 				exit_lazy_mmu
>
> 			write_to_page
> 		}
> 	exit_lazy_mmu
>
> <quote>
> This example only works because lazy_mmu doesn't support nesting. The "make page
> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
> page can be accessed in write_to_page. If nesting was supported, the inner
> exit_lazy_mmu would become a nop and write_to_page would explode.
> </quote>

Further down in the cover letter I refer to the approach Catalin
suggested [4]. This was in fact in response to this concern from Ryan.
The key point is: leave() keeps the lazy MMU mode enabled if it is
nested, but it flushes any batched state *unconditionally*, regardless
of nesting level. See patch 3-6 on the practical implementation of this;
patch 7 also spells it out in the documentation.

Hope that clarifies the situation!

- Kevin

[4] https://lore.kernel.org/all/aEhKSq0zVaUJkomX@arm.com/

