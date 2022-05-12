Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C7524160
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 02:07:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzBtQ2VJMz3cDM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 10:07:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/wj7Cvw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A/wj7Cvw; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzBsf3yf9z3bdj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 10:07:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652314022; x=1683850022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iEGg3ZUCdx9uygbP/iQOaVPDEP0BAuMfZKqEQ1Cahnc=;
 b=A/wj7CvwuwphXbdEoY3pdiRRNfXQmu2atGrW8hAYZZbzKQxO2uE8MV3I
 fYOGo+GgKumiE2+vQvRw+HJzSS4uDQ583yfDG+t7PzQ3gwUsyr1pylvBu
 XqpgTONMYnTECe5br39KJKE9OSLclZMdxtEFO34dSNFlBv0NdkOs6hhOU
 JIPH2XFl6ge/lpyF+DX5aA6Y2vdNL+Bm8Pr7L17Xk5Nhm1c/HT4x9nogl
 E4T/+gofgTTBml0J7NeBlFmin8mO6sqY1Xi7y0ZOWXrXxl2XGlgFWPRdK
 RhouA59aOMajjtz9PltWP1Mja88Me5Ip8vgyaZtbc9a8203Jy0p8CzbzY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="251897472"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="251897472"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 17:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="658374063"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by FMSMGA003.fm.intel.com with ESMTP; 11 May 2022 17:05:53 -0700
Date: Wed, 11 May 2022 17:09:24 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 01/29] irq/matrix: Expose functions to allocate the
 best CPU for new vectors
Message-ID: <20220512000924.GA16273@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-2-ricardo.neri-calderon@linux.intel.com>
 <878rreh27n.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rreh27n.ffs@tglx>
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

On Fri, May 06, 2022 at 09:48:28PM +0200, Thomas Gleixner wrote:
> Ricardo,

Thank you very much for your feedback Thomas! I am sorry for my late reply, I
had been out of office.

> 
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> > Certain types of interrupts, such as NMI, do not have an associated vector.
> > They, however, target specific CPUs. Thus, when assigning the destination
> > CPU, it is beneficial to select the one with the lowest number of
> > vectors.
> 
> Why is that beneficial especially in the context of a NMI watchdog which
> then broadcasts the NMI to all other CPUs?

My intent was not the NMI watchdog specifically but potential use cases that do
not involve NMI broadcasts. If the NMI targets a single CPU, it is best to
select the CPU with the lowest vector allocation count.

> 
> That's wishful thinking perhaps, but I don't see any benefit at all.
> 
> > Prepend the functions matrix_find_best_cpu_managed() and
> > matrix_find_best_cpu_managed()
> 
> The same function prepended twice becomes two functions :)
> 

Sorry, I missed this.

> > with the irq_ prefix and expose them for
> > IRQ controllers to use when allocating and activating vector-less IRQs.
> 
> There is no such thing like a vectorless IRQ. NMIs have a vector. Can we
> please describe facts and not pulled out of thin air concepts which do
> not exist?

Thank you for the clarification. I see your point. I wrote this patch because
maskable interrupts and NMIs have different entry points. As you state,
however, the also have a vector.

I can drop this patch.

BR,
Ricardo

> 
> Thanks,
> 
>         tglx
