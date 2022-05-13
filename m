Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0E5269CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 21:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0J011Sbvz3cK5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 05:01:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=npoWGyvu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=npoWGyvu; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0HzN14sRz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 05:00:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652468448; x=1684004448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8jZEDO0wap/S70A6rQv+pSQuvwOwjW4+QKi9OH+Emho=;
 b=npoWGyvud5wAOdze56YO+dYt1geEFYqYw8OktNOM74HIpRaWkj7POy0Q
 6JtJfTHKNDS2Fr4wsjRB1jtr9N+s/rRqkneTCvlvm5DdpsZ3fsA8bm2Nm
 uhoEICkedGS+OVEDyz9PTZ5OYuNrgEMDjxGhw3RavbgmysNTnSpgfR1m5
 9jvWo+RXQCrTbrT4i2iD4jlkEnHfjxBBXW8/zJudFaRuFtnQPeXmXOO+o
 m3MpMAiz+9/soRFqRImp2mqZr/MI3Epprzf9D2c+G94yiWnwL9nWTyH9q
 UcooSYiVCBFPtbsqqAIlhCUBBr3DMiTtXzAZiYTNlRtRyJ8hJ45mWnWx2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="295647690"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="295647690"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 11:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="698603603"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2022 11:59:44 -0700
Date: Fri, 13 May 2022 12:03:19 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 13/29] iommu/amd: Compose MSI messages for NMI irqs in
 non-IR format
Message-ID: <20220513190319.GD22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-14-ricardo.neri-calderon@linux.intel.com>
 <87r156fiur.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r156fiur.ffs@tglx>
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

On Fri, May 06, 2022 at 11:31:56PM +0200, Thomas Gleixner wrote:
> On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> > +	 *
> > +	 * Also, NMIs do not have an associated vector. No need for cleanup.
> 
> They have a vector and what the heck is this cleanup comment for here?
> There is nothing cleanup alike anywhere near.
> 
> Adding confusing comments is worse than adding no comments at all.

I will remove the comment regarding cleanup. I will clarify that NMI has a
fixed vector.

Thanks and BR,
Ricardo
