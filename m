Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E38652ADCE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 00:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2qtD5N4qz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 08:05:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Szi7Gy5e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Szi7Gy5e; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2qsZ75NGz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 08:04:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652825075; x=1684361075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DYnEdSppO39yh6uNPMT5k/kcPnrUIqJqd4/BSKdNERc=;
 b=Szi7Gy5eNvLBAJpOY1sD/TSi5bzax7pfq5jzaPxJMLS/7KbuKiy2hul8
 ORY4nmp23H+ggmwp2Jj4FEVIPgAlj7m2PuQpcYRbegGTm0oG8Ami1uisA
 pmSMJd2d2woBsBi5yUKkfmCilpT4wFVTPJdp+ax5b8r3f90Pp/k/C6EXp
 UFECy8L5qzlSTe2itDcTep/bCsgEqIMJlQJP45GSbou5IiWIV65s4Vnsa
 SFMin9BmdnR7kjMP8QeokuomMsVFxExCZ6oyrHDIcX9tS2jxMt/pH5zzW
 9GtBw9S4fwpDWFJVJlqgyNaef5HCQBT8EMdQZHj3WcKdSedUn3wM9vaQH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="253399767"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="253399767"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 15:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="673075036"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga002.fm.intel.com with ESMTP; 17 May 2022 15:04:27 -0700
Date: Tue, 17 May 2022 15:08:10 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 28/29] x86/tsc: Restart NMI watchdog after refining
 tsc_khz
Message-ID: <20220517220810.GB6711@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-29-ricardo.neri-calderon@linux.intel.com>
 <1652180070.1r874kr0tg.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652180070.1r874kr0tg.astroid@bobo.none>
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
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Stephane Eranian <eranian@google.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 09:16:21PM +1000, Nicholas Piggin wrote:
> Excerpts from Ricardo Neri's message of May 6, 2022 10:00 am:
> > The HPET hardlockup detector relies on tsc_khz to estimate the value of
> > that the TSC will have when its HPET channel fires. A refined tsc_khz
> > helps to estimate better the expected TSC value.
> > 
> > Using the early value of tsc_khz may lead to a large error in the expected
> > TSC value. Restarting the NMI watchdog detector has the effect of kicking
> > its HPET channel and make use of the refined tsc_khz.
> > 
> > When the HPET hardlockup is not in use, restarting the NMI watchdog is
> > a noop.
> > 
> > Cc: Andi Kleen <ak@linux.intel.com>
> > Cc: Stephane Eranian <eranian@google.com>
> > Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
> > Cc: iommu@lists.linux-foundation.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: x86@kernel.org
> > Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > ---
> > Changes since v5:
> >  * Introduced this patch
> > 
> > Changes since v4
> >  * N/A
> > 
> > Changes since v3
> >  * N/A
> > 
> > Changes since v2:
> >  * N/A
> > 
> > Changes since v1:
> >  * N/A
> > ---
> >  arch/x86/kernel/tsc.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index cafacb2e58cc..cc1843044d88 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> > @@ -1386,6 +1386,12 @@ static void tsc_refine_calibration_work(struct work_struct *work)
> >  	/* Inform the TSC deadline clockevent devices about the recalibration */
> >  	lapic_update_tsc_freq();
> >  
> > +	/*
> > +	 * If in use, the HPET hardlockup detector relies on tsc_khz.
> > +	 * Reconfigure it to make use of the refined tsc_khz.
> > +	 */
> > +	lockup_detector_reconfigure();
> 
> I don't know if the API is conceptually good.
> 
> You change something that the lockup detector is currently using, 
> *while* the detector is running asynchronously, and then reconfigure
> it. 

Yes, this is what happens.

> What happens in the window? If this code is only used for small
> adjustments maybe it does not really matter

Please see my comment

> but in principle it's a bad API to export.
> 
> lockup_detector_reconfigure as an internal API is okay because it
> reconfigures things while the watchdog is stopped

I see.

> [actually that  looks untrue for soft dog which uses watchdog_thresh in
> is_softlockup(), but that should be fixed].

Perhaps there should be a watchdog_thresh_user. When the user updates it,
the detector is stopped, watchdog_thresh is updated, and then the detector
is resumed.

> 
> You're the arch so you're allowed to stop the watchdog and configure
> it, e.g., hardlockup_detector_perf_stop() is called in arch/.

I had it like this but it did not look right to me. You are right, however,
I can stop/restart the watchdog when needed.

Thanks and BR,
Ricardo
