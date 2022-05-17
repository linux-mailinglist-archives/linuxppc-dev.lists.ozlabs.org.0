Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE752AE50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 00:51:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2rw528d5z3c8c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 08:51:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dj9z/2un;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Dj9z/2un; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2rvS3cPNz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 08:51:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652827876; x=1684363876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zzsg2WuJh6uzhJovq8XCrnmcAqakpF47E+0Mjk8izlQ=;
 b=Dj9z/2unrtknLEsDif77AirlCENhyt+/8E2i0/fX+DUw+pRuzS4SIZCh
 ySvfm56KKnKouQWk4WFUNuduETstOYTsefG5ihOUdHwwk98YRJjRND5OU
 +XiO+MUeUeYUph0kI6PPvKyBQoczjYwyTAXJ1fQ/Px+zrnRCTq81NZ/wq
 B3rfBpZ+aEigcfDM8J65/bTPYwOBjcmYyMvjnEf4T9iSFWmxbq9cskNbD
 XmvjTFTnpBKQkxyHa5JtfPrQFvTMADQ8ZzDqsSiA3R0/10FfOgW2eK/gC
 awlIBg2rgeDynJSuQIwTsvKq1L90qVCAruvj3kuyz34jJSyQ4ReSZ392e g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="253412507"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="253412507"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 15:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="660835593"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by FMSMGA003.fm.intel.com with ESMTP; 17 May 2022 15:51:00 -0700
Date: Tue, 17 May 2022 15:54:43 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 15/29] x86/hpet: Add helper function
 hpet_set_comparator_periodic()
Message-ID: <20220517225443.GA8069@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
 <87mtfufifa.ffs@tglx>
 <20220513211944.GE22683@ranerica-svr.sc.intel.com>
 <87pmkgsf31.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmkgsf31.ffs@tglx>
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

On Sat, May 14, 2022 at 10:17:38AM +0200, Thomas Gleixner wrote:
> On Fri, May 13 2022 at 14:19, Ricardo Neri wrote:
> > On Fri, May 06, 2022 at 11:41:13PM +0200, Thomas Gleixner wrote:
> >> The argument about not bloating the code
> >> with an "obvious???" function which is quite small is slightly beyond my
> >> comprehension level.
> >
> > That obvious function would look like this:
> >
> > void hpet_set_comparator_one_shot(int channel, u32 delta)
> > {
> > 	u32 count;
> >
> > 	count = hpet_readl(HPET_COUNTER);
> > 	count += delta;
> > 	hpet_writel(count, HPET_Tn_CMP(channel));
> > }
> 
> This function only works reliably when the delta is large. See
> hpet_clkevt_set_next_event().

That is a good point. One more reason to not have a
hpet_set_comparator_one_shot(), IMO.

Thanks and BR,
Ricardo
