Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC17526D66
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 01:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0PcT234vz3cD8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 09:14:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NJp9NRfv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NJp9NRfv; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0Pbp2KNcz3bqN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 09:14:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652483654; x=1684019654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RwN3h2frQEmuTLpALiwJVKiux9iit8+Y3qd7tVOSlJg=;
 b=NJp9NRfvuUnbDZ3c3ehMULakMDj75xaq9orzvQC4+6sBXOCpt20q+5ZR
 V0m6UuXjEiLEyqG5/n81svKGxrzsE2oWRK86+h1h5XDuGo9IXMRGaRBkj
 +009XdN6MRMcr4wrtuDYSOcJhhWQFJf7Tj3JgKhDBkLO1W37NIyaO74iG
 sKxLnKhonbjlQAOqSm2TL8Dd+KU++yun0R8TF2R7NIYVLZzjxV9kQRUCX
 /S6vp30YrGlqpBa703EQf0oF1ludxQnDERa/59izThuizF2MU7ipBHgOe
 NqiDQgTzVhq7yqEj/C6ADMkzOG/F9RkMkfPdRVNlGdYqXmWG4BykZZV6Y Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="252479211"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="252479211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 16:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="573202350"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2022 16:13:04 -0700
Date: Fri, 13 May 2022 16:16:40 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 20/29] init/main: Delay initialization of the lockup
 detector after smp_init()
Message-ID: <20220513231640.GA9074@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-21-ricardo.neri-calderon@linux.intel.com>
 <1652178524.7j2o02lrl8.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652178524.7j2o02lrl8.astroid@bobo.none>
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

On Tue, May 10, 2022 at 08:38:22PM +1000, Nicholas Piggin wrote:
> Excerpts from Ricardo Neri's message of May 6, 2022 9:59 am:
> > Certain implementations of the hardlockup detector require support for
> > Inter-Processor Interrupt shorthands. On x86, support for these can only
> > be determined after all the possible CPUs have booted once (in
> > smp_init()). Other architectures may not need such check.
> > 
> > lockup_detector_init() only performs the initializations of data
> > structures of the lockup detector. Hence, there are no dependencies on
> > smp_init().
> 

Thank you for your feedback Nicholas!

> I think this is the only real thing which affects other watchdog types?

Also patches 18 and 19 that decouple the NMI watchdog functionality from
perf.

> 
> Not sure if it's a big problem, the secondary CPUs coming up won't
> have their watchdog active until quite late, and the primary could
> implement its own timeout in __cpu_up for secondary coming up, and
> IPI it to get traces if necessary which is probably more robust.

Indeed that could work. Another alternative I have been pondering is to boot
the system with the perf-based NMI watchdog enabled. Once all CPUs are up
and running, switch to the HPET-based NMI watchdog and free the PMU counters.

> 
> Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thank you!

BR,
Ricardo
