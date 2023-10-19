Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258287CF1AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 09:51:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MGwUCsFG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB0Kd0GlNz3dfM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 18:51:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MGwUCsFG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB0Jl74Z8z3c4l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 18:51:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tj2sfG6o4PVcITUMHLw1E1ngyDfKo6Oj8GiFjy0BgNw=; b=MGwUCsFGHsUm4NlLV//62krFjB
	xxzTXL7q1nbTETm+09oFZdCY9Yn2LcPZ+/ybOPkIRt3oaCtB2X1rcv4uFs8IFhwJGkI/80lZ9xFZw
	IPdTLSUPa18/8IokSQZ5sWEbBgRFdPNldOBrMk6bsLDjFmkLgtdeyjWXVlwe5VonYLw8Wn/2GGWjl
	POg1CQmY3qtF8ec3kT7YGz/dNxWJUK7lIQatOtmtxAbdBxz/yPV8jmJayrFRfKKKue0RV63n38eip
	N1I16yGqj/UhG8efHYI12PM/yQpAPw4S5C0JzlfAwYYfGN+S7lGtQsNZ/jRrydziVa0ynelt9Y+z6
	84BSry3A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qtNnr-005qil-7D; Thu, 19 Oct 2023 07:50:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DDC6F300392; Thu, 19 Oct 2023 09:50:46 +0200 (CEST)
Date: Thu, 19 Oct 2023 09:50:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/6] powerpc/smp: Disable MC domain for shared
 processor
Message-ID: <20231019075046.GN33217@noisy.programming.kicks-ass.net>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-5-srikar@linux.vnet.ibm.com>
 <87pm1b5ia7.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm1b5ia7.fsf@mail.lhotse>
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

On Thu, Oct 19, 2023 at 03:48:48PM +1100, Michael Ellerman wrote:
> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > Like L2-cache info, coregroup information which is used to determine MC
> > sched domains is only present on dedicated LPARs. i.e PowerVM doesn't
> > export coregroup information for shared processor LPARs. Hence disable
> > creating MC domains on shared LPAR Systems.
> >
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/smp.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 498c2d51fc20..29da9262cb17 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -1046,6 +1046,10 @@ static struct cpumask *cpu_coregroup_mask(int cpu)
> >  
> >  static bool has_coregroup_support(void)
> >  {
> > +	/* Coregroup identification not available on shared systems */
> > +	if (is_shared_processor())
> > +		return 0;
> 
> That will catch guests running under KVM too right? Do we want that?

Some KVM people use vcpu pinning and pass-through topology things,
slice-of-hardware or something like that. In that scenario you actively
do want this.

I'm fairly clueless on when this is_shared_processor() gets to be true,
so that might already be dealt with.. 
