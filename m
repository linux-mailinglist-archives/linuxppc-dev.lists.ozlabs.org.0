Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 633F87CF1A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 09:49:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oB0C2SqM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB0HD28VTz3vYK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 18:49:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oB0C2SqM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB0GH2S9fz2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 18:48:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=52ez8nSrgRe3BDw+KtrmWbkQdWoUUpNLS1BD5WCW5VY=; b=oB0C2SqM/ERV6YhikduJIrED1I
	3dNNNUf4ZYh3apNYcLw+ANjwon7ECj9BiRr4A/7ZzDrbLU+tdr988zt6h9yhnHDOZvMGKVe5ZRQ3c
	66SZtxwBk6Uxn8pVMV1+kJSU2Yjx7qPJKgnwJ9tyU4dalyVu6GM7B1ZAkeYQgxb2y620GsfAGUfbX
	hIe+UEBZVoSFF+deFTreep2ab+u83EzmGe8U+XIFz/smO8qw6WxVSxMdy6O8sa7ODViclVDENG4q+
	MRP2grYUxp+z7EJKAMm8kEq4b64lF9v6LVbmS4msinqn6lRqPJXz8QOzT2SfaC73tD567ByDEOmf7
	FnvrFs3g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNlc-009guo-2J;
	Thu, 19 Oct 2023 07:48:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 62F60300392; Thu, 19 Oct 2023 09:48:28 +0200 (CEST)
Date: Thu, 19 Oct 2023 09:48:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/6] powerpc/smp: Enable Asym packing for cores on
 shared processor
Message-ID: <20231019074828.GM33217@noisy.programming.kicks-ass.net>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
 <87v8b35ir3.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8b35ir3.fsf@mail.lhotse>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 19, 2023 at 03:38:40PM +1100, Michael Ellerman wrote:
> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > If there are shared processor LPARs, underlying Hypervisor can have more
> > virtual cores to handle than actual physical cores.
> >
> > Starting with Power 9, a core has 2 nearly independent thread groups.
> 
> You need to be clearer here that you're talking about "big cores", not
> SMT4 cores as seen on bare metal systems.

What is a 'big core' ? I'm thinking big.LITTLE, but I didn't think Power
went that route (yet?).. help?

> > On a shared processors LPARs, it helps to pack threads to lesser number
> > of cores so that the overall system performance and utilization
> > improves. PowerVM schedules at a core level. Hence packing to fewer
> > cores helps.
> >
> > For example: Lets says there are two 8-core Shared LPARs that are
> > actually sharing a 8 Core shared physical pool, each running 8 threads
> > each. Then Consolidating 8 threads to 4 cores on each LPAR would help
> > them to perform better. This is because each of the LPAR will get
> > 100% time to run applications and there will no switching required by
> > the Hypervisor.
> >
> > To achieve this, enable SD_ASYM_PACKING flag at CACHE, MC and DIE level.
> 
> .. when the system is running in shared processor mode and has big cores.
> 
> cheers
> 
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 37c41297c9ce..498c2d51fc20 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -1009,9 +1009,20 @@ static int powerpc_smt_flags(void)
> >   */
> >  static int powerpc_shared_cache_flags(void)
> >  {
> > +	if (static_branch_unlikely(&powerpc_asym_packing))
> > +		return SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
> > +
> >  	return SD_SHARE_PKG_RESOURCES;
> >  }
> >  
> > +static int powerpc_shared_proc_flags(void)
> > +{
> > +	if (static_branch_unlikely(&powerpc_asym_packing))
> > +		return SD_ASYM_PACKING;
> > +
> > +	return 0;
> > +}

Can you leave the future reader a clue in the form of a comment around
here perhaps? Explaining *why* things are as they are etc..

> > +
> >  /*
> >   * We can't just pass cpu_l2_cache_mask() directly because
> >   * returns a non-const pointer and the compiler barfs on that.
> > @@ -1048,8 +1059,8 @@ static struct sched_domain_topology_level powerpc_topology[] = {
> >  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> >  #endif
> >  	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> > -	{ cpu_mc_mask, SD_INIT_NAME(MC) },
> > -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> > +	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
> > +	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
> >  	{ NULL, },
> >  };
> >  
> > @@ -1687,6 +1698,8 @@ static void __init fixup_topology(void)
> >  	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
> >  		pr_info_once("Enabling Asymmetric SMT scheduling\n");
> >  		static_branch_enable(&powerpc_asym_packing);
> > +	} else if (is_shared_processor() && has_big_cores) {
> > +		static_branch_enable(&powerpc_asym_packing);
> >  	}
> >  
> >  #ifdef CONFIG_SCHED_SMT
> > -- 
> > 2.31.1
