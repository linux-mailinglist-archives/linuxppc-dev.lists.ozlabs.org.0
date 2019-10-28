Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A51E6A7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 02:28:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471cYF5Vc2zDqfF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 12:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="G8EDPx8d"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471cWF0HPrzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 12:26:31 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id u9so967232pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 18:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ritRVlb0ULtaryMtuft6JkNqY9ganMcK1V8vqfjCnBA=;
 b=G8EDPx8dsDrmnM3jUe0NEPQhQlFo1Zu5PVSrWw3vDWeZB7zgjMiSXLsXRduxWItj5t
 Tj7ZEbeR4LfUjVwwjR/8IDrZ+oZPkO/FvwuT8ioTyBzVEaVfT2IgSeoIsQqsliEbVyj8
 Oyn7mg/4nLD3lM2cJk9+0uJlEmJhq86s7uWN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ritRVlb0ULtaryMtuft6JkNqY9ganMcK1V8vqfjCnBA=;
 b=gbca7hDr5NSf3KaWOSx4yFTfTeGgZdDmgMbGlAUcdkSbEsR3cGI0Pu/yBJW9NxN00C
 iocdOAnUORubEmxezewoC8QixR2xm2O+M85xMHK2FFSm3ihDepkTib+KsyjrUib4FtS5
 1+OoQwAQ8oT/iTdPkv5IgR2HOsyFPJVf514XSy98T+e+4SrtPl89svZscAhqDzAjZsIz
 joE1ieIeYWQfxEWticyA2m4mjj5k4J3gc562mvI7f/czimQ0gcZwWf/lG2VCC0OKyfyM
 COxoAUdbAAT6K2YFxZz42aC3YJsS6wYLrs9AxlKIB9r6yZdKdoKid21+wLr0BC4xe1IF
 XuvA==
X-Gm-Message-State: APjAAAXvugOSy+8glbk/bpGmHGiSu2++Dx98+uAIqAfHfQEnSGWCVyFH
 6jotqQljA1iogALdTKPZ5RkxTg==
X-Google-Smtp-Source: APXvYqzE36DCbOMTBwqOc4bMyPFO24D6Ue5PZH6JUNeN2k2TLWMzjVwHP+LDtRN/TiwSVcHcRVTDaQ==
X-Received: by 2002:aa7:9f86:: with SMTP id z6mr17999776pfr.102.1572225988198; 
 Sun, 27 Oct 2019 18:26:28 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id w27sm6775067pgc.20.2019.10.27.18.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 18:26:27 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Mark Rutland <mark.rutland@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <20191016132233.GA46264@lakrids.cambridge.arm.com>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
 <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
 <8f573b40-3a5a-ed36-dffb-4a54faf3c4e1@virtuozzo.com>
 <20191016132233.GA46264@lakrids.cambridge.arm.com>
Date: Mon, 28 Oct 2019 12:26:23 +1100
Message-ID: <87eeyx8xts.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark and Andrey,

I've spent some quality time with the barrier documentation and
all of your emails.

I'm still trying to puzzle out the barrier. The memory model
documentation doesn't talk about how synchronisation works when a
page-table walk is involved, so that's making things hard. However, I
think I have something for the spurious fault case. Apologies for the
length, and for any mistakes!

I am assuming here that the poison and zeros and PTEs are correctly
being stored and we're just concerned about whether an architecturally
correct load can cause a spurious fault on x86.

> There is the risk (as laid out in [1]) that CPU 1 attempts to hoist the
> loads of the shadow memory above the load of the PTE, samples a stale
> (faulting) status from the TLB, then performs the load of the PTE and
> sees a valid value. In this case (on arm64) a spurious fault could be
> taken when the access is architecturally performed.
>
> It is possible on arm64 to use a barrier here to prevent the spurious
> fault, but this is not smp_read_barrier_depends(), as that does nothing
> for everyone but alpha. On arm64 We have a spurious fault handler to fix
> this up.

Will's email has the following example:

	CPU 0				CPU 1
	-----				-----
	spin_lock(&lock);		spin_lock(&lock);
	set_fixmap(0, paddr, prot);	if (mapped)
	mapped = true;				foo = *fix_to_virt(0);
	spin_unlock(&lock);		spin_unlock(&lock);


If I understand the following properly, it's because of a quirk in
ARM, the translation of fix_to_virt(0) can escape outside the lock:

>   DDI0487E_a, B2-125:
> 
>   | DMB and DSB instructions affect reads and writes to the memory system
>   | generated by Load/Store instructions and data or unified cache maintenance
>   | instructions being executed by the PE. Instruction fetches or accesses
>   | caused by a hardware translation table access are not explicit accesses.
> 
> which appears to claim that the DSB alone is insufficient. Unfortunately,
> some CPU designers have followed the second clause above, whereas in Linux
> we've been relying on the first. This means that our mapping sequence:
> 
> 	MOV	X0, <valid pte> 
> 	STR	X0, [Xptep]	// Store new PTE to page table
> 	DSB	ISHST
> 	LDR	X1, [X2]	// Translates using the new PTE
> 
> can actually raise a translation fault on the load instruction because the
> translation can be performed speculatively before the page table update and
> then marked as "faulting" by the CPU. For user PTEs, this is ok because we
> can handle the spurious fault, but for kernel PTEs and intermediate table
> entries this results in a panic().

So the DSB isn't sufficient to stop the CPU speculating the
_translation_ above the page table store - to do that you need an
ISB. [I'm not an ARM person so apologies if I've butchered this!] Then
the load then uses the speculated translation and faults.

So, do we need to do something to protect ourselves against the case of
these sorts of spurious faults on x86? I'm also not an x86 person, so
again apologies in advance if I've butchered anything.

Firstly, it's not trivial to get a fixed address from the vmalloc
infrastructure - you have to do something like
__vmalloc_node_range(size, align, fixed_start_address, fixed_start_address + size, ...)
I don't see any callers doing that. But we press on just in case.

Section 4.10.2.3 of Book 3 of the Intel Developers Manual says:

 | The processor may cache translations required for prefetches and for
 | accesses that are a result of speculative execution that would never
 | actually occur in the executed code path.

That's all it says, it doesn't say if it will cache a negative or
faulting lookup in the speculative case. However, if you _could_ cache
a negative result, you'd hope the documentation on when to invalidate
would tell you. That's in 4.10.4.

4.10.4.3 Optional Invalidations includes:

 | The read of a paging-structure entry in translating an address being
 | used to fetch an instruction may appear to execute before an earlier
 | write to that paging-structure entry if there is no serializing
 | instruction between the write and the instruction fetch. Note that
 | the invalidating instructions identified in Section 4.10.4.1 are all
 | serializing instructions.

That only applies to _instruction fetch_, not data fetch. There's no
corresponding dot point for data fetch, suggesting that data fetches
aren't subject to this.

Lastly, arch/x86's native_set_pte_at() performs none of the extra
barriers that ARM does - this also suggests to me that this isn't a
concern on x86. Perhaps page-table walking for data fetches is able to
snoop the store queues, and that's how they get around it.

Given that analysis, that x86 has generally strong memory ordering, and
the lack of response to Will's email from x86ers, I think we probably do
not need a spurious fault handler on x86. (Although I'd love to hear
from any actual x86 experts on this!) Other architecture enablement will
have to do their own analysis.

As I said up top, I'm still puzzling through the smp_wmb() discussion
and I hope to have something for that soon.

Regards,
Daniel

>
> Thanks,
> Mark.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20190827131818.14724-1-will@kernel.org/
> [2] https://lore.kernel.org/linux-mm/20191014152717.GA20438@lakrids.cambridge.arm.com/
