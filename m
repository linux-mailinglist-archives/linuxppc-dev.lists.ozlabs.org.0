Return-Path: <linuxppc-dev+bounces-13734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B94C30BFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 12:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d15tx6Qkvz3bfM;
	Tue,  4 Nov 2025 22:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762256025;
	cv=none; b=PUAnQmFBvVAX+Ml7N5PyfhCsbCQUy2o0URi1+2/w1GC3zN8rYVPFdjrHOcs59ACu6KAOLJzMwey6tjZmqNRY/Vu7Bdb6ObjF6tZidJzL8r+mm6EP+m3Wan0i/Pc132lUTl94wUXazbXo89mdQ2qt/pCQzC2htY94WrCd58kocAq4nqWMHXylkQVr3iJ16yChmrDvYqHmZsbv6CzdGP6f0wXIgHhGB3VXjrNlj/C9lPfmKqD03yLIGXuYTadtf+j9AS5fnjRQzsL9/q+XAXhzB7iNRFo6FSnOWAiXgbTxy0FIrjM06JswEn50/so0R003K+SXAHjAx1QBZy8Sfr9teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762256025; c=relaxed/relaxed;
	bh=6WOQeTavzPrauVi8MwJO524evgvZo3Tkv1ShmH0pjuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njOZ5c3r8CSc6Ql1FlpDby4SRo+wUpAVUM6R2O/N1Tiadm0Xlx7ssTwAmcOjvhRG/b4IU3NhzrGxAlxK3buzegqB8pujGLn5FP3wUvn0u4yK0Ry+2j+uhb+35ShE3foNmxZBQIwC+9b4VHqvUSDkR5mgJ1rgxXURV9qlrpfzdEIPr9UcyJq5+QYQu3MqqDfLFcm7MMqvv0+hmqaBqfuHCwQx08imqy8BZg3ynpM7xx4jJ1rjuGLOkmXDMNOt2vH4XS2sfoplwWiDdQ53JpUibln00Y2fk4niqVqnGvWO/u90PMubiC0I1SFekhUdbJTo0PMu8O90cURllbg6OMIvvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d15tx1VjKz304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 22:33:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06201C2B;
	Tue,  4 Nov 2025 03:33:05 -0800 (PST)
Received: from [10.1.38.100] (e126510-lin.cambridge.arm.com [10.1.38.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C979F3F63F;
	Tue,  4 Nov 2025 03:33:06 -0800 (PST)
Message-ID: <e3326a9c-108a-4eb2-b12e-bff2b5edd1d3@arm.com>
Date: Tue, 4 Nov 2025 11:33:03 +0000
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
Subject: Re: [PATCH v4 09/12] powerpc/mm: replace batch->active with
 in_lazy_mmu_mode()
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
 <20251029100909.3381140-10-kevin.brodsky@arm.com>
 <05e2062c-1689-44e7-9cc6-697646ca075d@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <05e2062c-1689-44e7-9cc6-697646ca075d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03/11/2025 16:05, David Hildenbrand wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> A per-CPU batch struct is activated when entering lazy MMU mode; its
>> lifetime is the same as the lazy MMU section (it is deactivated when
>> leaving the mode). Preemption is disabled in that interval to ensure
>> that the per-CPU reference remains valid.
>>
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. We can therefore use the generic helper in_lazy_mmu_mode()
>> to tell whether a batch struct is active instead of tracking it
>> explicitly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>
> I suspect you were not able to test this on real HW. Some help from
> the ppc folks would be appreciated.

Indeed, it would be nice to get some testing on ppc HW that actually
uses lazy MMU (!radix_enabled()).

>
> LGTM, but the interaction with pause/resume adds a bit of complication
> on top.

Does it? This series doesn't change when arch_enter() and arch_leave()
are called, batch->active and in_lazy_mmu_mode() should coincide. 

- Kevin

