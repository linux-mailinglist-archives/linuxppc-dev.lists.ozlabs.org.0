Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD511FA31D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:56:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m4ss46wwzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 07:56:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=LSD5JPxk; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m4qH2zLKzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 07:54:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UqgtxJyXNkDi+0YvkljyuVgWArZfOIPs0r0FfUbx9gk=; b=LSD5JPxkLs9AcgxjDG0aMNn4Jw
 ezfvCVV68rnipIJFxD+zL54W/CRA6wrZNbxCvhOd6Mz7U+W2zW4wsDHPxzgoKaFhBJD/n3Zjy7JMH
 6um/p8pHUjP0zSfu0a9ckO4OA4+X/O4P3ODIkp052EI+ae0Ov9jbkACGWf3ReTnI7WWUn/tC+xmZu
 8eVWcz2CKDjEdXIdRpMjJ2J6ThhGnBBtRaM5AQ9Suas4+u33Wd8ORKSREHPhi7o4HYYJe3r11ww+v
 4P0e1eL/oZSJ5XVvmaCITCLoQ0QQtgLOV5+U/+4qVP+6DsaxaqIHRyoONo5PFTrbUO1kt2FFz1wcK
 NP6xRd8w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkx3F-0001qx-4m; Mon, 15 Jun 2020 21:53:57 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7C474301A32;
 Mon, 15 Jun 2020 23:53:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6897E2BDC14F9; Mon, 15 Jun 2020 23:53:53 +0200 (CEST)
Date: Mon, 15 Jun 2020 23:53:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Message-ID: <20200615215353.GH2514@hirez.programming.kicks-ass.net>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-13-git-send-email-fenghua.yu@intel.com>
 <20200615075649.GK2497@hirez.programming.kicks-ass.net>
 <20200615154854.GB13792@romley-ivt3.sc.intel.com>
 <20200615160357.GA2531@hirez.programming.kicks-ass.net>
 <20200615181259.GC13792@romley-ivt3.sc.intel.com>
 <20200615183116.GD2531@hirez.programming.kicks-ass.net>
 <20200615185529.GD13792@romley-ivt3.sc.intel.com>
 <20200615190928.GJ2531@hirez.programming.kicks-ass.net>
 <20200615201735.GE13792@romley-ivt3.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615201735.GE13792@romley-ivt3.sc.intel.com>
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

On Mon, Jun 15, 2020 at 01:17:35PM -0700, Fenghua Yu wrote:
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
> The PASID MSR is x86 specific although PASID is PCIe concept and per-mm.
> Checking if the MSR has valid PASID (bit31=1) is an x86 specifc work.
> The flag should be cleared in cloned()/forked() and is only set and
> read in fixup() in x86 #GP for heuristic. It's not used anywhere outside
> of x86.
> 
> That's why we think the flag should be in x86 struct thread_info instead
> of in generice struct task_struct.

I don't think anybody really cares, it's just one bit, we have plenty
left.

On x86_64 there's a u32 sized alignment hole in thread_info, also we
don't use the upper 32bit of thread_info::flags, however using those
would still mean you have to use atomic ops, which you really don't
need.


