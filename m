Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FD5268F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 20:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0Glx0Tqjz3cLp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 04:05:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UUjhZobg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UUjhZobg; dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0GlH4QZJz3bpB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 04:05:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652465115; x=1684001115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mmVeSLOWGrrJNNPaH5sVqOAPJshfUhndaLU/q/Ct39k=;
 b=UUjhZobgUUosYFqyUGR1bW62sws1pUM8EFdLrcrHslKT63ueR4yJbK6K
 JO65/YwZGuwWuqUwecclLPlURTEna6qVyb8Spw/PApC0t6DwvE/EKv5kP
 JwXw2vAxsdbhB9EBwXG5VbhKbnEvbGjCkRaTvGF/fzwzaV/TkYOmjHnSv
 BqR8V6PdeRWHZpfYSElViFwMzs0Cy3g3wlKauwyTez7cgeRyWzNx9v8Ak
 4bRNTixu9Fhk4SCux1kIM2pRERWq7XQW+67sQu4Zo6cGfl8joRLcDCMug
 xUbjDH+Upm76Rh0AmqjXa2oJyW0EncDMUHbqgBZoNKzzOYzz1cS1qAbOB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="330975624"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="330975624"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 11:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="624962791"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga008.fm.intel.com with ESMTP; 13 May 2022 11:04:09 -0700
Date: Fri, 13 May 2022 11:07:44 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 10/29] iommu/vt-d: Implement minor tweaks for NMI irqs
Message-ID: <20220513180744.GB22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-11-ricardo.neri-calderon@linux.intel.com>
 <87wneyfj90.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wneyfj90.ffs@tglx>
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

On Fri, May 06, 2022 at 11:23:23PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> > The Intel IOMMU interrupt remapping driver already programs correctly the
> > delivery mode of individual irqs as per their irq_data. Improve handling
> > of NMIs. Allow only one irq per NMI. Also, it is not necessary to cleanup
> > irq vectors after updating affinity.
> 
> Structuring a changelog in paragraphs might make it readable. New lines
> exist for a reason.

Sure, I can structure this in paragraphps.
> 
> > NMIs do not have associated vectors.
> 
> Again. NMI has an vector associated, but it is not subject to dynamic
> vector management.

Indeed, it is clear to me now.

> 
> > diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
> > index fb2d71bea98d..791a9331e257 100644
> > --- a/drivers/iommu/intel/irq_remapping.c
> > +++ b/drivers/iommu/intel/irq_remapping.c
> > @@ -1198,8 +1198,12 @@ intel_ir_set_affinity(struct irq_data *data, const struct cpumask *mask,
> >  	 * After this point, all the interrupts will start arriving
> >  	 * at the new destination. So, time to cleanup the previous
> >  	 * vector allocation.
> > +	 *
> > +	 * Do it only for non-NMI irqs. NMIs don't have associated
> > +	 * vectors.
> 
> See above.

Sure.

> 
> >  	 */
> > -	send_cleanup_vector(cfg);
> > +	if (cfg->delivery_mode != APIC_DELIVERY_MODE_NMI)
> > +		send_cleanup_vector(cfg);
> 
> So this needs to be replicated for all invocations of
> send_cleanup_vector(), right? Why can't you put it into that function?

Certainly, it can be done inside the function.

>   
> >  	return IRQ_SET_MASK_OK_DONE;
> >  }
> > @@ -1352,6 +1356,9 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
> >  	if (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI)
> >  		info->flags &= ~X86_IRQ_ALLOC_CONTIGUOUS_VECTORS;
> >  
> > +	if ((info->flags & X86_IRQ_ALLOC_AS_NMI) && nr_irqs != 1)
> > +		return -EINVAL;
> 
> This cannot be reached when the vector allocation domain already
> rejected it, but copy & pasta is wonderful and increases the line count.

Yes, this is not needed.

Thanks and BR,
Ricardo
> 
> Thanks,
> 
>         tglx
> 
> 
