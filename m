Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400BC5269C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 20:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0Hy70fZQz3cLZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 04:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b4K8MX3S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b4K8MX3S; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0HxQ62l0z2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 04:59:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652468347; x=1684004347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rCKiBLo5JPRevaGfzEi2/7NKS4ODTjaZmZIfll5payA=;
 b=b4K8MX3SP9Vja/kV/EvD+0pZw3kprmp8QxVjyYeAo9yrkNwaNyNJTGQy
 7ZuvkJYUfIzivOntR14iYXsY3rN8/+m28nxwAcT4ID9mtGKmDIgxwQ7Dh
 O5JDkBIrVdnwVWaRjEbQIFnlM10l9AMGHCbyi+YVMQO92qLOy3SHKDmSz
 NGzCXTtdrtrSWcsh60YFMHb6e1fr0b5atHZsRuFWkE5UNG3/qIt7L+wt0
 2e4Pp1Ui+zJrPfsrbUrSRzy7p1GDF3rZn6ujQERobe9QZJRaex+YaXsEt
 XbQIzOcKpX8xc0ETIcMRWZBMIbRMuGTImZOhRrYT/DUu2Hl+o3ICwHyJR Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270317935"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="270317935"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 11:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="521535494"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga003.jf.intel.com with ESMTP; 13 May 2022 11:58:02 -0700
Date: Fri, 13 May 2022 12:01:37 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 12/29] iommu/amd: Enable NMIPass when allocating an
 NMI irq
Message-ID: <20220513190137.GC22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-13-ricardo.neri-calderon@linux.intel.com>
 <87tua2fj41.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tua2fj41.ffs@tglx>
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

On Fri, May 06, 2022 at 11:26:22PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> >  
> > +	if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
> > +		/* Only one IRQ per NMI */
> > +		if (nr_irqs != 1)
> > +			return -EINVAL;
> 
> See previous reply.

I remove this check.

Thanks and BR,
Ricardo
> 
