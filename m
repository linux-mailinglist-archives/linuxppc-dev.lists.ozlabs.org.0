Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1723526BDA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 22:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0LQQ6dSgz3cK6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 06:50:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IL5ps9Pi;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RyMi/A5P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=IL5ps9Pi; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=RyMi/A5P; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0LPj4pkDz3bdM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 06:50:17 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652475010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zEdz3PBK+OaYEz88/8/oMxcc8qsP3Ut2QqnQHlJZHqE=;
 b=IL5ps9Pi2NFB4qTc/+l9Q6Ywr61TAXtYWQaoSp7/YbaTcIvSE9C5eLi+t7xEHqEeYjETXy
 JmzdwkR1BjpqSKaC0i1aIRbhjFDiQDzAY0BCHdHh/4VpIInaO6SaQP3tcK+xed/cxdQc98
 EeugDl7hMWE7H4HfUhMdKa0BDk7UiwLoggjpg6a0mH4MB8CPpd8kuWCvK2t0KbLmFzAf58
 alHc5j1TQhITDFdCadertqBxYuofkeeTGIqgwJFHxxMd3hIwPbd+zCucmhhovYvvi35KA7
 wXRs36ZyRr73nbP/djYS0b302aslX8nO8TU0pWKtw2DfpZnQdl6w3lc/Jb2z7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652475010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zEdz3PBK+OaYEz88/8/oMxcc8qsP3Ut2QqnQHlJZHqE=;
 b=RyMi/A5Po6vaHS9i40z6IeKIq7BgJOWcZ6bfF5+HAQR7bK6hdxFiTaWa09d2O8EN+o2gLw
 QsH3uYNZXchYGcCw==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH v6 05/29] x86/apic/vector: Do not allocate vectors for NMIs
In-Reply-To: <20220513180320.GA22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-6-ricardo.neri-calderon@linux.intel.com>
 <87zgjufjrf.ffs@tglx> <20220513180320.GA22683@ranerica-svr.sc.intel.com>
Date: Fri, 13 May 2022 22:50:09 +0200
Message-ID: <87v8u9rwce.ffs@tglx>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Tony Luck <tony.luck@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 13 2022 at 11:03, Ricardo Neri wrote:
> On Fri, May 06, 2022 at 11:12:20PM +0200, Thomas Gleixner wrote:
>> Why would a NMI ever end up in this code? There is no vector management
>> required and this find cpu exercise is pointless.
>
> But even if the NMI has a fixed vector, it is still necessary to determine
> which CPU will get the NMI. It is still necessary to determine what to
> write in the Destination ID field of the MSI message.
>
> irq_matrix_find_best_cpu() would find the CPU with the lowest number of
> managed vectors so that the NMI is directed to that CPU. 

What's the point to send it to the CPU with the lowest number of
interrupts. It's not that this NMI happens every 50 microseconds.
We pick one online CPU and are done.

> In today's code, an NMI would end up here because we rely on the existing
> interrupt management infrastructure... Unless, the check is done the entry
> points as you propose.

Correct. We don't want to call into functions which are not designed for
NMIs.
 
>> > +
>> > +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
>> > +		cpu = irq_matrix_find_best_cpu_managed(vector_matrix, dest);
>> > +		apicd->cpu = cpu;
>> > +		vector = 0;
>> > +		goto no_vector;
>> > +	}
>> 
>> This code can never be reached for a NMI delivery. If so, then it's a
>> bug.
>> 
>> This all is special purpose for that particular HPET NMI watchdog use
>> case and we are not exposing this to anything else at all.
>> 
>> So why are you sprinkling this NMI nonsense all over the place? Just
>> because? There are well defined entry points to all of this where this
>> can be fenced off.
>
> I put the NMI checks in these points because assign_vector_locked() and
> assign_managed_vector() are reached through multiple paths and these are
> the two places where the allocation of the vector is requested and the
> destination CPU is determined.
>
> I do observe this code being reached for an NMI, but that is because this
> code still does not know about NMIs... Unless the checks for NMI are put
> in the entry points as you pointed out.
>
> The intent was to refactor the code in a generic manner and not to focus
> only in the NMI watchdog. That would have looked hacky IMO.

We don't want to have more of this really. Supporting NMIs on x86 in a
broader way is simply not reasonable because there is only one NMI
vector and we have no sensible way to get to the cause of the NMI
without a massive overhead.

Even if we get multiple NMI vectors some shiny day, this will be
fundamentally different than regular interrupts and certainly not
exposed broadly. There will be 99.99% fixed vectors for simplicity sake.

>> +		if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
>> +			/*
>> +			 * NMIs have a fixed vector and need their own
>> +			 * interrupt chip so nothing can end up in the
>> +			 * regular local APIC management code except the
>> +			 * MSI message composing callback.
>> +			 */
>> +			irqd->chip = &lapic_nmi_controller;
>> +			/*
>> +			 * Don't allow affinity setting attempts for NMIs.
>> +			 * This cannot work with the regular affinity
>> +			 * mechanisms and for the intended HPET NMI
>> +			 * watchdog use case it's not required.
>
> But we do need the ability to set affinity, right? As stated above, we need
> to know what Destination ID to write in the MSI message or in the interrupt
> remapping table entry.
>
> It cannot be any CPU because only one specific CPU is supposed to handle the
> NMI from the HPET channel.
>
> We cannot hard-code a CPU for that because it may go offline (and ignore NMIs)
> or not be part of the monitored CPUs.
>
> Also, if lapic_nmi_controller.irq_set_affinity() is NULL, then irq_chips
> INTEL-IR, AMD-IR, those using msi_domain_set_affinity() need to check for NULL.
> They currently unconditionally call the parent irq_chip's irq_set_affinity().
> I see that there is a irq_chip_set_affinity_parent() function. Perhaps it can
> be used for this check?

Yes, this lacks obviously a NMI specific set_affinity callback and this
can be very trivial and does not have any of the complexity of interrupt
affinity assignment. First online CPU in the mask with a fallback to any
online CPU.

I did not claim that this is complete. This was for illustration.

>> +			 */
>> +			irqd_set_no_balance(irqd);
>
> This code does not set apicd->hw_irq_cfg.delivery_mode as NMI, right?
> I had to add that to make it work.

I assumed you can figure that out on your own :)

Thanks,

        tglx
