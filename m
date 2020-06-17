Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6A1FC8D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 10:34:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49myzD0zS0zDqss
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 18:34:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=pGHQQ40P; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mywM59RhzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 18:31:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PpSWQoZVa+rxLKWKXqLIv8btjA0lR/+HCKmuqJBW6Xk=; b=pGHQQ40PYz4XaECx9UDuuOmLNJ
 iEv5F88GbuYBu2poejXdWHicH5VKt9K55XNs+X7kjcA4Ziud4AiW8B9/kkzms7DKrt5D5SkXyRJ7i
 13H0V+UjQGP44jR/2/jse9tN0T+yis59NLW/oCaxSJFrXMdIJqdIIhospUM3uifcNnSsIQVLTpawd
 NJX0fYkyo4zsgw0iYsha0fyO68x5Jj7UP/avH40jVs0GpURHNTfSA54lBJ22FbSqFopcdlPTPTF2f
 W40tlM9Cpbvl3n+lwS16GWI8Hhe4VKYYFh02MjbguiAeDv5JScHO7p4fABJti7WYYcxP85TtJKYG+
 mCvr5jmg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlTTa-0006uB-MI; Wed, 17 Jun 2020 08:31:18 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C68F3306102;
 Wed, 17 Jun 2020 10:31:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AD21229E5A2E1; Wed, 17 Jun 2020 10:31:16 +0200 (CEST)
Date: Wed, 17 Jun 2020 10:31:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200617083116.GE2531@hirez.programming.kicks-ass.net>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
 <20200615183116.GD2531@hirez.programming.kicks-ass.net>
 <20200615185529.GD13792@romley-ivt3.sc.intel.com>
 <20200615190928.GJ2531@hirez.programming.kicks-ass.net>
 <20200616232345.GC15763@romley-ivt3.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616232345.GC15763@romley-ivt3.sc.intel.com>
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

On Tue, Jun 16, 2020 at 04:23:46PM -0700, Fenghua Yu wrote:
> Hi, Peter,
> 
> On Mon, Jun 15, 2020 at 09:09:28PM +0200, Peter Zijlstra wrote:
> > On Mon, Jun 15, 2020 at 11:55:29AM -0700, Fenghua Yu wrote:
> > 
> > > Or do you suggest to add a random new flag in struct thread_info instead
> > > of a TIF flag?
> > 
> > Why thread_info? What's wrong with something simple like the below. It
> > takes a bit from the 'strictly current' flags word.
> > 
> > 
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index b62e6aaf28f0..fca830b97055 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -801,6 +801,9 @@ struct task_struct {
> >  	/* Stalled due to lack of memory */
> >  	unsigned			in_memstall:1;
> >  #endif
> > +#ifdef CONFIG_PCI_PASID
> > +	unsigned			has_valid_pasid:1;
> > +#endif
> >  
> >  	unsigned long			atomic_flags; /* Flags requiring atomic access. */
> >  
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 142b23645d82..10b3891be99e 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -955,6 +955,10 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
> >  	tsk->use_memdelay = 0;
> >  #endif
> >  
> > +#ifdef CONFIG_PCI_PASID
> > +	tsk->has_valid_pasid = 0;
> > +#endif
> > +
> >  #ifdef CONFIG_MEMCG
> >  	tsk->active_memcg = NULL;
> >  #endif
> 
> Can I add "Signed-off-by: Peter Zijlstra <peterz@infradead.org>"
> to this patch? I will send this patch in the next version of the series.

Sure, n/p.
