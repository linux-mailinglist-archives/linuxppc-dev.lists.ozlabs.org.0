Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF691F9C56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:53:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lwpb5c20zDqR5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 01:53:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=fenghua.yu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lwjs43W2zDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 01:48:58 +1000 (AEST)
IronPort-SDR: e/jKsx5uTB4LklsMZBqRe9uci84r7dFh8MVH3enhZewkmjYYV5wvNDHK8howQoAy+o8aRqPg54
 GmmBT2AOUbYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 08:48:54 -0700
IronPort-SDR: gkkYVgcY8xV06BkKjnJOGSlBzFZYve2j2awE0FGSSUIvIj3XiwAj5QsvMoP3GPr1BbNqj0sBuD
 XicWuOj61BNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; d="scan'208";a="382581571"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2020 08:48:54 -0700
Date: Mon, 15 Jun 2020 08:48:54 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615154854.GB13792@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615075649.GK2497@hirez.programming.kicks-ass.net>
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
On Mon, Jun 15, 2020 at 09:56:49AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 12, 2020 at 05:41:33PM -0700, Fenghua Yu wrote:
> > +/*
> > + * Apply some heuristics to see if the #GP fault was caused by a thread
> > + * that hasn't had the IA32_PASID MSR initialized.  If it looks like that
> > + * is the problem, try initializing the IA32_PASID MSR. If the heuristic
> > + * guesses incorrectly, take one more #GP fault.
> 
> How is that going to help? Aren't we then going to run this same
> heuristic again and again and again?

The heuristic always initializes the MSR with the per mm PASID IIF the
mm has a valid PASID but the MSR doesn't have one. This heuristic usually
happens only once on the first #GP in a thread.

If the next #GP still comes in, the heuristic finds out the MSR already
has a valid PASID and thus will not fixup the MSR any more. The fixup()
returns "false" and lets others to handle the #GP.

So the heuristic will be executed once (at most) and won't be executed
again and again.

> 
> > + */
> > +bool __fixup_pasid_exception(void)
> > +{
> > +	u64 pasid_msr;
> > +	unsigned int pasid;
> > +
> > +	/*
> > +	 * This function is called only when this #GP was triggered from user
> > +	 * space. So the mm cannot be NULL.
> > +	 */
> > +	pasid = current->mm->pasid;
> > +	/* If the mm doesn't have a valid PASID, then can't help. */
> > +	if (invalid_pasid(pasid))
> > +		return false;
> > +
> > +	/*
> > +	 * Since IRQ is disabled now, the current task still owns the FPU on
> 
> That's just weird and confusing. What you want to say is that you rely
> on the exception disabling the interrupt.

I checked SDM again. You are right. #GP can be interrupted by machine check
or other interrupts. So I cannot assume the current task still owns the FPU.
Instead of directly rdmsr() and wrmsr(), I will add helpers that can access
either the MSR on the processor or the PASID state in the memory.

> 
> > +	 * this CPU and the PASID MSR can be directly accessed.
> > +	 *
> > +	 * If the MSR has a valid PASID, the #GP must be for some other reason.
> > +	 *
> > +	 * If rdmsr() is really a performance issue, a TIF_ flag may be
> > +	 * added to check if the thread has a valid PASID instead of rdmsr().
> 
> I don't understand any of this. Nobody except us writes to this MSR, we
> should bloody well know what's in it. What gives?

Patch 4 describes how to manage the MSR and patch 7 describes the format
of the MSR (20-bit PASID value and bit 31 is valid bit).

Are they sufficient to help? Or do you mean something else?

> > +	 */
> > +	rdmsrl(MSR_IA32_PASID, pasid_msr);
> > +	if (pasid_msr & MSR_IA32_PASID_VALID)
> > +		return false;
> > +
> > +	/* Fix up the MSR if the MSR doesn't have a valid PASID. */
> > +	wrmsrl(MSR_IA32_PASID, pasid | MSR_IA32_PASID_VALID);
> > +
> > +	return true;
> > +}
> > -- 
> > 2.19.1
> > 

Thanks.

-Fenghua
