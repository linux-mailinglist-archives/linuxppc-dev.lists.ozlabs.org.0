Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1F526CDB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 00:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0NHW0KdNz3cFK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 08:15:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KwxDDGDh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KwxDDGDh; dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0NGq2tWWz309l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 08:14:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652480067; x=1684016067;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cxef9S28Y+ZsR9yxpw47GL3tVgcHUSJqzLfqt+5PNSo=;
 b=KwxDDGDho01tCETTbUZOSdKONnNOcXoWoF+wx93bmGD9kOSpAdRwaCYy
 f3APdxvIO8VHhtw1QaUJs1wVz+Ppe9eLAR2G6Xkj6tfEvVckxyctv1jkP
 fdLQu4FHO6oXEhICd1ywKU0bqpOEFnHziObsYQrHEx+Bf9Wd2Zu32aNvJ
 UDP/ulhrSNg56Xee4BlrmEeX8tvUaXyYlBrtrGZq1SkE5WePd58f6qyFL
 wKacdJ8N7w1PMGc7oZPgtU6jnSkUZINq8gZsPmBGcAOEqPNxWybd9SSCY
 jtZ0H4BJlCUNZKl0IBd59JsxMHFCsv+W8JUGqRlQGXt5yT2mdeeLqoCXY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="331028444"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="331028444"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 15:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="543454884"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga006.jf.intel.com with ESMTP; 13 May 2022 15:13:15 -0700
Date: Fri, 13 May 2022 15:16:50 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 22/29] x86/watchdog/hardlockup: Add an HPET-based
 hardlockup detector
Message-ID: <20220513221650.GA8691@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-23-ricardo.neri-calderon@linux.intel.com>
 <877d6uref8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d6uref8.ffs@tglx>
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

On Mon, May 09, 2022 at 04:03:39PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 17:00, Ricardo Neri wrote:
> > +	if (is_hpet_hld_interrupt(hdata)) {
> > +		/*
> > +		 * Kick the timer first. If the HPET channel is periodic, it
> > +		 * helps to reduce the delta between the expected TSC value and
> > +		 * its actual value the next time the HPET channel fires.
> > +		 */
> > +		kick_timer(hdata, !(hdata->has_periodic));
> > +
> > +		if (cpumask_weight(hld_data->monitored_cpumask) > 1) {
> > +			/*
> > +			 * Since we cannot know the source of an NMI, the best
> > +			 * we can do is to use a flag to indicate to all online
> > +			 * CPUs that they will get an NMI and that the source of
> > +			 * that NMI is the hardlockup detector. Offline CPUs
> > +			 * also receive the NMI but they ignore it.
> > +			 *
> > +			 * Even though we are in NMI context, we have concluded
> > +			 * that the NMI came from the HPET channel assigned to
> > +			 * the detector, an event that is infrequent and only
> > +			 * occurs in the handling CPU. There should not be races
> > +			 * with other NMIs.
> > +			 */
> > +			cpumask_copy(hld_data->inspect_cpumask,
> > +				     cpu_online_mask);
> > +
> > +			/* If we are here, IPI shorthands are enabled. */
> > +			apic->send_IPI_allbutself(NMI_VECTOR);
> 
> So if the monitored cpumask is a subset of online CPUs, which is the
> case when isolation features are enabled, then you still send NMIs to
> those isolated CPUs. I'm sure the isolation folks will be enthused.

Yes, I acknowledged this limitation in the cover letter. I should also update
Documentation/admin-guide/lockup-watchdogs.rst.

This patchset proposes the HPET NMI watchdog as an opt-in feature.

Perhaps the limitation might be mitigated by adding a check for non-housekeeping
and non-monitored CPUs in exc_nmi(). However, that will not eliminate the
problem of isolated CPUs also getting the NMI.

Thanks and BR,
Ricardo
