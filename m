Return-Path: <linuxppc-dev+bounces-13282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF21C06DD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 17:05:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctR6k1k5pz3c5j;
	Sat, 25 Oct 2025 02:05:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761318350;
	cv=none; b=g5jvn/QMovEOJC48NDgjP0HWC2d6VPMKyc3l+rSeOReFOiFT5N6iw0Gtks/beZlqoHwvwJ3ebgipHWLi8lLebHKo6j8unEkdESD1VjS/5OZUQjWQciQm7mU2MVu/hOu8SMkulHNjuruT0ZMFcHgPRZLDCT30/wmb0em0DC7b0lWpeG8QhMdhb3DIGKAPXx4LTvJINAFTpKVyRLpZchTV8CoS5wN8kvdBshLs74x5Cr5AUIDaaBK7ClcUzNzPHFFuMjL2p55GhUoMdMxvwzdWo62V6zBXznENISja2rRsoABLvrX7WenR1lV33xXrwLZHlzmHNc0nB8WYfHlal0yK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761318350; c=relaxed/relaxed;
	bh=mFsntFKm3sLCSsUTazR6Zz09gRvrPjOBy+0/EZ6kZlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNyJxsHpppXFmnAStCHV2obzP8Ks1McYX8pPiXe+V2XzoWHpiWoZuO6IzG0sy+4yNLZ9qgCEIRF4EL4PhHmMqKsbfSys3V1DDKtuFyTjPU1Bu4YVwXugJ583PT3qObTY9GK8B/yjs/JeAvxN+S5UHR+McQugKoVMC/HnSwET9RpUc4VQy+8T3RlOuj7BJEp1DNL4qzVl3QkZOtS/mBq+s308amfbyQ2B2kAfbfhMBMuixZ6q/v3a3PfP+s9G3XHMnVBQOkVnz4KP57CBQ6pmk1g0qbPc/3oeZLNY+SbeMcQ/elMFIqEQ+35CjYdZIXGgXFjW+W3x/xBaFNL0XsNlTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctR6j3jgTz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 02:05:49 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29D6E14BF;
	Fri, 24 Oct 2025 08:05:10 -0700 (PDT)
Received: from [10.57.67.38] (unknown [10.57.67.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 519063F63F;
	Fri, 24 Oct 2025 08:05:10 -0700 (PDT)
Message-ID: <6ed9f404-9939-4e9f-b5aa-4253bef46df1@arm.com>
Date: Fri, 24 Oct 2025 17:05:07 +0200
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
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Woodhouse <dwmw2@infradead.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
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
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/10/2025 16:47, David Woodhouse wrote:
> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>> We currently set a TIF flag when scheduling out a task that is in
>>> lazy MMU mode, in order to restore it when the task is scheduled
>>> again.
>>>
>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>> state when switching to the new task, instead of using a separate
>>> TIF flag.
>>>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>
>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>> folks.
>
> I know tglx has shouted at me in the past for precisely this reminder,
> but you know you can test Xen guests under QEMU/KVM now and don't need
> to actually run Xen? Has this been boot tested?

I considered boot-testing a Xen guest (considering the Xen-specific
changes in this series), but having no idea how to go about it I quickly
gave up... Happy to follow instructions :)

- Kevin

