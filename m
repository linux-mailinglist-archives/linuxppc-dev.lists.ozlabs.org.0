Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3555297A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 05:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Ldk3K4pz3by2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 13:07:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KKGw9guo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KKGw9guo; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Lcz6nDdz30QN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 13:06:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652756820; x=1684292820;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1eXK/Lt9/M/kHEgyQGFmbYTuXrCc0mJ/GpdZrACprGU=;
 b=KKGw9guolZB4TGnePbzXOxOYsGSHqLp5mnjFsf0c4Ss9C8fS7WwDsX0Q
 d3MlSjJvWUPwysSrQnQdoq0Eso4Z3vwcWLdVLT4wQSEHuIObcIQmynMzk
 E67ySG7UxS3bQZfdNRtxf2Im56UAmkyaw7kTpq8knX8MRsr4RfhKoYWzu
 3rIxh7LzxCXVAHCGKqj6Dz8QzjAgkp49CnDmBX+8xLx3MAf5beHlbouve
 hSYPP3aNxuE0ClKOpzn3gluJKI52+ej+qP9//wV9G7FAfBXGd/f7opfMu
 F3NNJLD5hik+T3KuNBsG+Pyi+tLzQ2jP7nQzH+uM7CqEcCLXWcJQduRel Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="268618147"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="268618147"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="660399844"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by FMSMGA003.fm.intel.com with ESMTP; 16 May 2022 20:05:54 -0700
Date: Mon, 16 May 2022 20:09:35 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 29/29] x86/tsc: Switch to perf-based hardlockup
 detector if TSC become unstable
Message-ID: <20220517030935.GA2678@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-30-ricardo.neri-calderon@linux.intel.com>
 <1652184158.yhzceh3nwk.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652184158.yhzceh3nwk.astroid@bobo.none>
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

On Tue, May 10, 2022 at 10:14:00PM +1000, Nicholas Piggin wrote:
> Excerpts from Ricardo Neri's message of May 6, 2022 10:00 am:
> > The HPET-based hardlockup detector relies on the TSC to determine if an
> > observed NMI interrupt was originated by HPET timer. Hence, this detector
> > can no longer be used with an unstable TSC.
> > 
> > In such case, permanently stop the HPET-based hardlockup detector and
> > start the perf-based detector.
> > 
> > Cc: Andi Kleen <ak@linux.intel.com>
> > Cc: Stephane Eranian <eranian@google.com>
> > Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
> > Cc: iommu@lists.linux-foundation.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: x86@kernel.org
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Reviewed-by: Tony Luck <tony.luck@intel.com>
> > Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > ---
> > Changes since v5:
> >  * Relocated the delcaration of hardlockup_detector_switch_to_perf() to
> >    x86/nmi.h It does not depend on HPET.
> >  * Removed function stub. The shim hardlockup detector is always for x86.
> > 
> > Changes since v4:
> >  * Added a stub version of hardlockup_detector_switch_to_perf() for
> >    !CONFIG_HPET_TIMER. (lkp)
> >  * Reconfigure the whole lockup detector instead of unconditionally
> >    starting the perf-based hardlockup detector.
> > 
> > Changes since v3:
> >  * None
> > 
> > Changes since v2:
> >  * Introduced this patch.
> > 
> > Changes since v1:
> >  * N/A
> > ---
> >  arch/x86/include/asm/nmi.h     | 6 ++++++
> >  arch/x86/kernel/tsc.c          | 2 ++
> >  arch/x86/kernel/watchdog_hld.c | 6 ++++++
> >  3 files changed, 14 insertions(+)
> > 
> > diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
> > index 4a0d5b562c91..47752ff67d8b 100644
> > --- a/arch/x86/include/asm/nmi.h
> > +++ b/arch/x86/include/asm/nmi.h
> > @@ -63,4 +63,10 @@ void stop_nmi(void);
> >  void restart_nmi(void);
> >  void local_touch_nmi(void);
> >  
> > +#ifdef CONFIG_X86_HARDLOCKUP_DETECTOR
> > +void hardlockup_detector_switch_to_perf(void);
> > +#else
> > +static inline void hardlockup_detector_switch_to_perf(void) { }
> > +#endif
> > +
> >  #endif /* _ASM_X86_NMI_H */
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index cc1843044d88..74772ffc79d1 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> > @@ -1176,6 +1176,8 @@ void mark_tsc_unstable(char *reason)
> >  
> >  	clocksource_mark_unstable(&clocksource_tsc_early);
> >  	clocksource_mark_unstable(&clocksource_tsc);
> > +
> > +	hardlockup_detector_switch_to_perf();
> >  }
> >  
> >  EXPORT_SYMBOL_GPL(mark_tsc_unstable);
> > diff --git a/arch/x86/kernel/watchdog_hld.c b/arch/x86/kernel/watchdog_hld.c
> > index ef11f0af4ef5..7940977c6312 100644
> > --- a/arch/x86/kernel/watchdog_hld.c
> > +++ b/arch/x86/kernel/watchdog_hld.c
> > @@ -83,3 +83,9 @@ void watchdog_nmi_start(void)
> >  	if (detector_type == X86_HARDLOCKUP_DETECTOR_HPET)
> >  		hardlockup_detector_hpet_start();
> >  }
> > +
> > +void hardlockup_detector_switch_to_perf(void)
> > +{
> > +	detector_type = X86_HARDLOCKUP_DETECTOR_PERF;
> 
> Another possible problem along the same lines here,
> isn't your watchdog still running at this point? And
> it uses detector_type in the switch.
> 
> > +	lockup_detector_reconfigure();
> 
> Actually the detector_type switch is used in some
> functions called by lockup_detector_reconfigure()
> e.g., watchdog_nmi_stop, so this seems buggy even
> without concurrent watchdog.

Yes, this true. I missed this race.

> 
> Is this switching a good idea in general? The admin
> has asked for non-standard option because they want
> more PMU counterss available and now it eats a
> counter potentially causing a problem rather than
> detecting one.

Agreed. A very valid point.
> 
> I would rather just disable with a warning if it were
> up to me. If you *really* wanted to be fancy then
> allow admin to re-enable via proc maybe.

I think that in either case, /proc/sys/kernel/nmi_watchdog
need to be updated to reflect that the NMI watchdog has
been disabled. That would require to expose other interfaces
of the watchdog.

Thanks and BR,
Ricardo
