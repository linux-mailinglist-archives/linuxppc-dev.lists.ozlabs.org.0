Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF21FA14D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 22:19:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m2jr5q11zDqRG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 06:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=fenghua.yu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m2gw2YQQzDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 06:17:41 +1000 (AEST)
IronPort-SDR: i97NZhvog4AS8z/BTFfwvymndIEiRNZREQc2eYlvtcGyuv3S/zEk84ggOLe0aALrMrmrCblVpt
 Do6h9yRlgivQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 13:17:37 -0700
IronPort-SDR: bBvH2ZJYn5YJMJRfAqP3otKSEI1MNvgA+6c1UKYREDg7BecOd1t0qIyR3pPh+HR14Zjkx/e/PR
 UvvQUKw6T4WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,516,1583222400"; d="scan'208";a="351478020"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga001.jf.intel.com with ESMTP; 15 Jun 2020 13:17:35 -0700
Date: Mon, 15 Jun 2020 13:17:35 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615201735.GE13792@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
 <20200615183116.GD2531@hirez.programming.kicks-ass.net>
 <20200615185529.GD13792@romley-ivt3.sc.intel.com>
 <20200615190928.GJ2531@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615190928.GJ2531@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Sohil Mehta <sohil.mehta@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Peter,

On Mon, Jun 15, 2020 at 09:09:28PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 15, 2020 at 11:55:29AM -0700, Fenghua Yu wrote:
> 
> > Or do you suggest to add a random new flag in struct thread_info instead
> > of a TIF flag?
> 
> Why thread_info? What's wrong with something simple like the below. It
> takes a bit from the 'strictly current' flags word.
> 
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index b62e6aaf28f0..fca830b97055 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -801,6 +801,9 @@ struct task_struct {
>  	/* Stalled due to lack of memory */
>  	unsigned			in_memstall:1;
>  #endif
> +#ifdef CONFIG_PCI_PASID
> +	unsigned			has_valid_pasid:1;
> +#endif
>  
>  	unsigned long			atomic_flags; /* Flags requiring atomic access. */
>  
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 142b23645d82..10b3891be99e 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -955,6 +955,10 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
>  	tsk->use_memdelay = 0;
>  #endif
>  
> +#ifdef CONFIG_PCI_PASID
> +	tsk->has_valid_pasid = 0;
> +#endif
> +
>  #ifdef CONFIG_MEMCG
>  	tsk->active_memcg = NULL;
>  #endif

The PASID MSR is x86 specific although PASID is PCIe concept and per-mm.
Checking if the MSR has valid PASID (bit31=1) is an x86 specifc work.
The flag should be cleared in cloned()/forked() and is only set and
read in fixup() in x86 #GP for heuristic. It's not used anywhere outside
of x86.

That's why we think the flag should be in x86 struct thread_info instead
of in generice struct task_struct.

Please advice.

Thanks.

-Fenghua
