Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEE52417C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 02:25:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzCGh4ctsz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 10:25:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n5E+XsWq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n5E+XsWq; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzCG063r9z3bfC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 10:24:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652315081; x=1683851081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FXGLp4kn6zowFU/uMojpzoAT+8Tt5jfdv5yfT9ck7Mg=;
 b=n5E+XsWqWzRlviyInD2X7jRDlvorCqKz9KNZa15Deq1TZxvqq+M85JT2
 0PfYdGixjCMUkS9G5rMQvP634+8peYVfCUQdP+t769l4uy+ygjRP04lRc
 Kx2mYUd0/2ozOoUssAYKHjcx1Vx8iMurwICzGRi0r+LyRvc5/eKdN5RBV
 j1EvQomSbUuarGcBszfA9+HF+o0l0An6iatYhtAlFUXKH19ld+BywYD0v
 5BY/+B5LMRi0Kuo6oxa9juc8z9Exg5NEoJByLx4IMlYpGBegEnbSQpOBF
 FVYfLosUUs8EklZvE6CtCAMeJKZ5x0oOhRxfp7E3ehaNrYDgl3nd4IImb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="249743383"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="249743383"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 17:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594395631"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 17:23:27 -0700
Date: Wed, 11 May 2022 17:26:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 02/29] x86/apic: Add irq_cfg::delivery_mode
Message-ID: <20220512002658.GB16273@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-3-ricardo.neri-calderon@linux.intel.com>
 <875ymih1yl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875ymih1yl.ffs@tglx>
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

On Fri, May 06, 2022 at 09:53:54PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> > Currently, the delivery mode of all interrupts is set to the mode of the
> > APIC driver in use. There are no restrictions in hardware to configure the
> > delivery mode of each interrupt individually. Also, certain IRQs need
> > to be
> 
> s/IRQ/interrupt/ Changelogs can do without acronyms.

Sure. I will sanitize all the changelogs to remove acronyms.

> 
> > configured with a specific delivery mode (e.g., NMI).
> >
> > Add a new member, delivery_mode, to struct irq_cfg. Subsequent changesets
> > will update every irq_domain to set the delivery mode of each IRQ to that
> > specified in its irq_cfg data.
> >
> > To keep the current behavior, when allocating an IRQ in the root
> > domain
> 
> The root domain does not allocate an interrupt. The root domain
> allocates a vector for an interrupt. There is a very clear and technical
> destinction. Can you please be more careful about the wording?

I will review the wording in the changelogs.

> 
> > --- a/arch/x86/kernel/apic/vector.c
> > +++ b/arch/x86/kernel/apic/vector.c
> > @@ -567,6 +567,7 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
> >  		irqd->chip_data = apicd;
> >  		irqd->hwirq = virq + i;
> >  		irqd_set_single_target(irqd);
> > +
> 
> Stray newline.

Sorry! I will remove it.
> 
> >  		/*
> >  		 * Prevent that any of these interrupts is invoked in
> >  		 * non interrupt context via e.g. generic_handle_irq()
> > @@ -577,6 +578,14 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
> >  		/* Don't invoke affinity setter on deactivated interrupts */
> >  		irqd_set_affinity_on_activate(irqd);
> >  
> > +		/*
> > +		 * Initialize the delivery mode of this irq to match the
> 
> s/irq/interrupt/

I will make this change.

Thanks and BR,
Ricardo

> 
> > +		 * default delivery mode of the APIC. Children irq domains
> > +		 * may take the delivery mode from the individual irq
> > +		 * configuration rather than from the APIC driver.
> > +		 */
> > +		apicd->hw_irq_cfg.delivery_mode = apic->delivery_mode;
> > +
> >  		/*
> >  		 * Legacy vectors are already assigned when the IOAPIC
> >  		 * takes them over. They stay on the same vector. This is
