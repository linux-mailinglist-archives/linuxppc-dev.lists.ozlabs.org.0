Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB452AB06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 20:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2lKK67Vsz3c1K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 04:39:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FD7Dott6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FD7Dott6; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2lJh0Ky6z3bwH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 04:39:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652812756; x=1684348756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FTTY9ZFMfeTd8CI19p2u5YEYLQvqFSdIkPKeSEcRj4U=;
 b=FD7Dott6oS0M5edJnP8wfp0Qj5cE+gInDmyySgw5MZxdOklABZmvaYeW
 cD+iF9U3uGjYCo317YX8QViEoyZS8MIXDlogepr+kkmbi/Ewb5mp2bPOe
 eRl6AtrTBnopHrSjsV0UP7fYMAkjZ8RrEY57NY/qspuIZa5n5sEo+HzwM
 LeXkeQ7Dv/kTMA6stOs7+XiBJjzhGFNU6lKhJSiReqw5/9KyXJHosY3Ge
 qZwBOUIHdxqL75MEA6GZOHb2LjMCiVNzjjfAhStWkaa5r5wRRAcMXpzOd
 4I94TAmvCEmEfVHHe+iB1lH34pP8zXJaUoC4WmzNgVod0ZE5k8muE/1H9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="357693324"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="357693324"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 11:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="555910452"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga002.jf.intel.com with ESMTP; 17 May 2022 11:38:12 -0700
Date: Tue, 17 May 2022 11:41:54 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 21/29] x86/nmi: Add an NMI_WATCHDOG NMI handler category
Message-ID: <20220517184154.GA6711@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-22-ricardo.neri-calderon@linux.intel.com>
 <87a6bqrelv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6bqrelv.ffs@tglx>
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

On Mon, May 09, 2022 at 03:59:40PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 17:00, Ricardo Neri wrote:
> > Add a NMI_WATCHDOG as a new category of NMI handler. This new category
> > is to be used with the HPET-based hardlockup detector. This detector
> > does not have a direct way of checking if the HPET timer is the source of
> > the NMI. Instead, it indirectly estimates it using the time-stamp counter.
> >
> > Therefore, we may have false-positives in case another NMI occurs within
> > the estimated time window. For this reason, we want the handler of the
> > detector to be called after all the NMI_LOCAL handlers. A simple way
> > of achieving this with a new NMI handler category.
> >
> > @@ -379,6 +385,10 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
> >  	}
> >  	raw_spin_unlock(&nmi_reason_lock);
> >  
> > +	handled = nmi_handle(NMI_WATCHDOG, regs);
> > +	if (handled == NMI_HANDLED)
> > +		goto out;
> > +
> 
> How is this supposed to work reliably?
> 
> If perf is active and the HPET NMI and the perf NMI come in around the
> same time, then nmi_handle(LOCAL) can swallow the NMI and the watchdog
> won't be checked. Because MSI is strictly edge and the message is only
> sent once, this can result in a stale watchdog, no?

This is true. Instead, at the end of each NMI I should _also_ check if the TSC
is within the expected value of the HPET NMI watchdog. In this way, unrelated
NMIs (e.g., perf NMI) are handled and we don't miss the NMI from the HPET
channel.

Thanks and BR,
Ricardo
