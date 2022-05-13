Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3C526C3C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 23:17:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0M1T07bdz3cLW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 07:17:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GGP3KkaM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GGP3KkaM; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0M0n455Mz3bWR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 07:17:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652476633; x=1684012633;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Gskyxl5a38unKZlQosOqjGR7Ihzv9T1bkSU8Qq82ZE=;
 b=GGP3KkaMBpCAkkrMxiKJyjm330qZEVuvOVUjBxjkzfMFwldLrz9do+ID
 rTTEjuccJy5Y34B5pie07inopkr23J0jVWK+mcLVgembIJaUIuSyB5+bx
 KkxJXbKs9XHp+bsW+IIku3GhYCgvV3TNMjLlsm29bA+lF5WjR0g26cYgu
 jV4fS4OTf8t++/uYflCpggWmMZZqHmbf+AQSAeozAk/SoC9CnaKDtkYKz
 Tr3nLQWN0W1Z27IFVC1FayfP6s0M618zac7KQB96c5JEE7pyQJiv1D9wb
 in927nMMOnezxFNSeCDDIMeNWG1AkhNVdABs5dExHMahFS9Arf6CZJj7+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="250322001"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="250322001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 14:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="595421000"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga008.jf.intel.com with ESMTP; 13 May 2022 14:16:09 -0700
Date: Fri, 13 May 2022 14:19:44 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 15/29] x86/hpet: Add helper function
 hpet_set_comparator_periodic()
Message-ID: <20220513211944.GE22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
 <87mtfufifa.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtfufifa.ffs@tglx>
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

On Fri, May 06, 2022 at 11:41:13PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> > Programming an HPET channel as periodic requires setting the
> > HPET_TN_SETVAL bit in the channel configuration. Plus, the comparator
> > register must be written twice (once for the comparator value and once for
> > the periodic value). Since this programming might be needed in several
> > places (e.g., the HPET clocksource and the HPET-based hardlockup detector),
> > add a helper function for this purpose.
> >
> > A helper function hpet_set_comparator_oneshot() could also be implemented.
> > However, such function would only program the comparator register and the
> > function would be quite small. Hence, it is better to not bloat the code
> > with such an obvious function.
> 
> This word salad above does not provide a single reason why the periodic
> programming function is required and better suited for the NMI watchdog
> case

The goal of hpet_set_comparator_periodic() is to avoid code duplication. The
functions hpet_clkevt_set_state_periodic() and kick_timer() in the HPET NMI
watchdog need to program a periodic HPET channel when supported.


> and then goes on and blurbs about why a function which is not
> required is not implemented.

I can remove this.

> The argument about not bloating the code
> with an "obvious???" function which is quite small is slightly beyond my
> comprehension level.

That obvious function would look like this:

void hpet_set_comparator_one_shot(int channel, u32 delta)
{
	u32 count;

	count = hpet_readl(HPET_COUNTER);
	count += delta;
	hpet_writel(count, HPET_Tn_CMP(channel));
}

It involves one register read, one addition and one register write. IMO, this
code is sufficiently simple and small to allow duplication.

Programming a periodic HPET channel is not as straightforward, IMO. It involves
handling two different values (period and comparator) written in a specific
sequence, one configuration bit, and one delay. It also involves three register
writes and one register read.

Thanks and BR,
Ricardo
