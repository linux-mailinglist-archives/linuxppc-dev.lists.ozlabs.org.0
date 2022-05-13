Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4849A5268E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 20:01:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0Gfv0ycBz3cJD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 04:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nTfowHlp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nTfowHlp; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0GfB3TG6z3bdP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 04:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652464850; x=1684000850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/nNj8XlCpwQw0dLOSacHnO9xHg/M4ZQqauXIJNlqO4c=;
 b=nTfowHlpfhLFkev9F1cZpNOWU1zDM4uV2LnP6+2MNw8GrepIKSm0x8SB
 q5DQszhDQj2vI5YrHGOCRBrBDnMArdzYrWFAnkW2nALmSw4Pc5wUJ0Hcz
 O7q27I536dVM9oOqlYHpOP163XkMZ2N5GAUeExv/lvhhbXo38msCxIoO1
 0vwSyM81+nRvFHRdGWw0nOkP2Zy32RTHBT9NleMV3A0/ZRuOWO0MnUYhC
 CZI5AcO7spTUS4eOdkqibLDG/7X9q/IDBy87QEpXp6D3LMZLDMx2BeQXL
 ecOE5bPCLoUJNJpI4+WbsouEaFknd00fv96gJYjPuo/yNVz7isFHP37So A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="250902600"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="250902600"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 10:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="671444234"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga002.fm.intel.com with ESMTP; 13 May 2022 10:59:45 -0700
Date: Fri, 13 May 2022 11:03:20 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 05/29] x86/apic/vector: Do not allocate vectors for NMIs
Message-ID: <20220513180320.GA22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-6-ricardo.neri-calderon@linux.intel.com>
 <87zgjufjrf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgjufjrf.ffs@tglx>
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

On Fri, May 06, 2022 at 11:12:20PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> > Vectors are meaningless when allocating IRQs with NMI as the delivery
> > mode.
> 
> Vectors are not meaningless. NMI has a fixed vector.
> 
> The point is that for a fixed vector there is no vector management
> required.
> 
> Can you spot the difference?

Yes, I see your point now. Thank you for the explanation.

> 
> > In such case, skip the reservation of IRQ vectors. Do it in the lowest-
> > level functions where the actual IRQ reservation takes place.
> >
> > Since NMIs target specific CPUs, keep the functionality to find the best
> > CPU.
> 
> Again. What for?
>   
> > +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
> > +		cpu = irq_matrix_find_best_cpu(vector_matrix, dest);
> > +		apicd->cpu = cpu;
> > +		vector = 0;
> > +		goto no_vector;
> > +	}
> 
> Why would a NMI ever end up in this code? There is no vector management
> required and this find cpu exercise is pointless.

But even if the NMI has a fixed vector, it is still necessary to determine
which CPU will get the NMI. It is still necessary to determine what to
write in the Destination ID field of the MSI message.

irq_matrix_find_best_cpu() would find the CPU with the lowest number of
managed vectors so that the NMI is directed to that CPU. 

In today's code, an NMI would end up here because we rely on the existing
interrupt management infrastructure... Unless, the check is done the entry
points as you propose.

> 
> >  	vector = irq_matrix_alloc(vector_matrix, dest, resvd, &cpu);
> >  	trace_vector_alloc(irqd->irq, vector, resvd, vector);
> >  	if (vector < 0)
> >  		return vector;
> >  	apic_update_vector(irqd, vector, cpu);
> > +
> > +no_vector:
> >  	apic_update_irq_cfg(irqd, vector, cpu);
> >  
> >  	return 0;
> > @@ -321,12 +330,22 @@ assign_managed_vector(struct irq_data *irqd, const struct cpumask *dest)
> >  	/* set_affinity might call here for nothing */
> >  	if (apicd->vector && cpumask_test_cpu(apicd->cpu, vector_searchmask))
> >  		return 0;
> > +
> > +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
> > +		cpu = irq_matrix_find_best_cpu_managed(vector_matrix, dest);
> > +		apicd->cpu = cpu;
> > +		vector = 0;
> > +		goto no_vector;
> > +	}
> 
> This code can never be reached for a NMI delivery. If so, then it's a
> bug.
> 
> This all is special purpose for that particular HPET NMI watchdog use
> case and we are not exposing this to anything else at all.
> 
> So why are you sprinkling this NMI nonsense all over the place? Just
> because? There are well defined entry points to all of this where this
> can be fenced off.

I put the NMI checks in these points because assign_vector_locked() and
assign_managed_vector() are reached through multiple paths and these are
the two places where the allocation of the vector is requested and the
destination CPU is determined.

I do observe this code being reached for an NMI, but that is because this
code still does not know about NMIs... Unless the checks for NMI are put
in the entry points as you pointed out.

The intent was to refactor the code in a generic manner and not to focus
only in the NMI watchdog. That would have looked hacky IMO.

> 
> If at some day the hardware people get their act together and provide a
> proper vector space for NMIs then we have to revisit that, but then
> there will be a separate NMI vector management too.
> 
> What you want is the below which also covers the next patch. Please keep
> an eye on the comments I added/modified.

Thank you for the code and the clarifying comments.
> 
> Thanks,
> 
>         tglx
> ---
> --- a/arch/x86/kernel/apic/vector.c
> +++ b/arch/x86/kernel/apic/vector.c
> @@ -42,6 +42,7 @@ EXPORT_SYMBOL_GPL(x86_vector_domain);
>  static DEFINE_RAW_SPINLOCK(vector_lock);
>  static cpumask_var_t vector_searchmask;
>  static struct irq_chip lapic_controller;
> +static struct irq_chip lapic_nmi_controller;
>  static struct irq_matrix *vector_matrix;
>  #ifdef CONFIG_SMP
>  static DEFINE_PER_CPU(struct hlist_head, cleanup_list);
> @@ -451,6 +452,10 @@ static int x86_vector_activate(struct ir
>  	trace_vector_activate(irqd->irq, apicd->is_managed,
>  			      apicd->can_reserve, reserve);
>  
> +	/* NMI has a fixed vector. No vector management required */
> +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
> +		return 0;
> +
>  	raw_spin_lock_irqsave(&vector_lock, flags);
>  	if (!apicd->can_reserve && !apicd->is_managed)
>  		assign_irq_vector_any_locked(irqd);
> @@ -472,6 +477,10 @@ static void vector_free_reserved_and_man
>  	trace_vector_teardown(irqd->irq, apicd->is_managed,
>  			      apicd->has_reserved);
>  
> +	/* NMI has a fixed vector. No vector management required */
> +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
> +		return;
> +
>  	if (apicd->has_reserved)
>  		irq_matrix_remove_reserved(vector_matrix);
>  	if (apicd->is_managed)
> @@ -568,6 +577,24 @@ static int x86_vector_alloc_irqs(struct
>  		irqd->hwirq = virq + i;
>  		irqd_set_single_target(irqd);
>  
> +		if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
> +			/*
> +			 * NMIs have a fixed vector and need their own
> +			 * interrupt chip so nothing can end up in the
> +			 * regular local APIC management code except the
> +			 * MSI message composing callback.
> +			 */
> +			irqd->chip = &lapic_nmi_controller;
> +			/*
> +			 * Don't allow affinity setting attempts for NMIs.
> +			 * This cannot work with the regular affinity
> +			 * mechanisms and for the intended HPET NMI
> +			 * watchdog use case it's not required.

But we do need the ability to set affinity, right? As stated above, we need
to know what Destination ID to write in the MSI message or in the interrupt
remapping table entry.

It cannot be any CPU because only one specific CPU is supposed to handle the
NMI from the HPET channel.

We cannot hard-code a CPU for that because it may go offline (and ignore NMIs)
or not be part of the monitored CPUs.

Also, if lapic_nmi_controller.irq_set_affinity() is NULL, then irq_chips
INTEL-IR, AMD-IR, those using msi_domain_set_affinity() need to check for NULL.
They currently unconditionally call the parent irq_chip's irq_set_affinity().
I see that there is a irq_chip_set_affinity_parent() function. Perhaps it can
be used for this check?

> +			 */
> +			irqd_set_no_balance(irqd);

This code does not set apicd->hw_irq_cfg.delivery_mode as NMI, right?
I had to add that to make it work.

> +			continue;
> +		}
> +
>  		/*
>  		 * Prevent that any of these interrupts is invoked in
>  		 * non interrupt context via e.g. generic_handle_irq()
> @@ -921,6 +948,11 @@ static struct irq_chip lapic_controller
>  	.irq_retrigger		= apic_retrigger_irq,
>  };
>  
> +static struct irq_chip lapic_nmi_controller = {
> +	.name			= "APIC-NMI",
> +	.irq_compose_msi_msg	= x86_vector_msi_compose_msg,
> +};
> +
>  #ifdef CONFIG_SMP
>  
>  static void free_moved_vector(struct apic_chip_data *apicd)
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -261,6 +261,11 @@ static inline bool irqd_is_per_cpu(struc
>  	return __irqd_to_state(d) & IRQD_PER_CPU;
>  }
>  
> +static inline void irqd_set_no_balance(struct irq_data *d)
> +{
> +	__irqd_to_state(d) |= IRQD_NO_BALANCING;
> +}
> +
>  static inline bool irqd_can_balance(struct irq_data *d)
>  {
>  	return !(__irqd_to_state(d) & (IRQD_PER_CPU | IRQD_NO_BALANCING));

Thanks and BR,
Ricardo
