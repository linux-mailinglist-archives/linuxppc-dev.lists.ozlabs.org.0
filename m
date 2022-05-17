Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D052AE4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 00:50:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2rt94sx2z3cDc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 08:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFca+FqL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AFca+FqL; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2rsV6htcz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 08:49:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652827775; x=1684363775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eW9eeCQ/ZnkVlQzYhrGw1tL7ydi/5swHvLwwK3+msYw=;
 b=AFca+FqLvOAViywutQ6mSX7JaJUSE/Q76Fg/pSP/d+YVAW+Fl88TFAVK
 d1wEKhCh4pgPm8UCfAv9OSX853LmfCaBKh9bEABsorHocMJw8tD+rUuND
 Xho84ERcvsH7qZgb8H+/+F8P0Fp2lXNMyfQtasBDstZ7XsiLPbNzu3VAp
 n8bCVLoQCXNSJzsaowDlTEbKnCycR15LNeaa7q/GBtqXkh8Np54sAwLCO
 V1VPqapGTvj6U5bWEFOZ250/7Cgr8+KbUOI0zo+Qvpo7U8Edej8bYSF1t
 Q6tiTYmceChqkA4YtpfjSf/RKCBLT1KBRt+Np/OK3SYznHwgP79T8cyBU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271056048"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="271056048"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 15:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="626709312"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga008.fm.intel.com with ESMTP; 17 May 2022 15:49:25 -0700
Date: Tue, 17 May 2022 15:53:08 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 28/29] x86/tsc: Restart NMI watchdog after refining
 tsc_khz
Message-ID: <20220517225308.GC6711@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-29-ricardo.neri-calderon@linux.intel.com>
 <1652180070.1r874kr0tg.astroid@bobo.none> <87ilqdpq7u.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilqdpq7u.ffs@tglx>
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
 Nicholas Piggin <npiggin@gmail.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Stephane Eranian <eranian@google.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 01:44:05PM +0200, Thomas Gleixner wrote:
> On Tue, May 10 2022 at 21:16, Nicholas Piggin wrote:
> > Excerpts from Ricardo Neri's message of May 6, 2022 10:00 am:
> >> +	/*
> >> +	 * If in use, the HPET hardlockup detector relies on tsc_khz.
> >> +	 * Reconfigure it to make use of the refined tsc_khz.
> >> +	 */
> >> +	lockup_detector_reconfigure();
> >
> > I don't know if the API is conceptually good.
> >
> > You change something that the lockup detector is currently using, 
> > *while* the detector is running asynchronously, and then reconfigure
> > it. What happens in the window? If this code is only used for small
> > adjustments maybe it does not really matter but in principle it's
> > a bad API to export.
> >
> > lockup_detector_reconfigure as an internal API is okay because it
> > reconfigures things while the watchdog is stopped [actually that
> > looks untrue for soft dog which uses watchdog_thresh in
> > is_softlockup(), but that should be fixed].
> >
> > You're the arch so you're allowed to stop the watchdog and configure
> > it, e.g., hardlockup_detector_perf_stop() is called in arch/.
> >
> > So you want to disable HPET watchdog if it was enabled, then update
> > wherever you're using tsc_khz, then re-enable.
> 
> The real question is whether making this refined tsc_khz value
> immediately effective matters at all. IMO, it does not because up to
> that point the watchdog was happily using the coarse calibrated value
> and the whole use TSC to assess whether the HPET fired mechanism is just
> a guestimate anyway. So what's the point of trying to guess 'more
> correct'.

In some of my test systems I observed that, the TSC value does not fall
within the expected error window the first time the HPET channel expires.

I inferred that the error computed using the coarser tsc_khz was wrong.
Recalculating the error window with refined tsc_khz would correct it.

However, restarting the timer has the side-effect of kicking the timer and,
therefore pushing the first HPET NMI further in the future.

Perhaps kicking HPET channel, not recomputing the error window, corrected
(masked?) the problem.

I will investigate further and rework or drop this patch as needed.

Thanks and BR,
Ricardo
