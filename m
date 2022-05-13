Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61D526D8D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 01:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0QFx44hjz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 09:43:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eDTj7t/L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eDTj7t/L; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0QFG1mxqz3bc9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 09:43:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652485394; x=1684021394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l9BUQ0IAZJ5rrqEJ/wlo5FNsSwI6FBi8qNsQPZI+Uzg=;
 b=eDTj7t/LaIqScxLPp1b7ZAI76O58ORElOngeOsvoxrCOwCHX5prD7qse
 iiN/ZHEfMYYrTJYF6DUJGUra6xV/CwTUweC1b6dS/cFm6f04o/+kWSIK2
 xKsYpHx9HQv0DjKQrpd91y5cyg/jzpyvq0JfZmM3mKtoWHLvfa5O7z8e+
 crxBEnD7KRU1A32sC8GyVYDpLOiw8XDd9DBAs5z6oTuQEe1PhLsePEdK0
 wYfUAagCXNYrxdm5Mm/Es8GS/g/EQToXRYxMVb6fkcztMZF1fJxM/vfzT
 lCpSZkLiO+1VxL2KkoF2VUwHot8zbP5D/5P9MVE1XMu/wadv9aMR8aXpq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="333470649"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="333470649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 16:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="625093273"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga008.fm.intel.com with ESMTP; 13 May 2022 16:42:06 -0700
Date: Fri, 13 May 2022 16:45:42 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 05/29] x86/apic/vector: Do not allocate vectors for NMIs
Message-ID: <20220513234542.GC9074@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-6-ricardo.neri-calderon@linux.intel.com>
 <87zgjufjrf.ffs@tglx>
 <20220513180320.GA22683@ranerica-svr.sc.intel.com>
 <87v8u9rwce.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8u9rwce.ffs@tglx>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, May 13, 2022 at 10:50:09PM +0200, Thomas Gleixner wrote:
> On Fri, May 13 2022 at 11:03, Ricardo Neri wrote:
> > On Fri, May 06, 2022 at 11:12:20PM +0200, Thomas Gleixner wrote:
> >> Why would a NMI ever end up in this code? There is no vector management
> >> required and this find cpu exercise is pointless.
> >
> > But even if the NMI has a fixed vector, it is still necessary to determine
> > which CPU will get the NMI. It is still necessary to determine what to
> > write in the Destination ID field of the MSI message.
> >
> > irq_matrix_find_best_cpu() would find the CPU with the lowest number of
> > managed vectors so that the NMI is directed to that CPU. 
> 
> What's the point to send it to the CPU with the lowest number of
> interrupts. It's not that this NMI happens every 50 microseconds.
> We pick one online CPU and are done.

Indeed, that is sensible.

> 
> > In today's code, an NMI would end up here because we rely on the existing
> > interrupt management infrastructure... Unless, the check is done the entry
> > points as you propose.
> 
> Correct. We don't want to call into functions which are not designed for
> NMIs.

Agreed.

>  
> >> > +
> >> > +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
> >> > +		cpu = irq_matrix_find_best_cpu_managed(vector_matrix, dest);
> >> > +		apicd->cpu = cpu;
> >> > +		vector = 0;
> >> > +		goto no_vector;
> >> > +	}
> >> 
> >> This code can never be reached for a NMI delivery. If so, then it's a
> >> bug.
> >> 
> >> This all is special purpose for that particular HPET NMI watchdog use
> >> case and we are not exposing this to anything else at all.
> >> 
> >> So why are you sprinkling this NMI nonsense all over the place? Just
> >> because? There are well defined entry points to all of this where this
> >> can be fenced off.
> >
> > I put the NMI checks in these points because assign_vector_locked() and
> > assign_managed_vector() are reached through multiple paths and these are
> > the two places where the allocation of the vector is requested and the
> > destination CPU is determined.
> >
> > I do observe this code being reached for an NMI, but that is because this
> > code still does not know about NMIs... Unless the checks for NMI are put
> > in the entry points as you pointed out.
> >
> > The intent was to refactor the code in a generic manner and not to focus
> > only in the NMI watchdog. That would have looked hacky IMO.
> 
> We don't want to have more of this really. Supporting NMIs on x86 in a
> broader way is simply not reasonable because there is only one NMI
> vector and we have no sensible way to get to the cause of the NMI
> without a massive overhead.
> 
> Even if we get multiple NMI vectors some shiny day, this will be
> fundamentally different than regular interrupts and certainly not
> exposed broadly. There will be 99.99% fixed vectors for simplicity sake.

Understood.

> 
> >> +		if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
> >> +			/*
> >> +			 * NMIs have a fixed vector and need their own
> >> +			 * interrupt chip so nothing can end up in the
> >> +			 * regular local APIC management code except the
> >> +			 * MSI message composing callback.
> >> +			 */
> >> +			irqd->chip = &lapic_nmi_controller;
> >> +			/*
> >> +			 * Don't allow affinity setting attempts for NMIs.
> >> +			 * This cannot work with the regular affinity
> >> +			 * mechanisms and for the intended HPET NMI
> >> +			 * watchdog use case it's not required.
> >
> > But we do need the ability to set affinity, right? As stated above, we need
> > to know what Destination ID to write in the MSI message or in the interrupt
> > remapping table entry.
> >
> > It cannot be any CPU because only one specific CPU is supposed to handle the
> > NMI from the HPET channel.
> >
> > We cannot hard-code a CPU for that because it may go offline (and ignore NMIs)
> > or not be part of the monitored CPUs.
> >
> > Also, if lapic_nmi_controller.irq_set_affinity() is NULL, then irq_chips
> > INTEL-IR, AMD-IR, those using msi_domain_set_affinity() need to check for NULL.
> > They currently unconditionally call the parent irq_chip's irq_set_affinity().
> > I see that there is a irq_chip_set_affinity_parent() function. Perhaps it can
> > be used for this check?
> 
> Yes, this lacks obviously a NMI specific set_affinity callback and this
> can be very trivial and does not have any of the complexity of interrupt
> affinity assignment. First online CPU in the mask with a fallback to any
> online CPU.

Why would we need a fallback to any online CPU? Shouldn't it fail if it cannot
find an online CPU in the mask?

> 
> I did not claim that this is complete. This was for illustration.

In the reworked patch, may I add a Co-developed-by with your name and your SOB?

> 
> >> +			 */
> >> +			irqd_set_no_balance(irqd);
> >
> > This code does not set apicd->hw_irq_cfg.delivery_mode as NMI, right?
> > I had to add that to make it work.
> 
> I assumed you can figure that out on your own :)

:)

Thanks and BR,
Ricardo
