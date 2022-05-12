Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE7524195
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 02:36:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzCX304l8z3cG4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 10:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E69tp0Oc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E69tp0Oc; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzCWP2C93z2yhD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 10:36:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652315777; x=1683851777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dLBHzXs/7dIe56Ck53G1U2+PedWXR/Xhh4qftWNzQyo=;
 b=E69tp0OcOSG7fBXXdfEiho7yjdGQACNLoa3KN5A/+qSt0WKsfONoNmje
 I4VLlMuHoRNgshT0J/RH7SRW3VJEyWe60Cz+Y5a0WluzElfSVpNHEB17X
 cdKBkVDb3SII/wvp0kp/SdfaYG+GF+x4561mQQKRLsfyPi075l4zgx8Jp
 OQ1/azq6NMZtwV5CXllMEUG9bgE5lTmoM16+y6fsZ1sel1zTVhmHoszjV
 ArZOVweU8gNkZFaHtxR4s1iSkd0dD4umnr4516eLUqNZgBjg78sIXlLw4
 Pa7H2aCYssgI+h+JVf42vHDVp9GwKGZYT5coLEtN+L0/CjHz3oyiDRaLF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="249744713"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="249744713"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 17:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="711708630"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2022 17:35:14 -0700
Date: Wed, 11 May 2022 17:38:45 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 03/29] x86/apic/msi: Set the delivery mode
 individually for each IRQ
Message-ID: <20220512003845.GC16273@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-4-ricardo.neri-calderon@linux.intel.com>
 <8735hmh1f5.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735hmh1f5.ffs@tglx>
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

On Fri, May 06, 2022 at 10:05:34PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> > There are no restrictions in hardware to set  MSI messages with its
> > own delivery mode.
> 
> "messages with its own" ? Plural/singular confusion.

Yes, this is not correct. It should have read "messages with their own..."

> 
> > Use the mode specified in the provided IRQ hardware
> > configuration data. Since most of the IRQs are configured to use the
> > delivery mode of the APIC driver in use (set in all of them to
> > APIC_DELIVERY_MODE_FIXED), the only functional changes are where
> > IRQs are configured to use a specific delivery mode.
> 
> This does not parse. There are no functional changes due to this patch
> and there is no point talking about functional changes in subsequent
> patches here.

I will remove this.

> 
> > Changing the utility function __irq_msi_compose_msg() takes care of
> > implementing the change in the in the local APIC, PCI-MSI, and DMAR-MSI
> 
> in the in the

Sorry! This is not correct.

> 
> > irq_chips.
> >
> > The IO-APIC irq_chip configures the entries in the interrupt redirection
> > table using the delivery mode specified in the corresponding MSI message.
> > Since the MSI message is composed by a higher irq_chip in the hierarchy,
> > it does not need to be updated.
> 
> The point is that updating __irq_msi_compose_msg() covers _all_ MSI
> consumers including IO-APIC.
> 
> I had to read that changelog 3 times to make sense of it. Something like
> this perhaps:
> 
>   "x86/apic/msi: Use the delivery mode from irq_cfg for message composition
> 
>    irq_cfg provides a delivery mode for each interrupt. Use it instead
>    of the hardcoded APIC_DELIVERY_MODE_FIXED. This allows to compose
>    messages for NMI delivery mode which is required to implement a HPET
>    based NMI watchdog.
> 
>    No functional change as the default delivery mode is set to
>    APIC_DELIVERY_MODE_FIXED."

Thank you for your help on the changelog! I will take your suggestion.

BR,
Ricardo
> 
> Thanks,
> 
>         tglx
