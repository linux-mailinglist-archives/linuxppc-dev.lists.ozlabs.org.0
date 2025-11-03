Return-Path: <linuxppc-dev+bounces-13706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1BC2DAD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 19:29:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0g9L22dxz3bfZ;
	Tue,  4 Nov 2025 05:29:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762194582;
	cv=none; b=JJdezWb8wfXVqZHjGZax1ybEBpHZc4kdXrMeVIDctcHDKnyagEXs+XUO94C1NZFuxb6beYtoV+Qr/kLbtv9r4Qf6Nt8Ff9qNsPrspcXW1YEzfUGv3PoB4tM+4UwS4OS97vbd49GhINf9Gj1IwPtzEufMdpZbjvryLb9IYcr2DkjctyEcgdOtpWBv2XbolHDRaxZW9nVHlI+huYFWg8fEcIoaD/GnJTVyyRdSgj63FDDsSGa49A5d8Acbnfctwih/wM+bs8g2UVfWjKgbKiqIYyonEchUB2dp9ea285YyLXVdEydK/7YhIvGtWvIUy8er3Flxm33rbr9uEDnth4UVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762194582; c=relaxed/relaxed;
	bh=PejloQnKGuK3bpH0pnM/kdDvHB2ShDka/sYljxbJywo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwAXYc/hWiw8mBvigtc2w/mNNGR+Q3rRNRwP+X3Qjeyb9gObDimi2EEGFZKorCttCMcjEaq8q2i+mx0RKbYNGAp7JKhHgdXfYJzqclH+40/Gd8kF8OshTM4h+RKXc9exKOQhNT5g1vXNy1dSrSbRsQTmp2v69iQo+G22tuGei+a6ZU+uUofPooTXaL9YuLJT7WyQu7fXAeBbCT1LZcyfQcUADTkPCv0jtEPG79E4quq6JLY4iHtmmRZh1hTlWthRa+qUgOKbO6eZIMa6qufkNfaf+xk1KMIoRSFQ5SLL0yGgZF+tN5MM38bPQtuNZbPhEMHODigBeDlm+0I/ajDlIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0g9K4nhBz3bfN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 05:29:41 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD0752A6B;
	Mon,  3 Nov 2025 10:29:02 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191F33F694;
	Mon,  3 Nov 2025 10:29:02 -0800 (PST)
Message-ID: <285faae4-dab6-4819-847a-889bdf87d5d7@arm.com>
Date: Mon, 3 Nov 2025 18:29:00 +0000
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
Subject: Re: [PATCH v4 11/12] x86/xen: use lazy_mmu_state when
 context-switching
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-12-kevin.brodsky@arm.com>
 <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03/11/2025 16:15, David Hildenbrand (Red Hat) wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> [...]
>>
>> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct
>> task_struct *next)
>>         xen_mc_flush();
>>       leave_lazy(XEN_LAZY_CPU);
>> -    if (test_and_clear_ti_thread_flag(task_thread_info(next),
>> TIF_LAZY_MMU_UPDATES))
>> +    if (next->lazy_mmu_state.active)
>
> This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want
> to have a separate helper that makes it clear what the difference
> between both variants is.

in_lazy_mmu_mode() operates on current, but here we're operating on a
different task. The difference is more fundamental than just passing a
task_struct * or not: in_lazy_mmu_mode() is about whether we're
currently in lazy MMU mode, i.e. not paused and not in interrupt
context. A task that isn't scheduled is never in lazy MMU mode -
lazy_mmu_state.active is just the saved state to be restored when
scheduled again.

My point here is that we could have a helper for this use-case, but it
should not be used in other situations (at least not on current). Maybe
__task_lazy_mmu_active(task)? I do wonder if accessing lazy_mmu_state
directly isn't expressing the intention well enough though (checking the
saved state).

- Kevin

