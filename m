Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B47526C4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 23:27:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0MDC0W8mz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 07:27:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8g3xkv2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L8g3xkv2; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0MCZ0nCXz3bxk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 07:26:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652477194; x=1684013194;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l6Vls9wnN+x00vvDZEEHtOYdZPzsd8ahPI1ukzsIW6A=;
 b=L8g3xkv2dDggp4eJtqsrQTlG3JHxSmYos5Wlqxw0ppNJb6khRJ3l7lY1
 XakJMX8adLu99AxtKjjSXRpT35NNlrlqOEFe3z11cD7IPMrznCAL84dI4
 7am7gvy1JggUl1z7i5FOD8etpwDXnmFwyve7043Z3msVSRX892dSsISVr
 LmOTIvA1UfOtmjBXWDiI+wN+WkZO27tJPo5aqNCNgOM55Bx/o3YcUDkcu
 cBNocwboEykt3UX2Ewy9CcSXyQii739tf1GdGpp+fFRmlqTIcmm7lEz6c
 MjE7jAsqHp9hNGM/7jBPD9QhQ4NqyiNIeHFxMvO0HY9BE1UdWJzYuLXF3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="268005198"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="268005198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 14:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="712562541"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga001.fm.intel.com with ESMTP; 13 May 2022 14:25:28 -0700
Date: Fri, 13 May 2022 14:29:03 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 15/29] x86/hpet: Add helper function
 hpet_set_comparator_periodic()
Message-ID: <20220513212903.GF22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
 <87mtfufifa.ffs@tglx> <87ilqifhxj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilqifhxj.ffs@tglx>
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

On Fri, May 06, 2022 at 11:51:52PM +0200, Thomas Gleixner wrote:
> On Fri, May 06 2022 at 23:41, Thomas Gleixner wrote:
> > On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> >> Programming an HPET channel as periodic requires setting the
> >> HPET_TN_SETVAL bit in the channel configuration. Plus, the comparator
> >> register must be written twice (once for the comparator value and once for
> >> the periodic value). Since this programming might be needed in several
> >> places (e.g., the HPET clocksource and the HPET-based hardlockup detector),
> >> add a helper function for this purpose.
> >>
> >> A helper function hpet_set_comparator_oneshot() could also be implemented.
> >> However, such function would only program the comparator register and the
> >> function would be quite small. Hence, it is better to not bloat the code
> >> with such an obvious function.
> >
> > This word salad above does not provide a single reason why the periodic
> > programming function is required and better suited for the NMI watchdog
> > case and then goes on and blurbs about why a function which is not
> > required is not implemented. The argument about not bloating the code
> > with an "obvious???" function which is quite small is slightly beyond my
> > comprehension level.
> 
> What's even more uncomprehensible is that the patch which actually sets
> up that NMI watchdog cruft has:
> 
> > +       if (hc->boot_cfg & HPET_TN_PERIODIC_CAP)
> > +               hld_data->has_periodic = true;
> 
> So how the heck does that work with a HPET which does not support
> periodic mode?

If the HPET channel does not support periodic mode (as indicated by the flag
above), it will read the HPET counter into a local variable, increment that
local variable, and write comparator of the HPET channel.

If the HPET channel does support periodic mode, it will not kick it again.
It will only kick a periodic HPET channel if needed (e.g., if the NMI watchdog
was idle of watchdog_thresh changed its value).

> 
> That watchdog muck will still happily invoke that set periodic function
> in the hope that it works by chance?

It will not. It will check hld_data->has_periodic and act accordingly.

FWIW, I have tested this NMI watchdog with periodic and non-periodic HPET
channels.

Thanks and BR,
Ricardo
